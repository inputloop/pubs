#!/usr/bin/env node
// checks/deck.js -- the deck's promises that need a browser.
// Copyright 2026 Corwin Brust; GPL-3.0-or-later
//
//   node checks/deck.js offline slides.html   loads nothing but itself; no policy violations
//   node checks/deck.js keys slides.html      works with the keyboard; honours reduced motion
'use strict';
const { chromium } = require('playwright');
const path = require('path');
const [mode, file] = process.argv.slice(2);
const url = 'file://' + path.resolve(file);
const fail = [];
const say = (m) => console.log('  ' + m);

async function offline(browser) {
  const ctx = await browser.newContext();
  const page = await ctx.newPage();
  const asked = [];
  await ctx.route('**/*', (route) => {
    const u = route.request().url();
    asked.push(u);
    if (u.split('#')[0].split('?')[0] === url || u.startsWith('data:')) return route.continue();
    return route.abort();
  });
  page.on('console', (m) => { if (/Content Security Policy|Refused to/i.test(m.text())) fail.push('policy: ' + m.text().slice(0, 160)); });
  await page.goto(url, { waitUntil: 'load' });
  for (let i = 0; i < 8; i++) await page.keyboard.press('ArrowRight');
  await page.waitForTimeout(300);
  const other = asked.filter((u) => u.split('#')[0].split('?')[0] !== url && !u.startsWith('data:'));
  if (other.length) fail.push('asked for: ' + [...new Set(other)].slice(0, 3).join(', '));
  say(`requests: ${asked.length}, to anywhere but the deck itself: ${other.length}`);
  await ctx.close();
}

async function keys(browser) {
  const ctx = await browser.newContext({ viewport: { width: 1280, height: 800 }, reducedMotion: 'no-preference' });
  const page = await ctx.newPage();
  const errs = [];
  page.on('pageerror', (e) => errs.push(e.message));
  await page.goto(url);
  const idx = () => page.evaluate(() => (window.deck ? window.deck.index : -1));
  const n = await page.evaluate(() => (window.deck ? window.deck.count : 0));
  const expect = async (what, want) => { const got = await idx(); if (got !== want) fail.push(`${what}: page ${got}, wanted ${want}`); };
  await expect('on opening', 0);
  await page.keyboard.press('ArrowRight'); await expect('ArrowRight', 1);
  await page.keyboard.press('PageDown'); await expect('PageDown', 2);
  await page.keyboard.press('ArrowLeft'); await expect('ArrowLeft', 1);
  await page.keyboard.press('End'); await expect('End', n - 1);
  await page.keyboard.press('ArrowRight'); await expect('ArrowRight at the end stays', n - 1);
  await page.keyboard.press('Home'); await expect('Home', 0);
  await page.keyboard.press('Space'); await expect('Space', 1);
  await page.keyboard.press('4'); await expect('the 4 key', 3);
  const live = await page.evaluate(() => document.getElementById('live').textContent);
  if (!/Page 4 of/.test(live)) fail.push(`the live region says "${live}", wanted "Page 4 of ..."`);
  // a fact mark opens with Enter and closes with Escape, and focus comes home
  const mark = page.locator('.step[data-pos="0"] .mark').first();
  if (await mark.count()) {
    await mark.focus();
    await page.keyboard.press('Enter');
    const open = await page.evaluate(() => { const b = document.activeElement.closest('.witness'); return !!b && !b.hidden; });
    if (!open) fail.push('Enter on a fact mark did not open its witness rows');
    await page.keyboard.press('Escape');
    const back = await page.evaluate(() => document.activeElement.classList.contains('mark') && document.querySelectorAll('.witness:not([hidden])').length === 0);
    if (!back) fail.push('Escape did not close the witness rows and return focus to the mark');
  } else fail.push('page 4 has no fact mark to try');
  // the visible buttons work by click too
  await page.click('#next'); await expect('the Next button', 4);
  await page.click('#prev'); await expect('the Back button', 3);
  const moving = await page.evaluate(() => document.getAnimations().length);
  if (moving === 0) fail.push('with motion allowed, nothing moves (so the reduced-motion test below would prove nothing)');
  await ctx.close();

  const still = await browser.newContext({ viewport: { width: 1280, height: 800 }, reducedMotion: 'reduce' });
  const p2 = await still.newPage();
  await p2.goto(url);
  await p2.keyboard.press('ArrowRight');
  const r = await p2.evaluate(() => ({
    anims: document.getAnimations().length,
    trans: getComputedStyle(document.querySelector('.step')).transitionDuration,
    bob: (document.querySelector('.bob') && getComputedStyle(document.querySelector('.bob')).animationName) || 'none',
  }));
  if (r.anims !== 0) fail.push(`with reduced motion asked for, ${r.anims} animations still run`);
  if (!/^0s(, 0s)*$/.test(r.trans)) fail.push(`with reduced motion asked for, pages still slide (${r.trans})`);
  if (r.bob !== 'none') fail.push('with reduced motion asked for, the figures still bob');
  say(`keyboard: ${n} pages, arrows, Page keys, Space, Home, End, numbers, Enter and Escape on a mark; motion allowed: ${moving} animations; reduced: ${r.anims}`);
  if (errs.length) fail.push('page errors: ' + errs.join('; '));
  await still.close();
}

(async () => {
  const browser = await chromium.launch();
  if (mode === 'offline') await offline(browser);
  else if (mode === 'keys') await keys(browser);
  else { console.error('deck.js: mode is offline or keys'); process.exit(2); }
  await browser.close();
  for (const f of fail) say('FAIL ' + f);
  process.exit(fail.length ? 1 : 0);
})().catch((e) => { console.error('  ' + e.message); process.exit(1); });
