#!/usr/bin/env node
// checks/book.js -- the picture book's promises that need a browser.
// Copyright 2026 Corwin Brust; GPL-3.0-or-later
//
//   node checks/book.js read book.html     every reading promise below; exit 1 if any fails
//   node checks/book.js read book.html P   only promise P (facing, title, keys, map, forget,
//                                          lost, motion, narrow, figures, fit)
//
// The promises, from Corwin's tuning (2026-11-03 17:48):
//   facing   the first opening is the title page with the dedication facing it; after that,
//            two facing pages at a time on a wide screen
//   title    the title is lettered into the title page's drawing and not repeated in its words
//   keys     arrows, Home and End turn the pages; M opens the map; Escape closes it and gives
//            focus back
//   map      every room of the book is on the map, and choosing one goes there
//   lost     someone who pages back and forth is offered the map
//   motion   with reduced motion asked for, nothing animates
//   narrow   a narrow screen shows one page at a time
//   figures  no word on a picture page sits on Spoke, Pin or Chad, or off its page
//   fit      every fuller page holds its words without scrolling, on a wide screen
//   forget   opening the map stores nothing; a picked view is stored; Forget my settings removes
//            every gwbook. key and says so; #privacy opens the map at the note (2026-11-04)
'use strict';
const { chromium } = require('playwright');
const path = require('path');
const [mode, file, only] = process.argv.slice(2);
const url = 'file://' + path.resolve(file);
const fail = [];
const say = (m) => console.log('  ' + m);
const want = (p) => !only || only === p;

async function open(browser, opts) {
  const ctx = await browser.newContext(Object.assign({ viewport: { width: 1600, height: 900 } }, opts || {}));
  const page = await ctx.newPage();
  page.on('pageerror', (e) => fail.push('script error: ' + String(e).slice(0, 160)));
  await page.goto(url, { waitUntil: 'load' });
  await page.waitForFunction(() => window.book && typeof window.book.go === 'function');
  return { ctx, page };
}
const visible = (page) => page.evaluate(() => [].slice.call(document.querySelectorAll('.book .page'))
  .map((p, i) => [i, p]).filter(([, p]) => getComputedStyle(p).display !== 'none').map(([i]) => i));

async function facing(browser) {
  const { ctx, page } = await open(browser);
  const v0 = await visible(page);
  const first = await page.evaluate(() => {
    const ps = document.querySelectorAll('.book .page');
    return { title: !!ps[0].querySelector('h1'), ded: ps[1].classList.contains('dedpage'), n: ps.length };
  });
  if (v0.join() !== '0,1') fail.push('facing: the first opening shows pages ' + v0.join(',') + ', not 0,1');
  if (!first.title || !first.ded) fail.push('facing: the first opening is not the title page and the dedication');
  let bad = 0, views = 0;
  for (let k = 0; k < first.n / 2 + 1; k++) {
    const v = await visible(page);
    views++;
    if (v.length !== 2 || v[0] % 2 !== 0 || v[1] !== v[0] + 1) { bad++; if (bad < 3) fail.push('facing: an opening shows pages ' + v.join(',')); }
    const was = await page.evaluate(() => window.book.page);
    await page.keyboard.press('ArrowRight');
    if (await page.evaluate(() => window.book.page) === was) break;
  }
  say(`facing: ${views} openings, each two facing pages; the first is the title page and the dedication`);
  await ctx.close();
}

async function title(browser) {
  const { ctx, page } = await open(browser);
  const r = await page.evaluate(() => {
    const t = (document.querySelector('meta[name=description]').content || '').split('?')[0].trim();
    const tp = document.querySelector('.titlepage');
    if (!tp) return { err: 'no title page' };
    const lettered = [].slice.call(tp.querySelectorAll('svg text, svg textPath')).some((e) => e.textContent.indexOf(t) >= 0);
    const words = [].slice.call(tp.querySelectorAll('.words')).map((w) => w.textContent).join(' ');
    return { t, lettered, repeated: words.indexOf(t) >= 0 };
  });
  if (r.err) fail.push('title: ' + r.err);
  else {
    if (!r.lettered) fail.push('title: the title is not lettered into the title page drawing');
    if (r.repeated) fail.push('title: the title is repeated in the title page words');
    say(`title: "${r.t}?" lettered in the drawing ${r.lettered ? 'yes' : 'NO'}; repeated in the words ${r.repeated ? 'YES' : 'no'}`);
  }
  await ctx.close();
}

async function keys(browser) {
  const { ctx, page } = await open(browser);
  const at = () => page.evaluate(() => window.book.page);
  await page.keyboard.press('ArrowRight'); const a = await at();
  await page.keyboard.press('End'); const e = await at();
  await page.keyboard.press('ArrowLeft'); const l = await at();
  await page.keyboard.press('Home'); const h = await at();
  const n = await page.evaluate(() => window.book.count);
  if (a !== 2) fail.push('keys: ArrowRight went to page ' + a + ', not 2');
  if (e < n - 2) fail.push('keys: End went to page ' + e + ' of ' + n);
  if (l >= e) fail.push('keys: ArrowLeft did not go back');
  if (h !== 0) fail.push('keys: Home went to page ' + h);
  await page.focus('#next');
  await page.keyboard.press('m');
  const opened = await page.evaluate(() => !document.getElementById('mapwin').hidden && document.activeElement.id === 'map-h');
  await page.keyboard.press('Escape');
  const closed = await page.evaluate(() => document.getElementById('mapwin').hidden && document.activeElement.id === 'next');
  if (!opened) fail.push('keys: M did not open the map with focus on its heading');
  if (!closed) fail.push('keys: Escape did not close the map and give focus back');
  say(`keys: right ${a}, End ${e}, left ${l}, Home ${h}; M opens the map ${opened ? 'yes' : 'NO'}, Escape closes it ${closed ? 'yes' : 'NO'}`);
  await ctx.close();
}

async function map(browser) {
  const { ctx, page } = await open(browser);
  const r = await page.evaluate(() => {
    const onPages = [...new Set([].slice.call(document.querySelectorAll('.book .page')).map((p) => p.getAttribute('data-room')))];
    const onMap = [].slice.call(document.querySelectorAll('#mapwin .look-plan a.room')).map((a) => a.getAttribute('data-room'));
    const board = [].slice.call(document.querySelectorAll('#mapwin .look-board a.room')).map((a) => a.getAttribute('data-room'));
    const tiles = [].slice.call(document.querySelectorAll('#mapwin .look-tiles a.room')).map((a) => a.getAttribute('data-room'));
    return { onPages, onMap, board, tiles };
  });
  const missing = r.onPages.filter((x) => r.onMap.indexOf(x) < 0), extra = r.onMap.filter((x) => r.onPages.indexOf(x) < 0);
  if (missing.length) fail.push('map: rooms not on the map: ' + missing.join(', '));
  if (extra.length) fail.push('map: map rooms with no page: ' + extra.join(', '));
  if (r.board.join() !== r.onMap.join() || r.tiles.join() !== r.onMap.join()) fail.push('map: the three looks do not hold the same rooms');
  // choose the room in the middle, on the board, and see that we go there
  const pick = r.onMap[Math.floor(r.onMap.length / 2)];
  await page.keyboard.press('m');
  await page.click('#mapwin .looks button[data-look="board"]');
  await page.click(`#mapwin .look-board a.room[data-room="${pick}"]`);
  const there = await page.evaluate(() => document.querySelectorAll('.book .page')[window.book.page].getAttribute('data-room'));
  const shut = await page.evaluate(() => document.getElementById('mapwin').hidden);
  if (there !== pick || !shut) fail.push(`map: choosing "${pick}" went to "${there}"${shut ? '' : ' and left the map open'}`);
  say(`map: ${r.onMap.length} rooms, the same in plan, tiles and board; choosing "${pick}" went to "${there}"`);
  await ctx.close();
}

// forget: the privacy note's promises (Corwin, 2026-11-04: "keep on-device remembering, and say so
// ... with a one-press 'forget my settings'"). Opening the map stores nothing; picking a view stores
// it; Forget my settings removes every key the book wrote and says so; #privacy opens the map at the note.
async function forget(browser) {
  const { ctx, page } = await open(browser);
  const keys = () => page.evaluate(() => { const k = []; for (let i = 0; i < localStorage.length; i++) k.push(localStorage.key(i)); return k.filter((x) => x.indexOf('gwbook.') === 0); });
  await page.keyboard.press('m');
  const afterOpen = await keys();
  if (afterOpen.length) fail.push('forget: opening the map stored ' + afterOpen.join(', ') + ' before any view was picked');
  await page.click('#mapwin .looks button[data-look="tiles"]');
  const stored = await page.evaluate(() => localStorage.getItem('gwbook.look'));
  if (stored !== 'tiles') fail.push(`forget: picking Tiles stored "${stored}", not "tiles"`);
  await page.click('#forget');
  const left = await keys();
  const said = (await page.textContent('#forgot')).trim();
  if (left.length) fail.push('forget: Forget my settings left ' + left.join(', '));
  if (!/forgotten/i.test(said)) fail.push(`forget: Forget my settings did not say so (it said "${said}")`);
  await ctx.close();
  const c2 = await browser.newContext({ viewport: { width: 1600, height: 900 } });
  const p2 = await c2.newPage();
  await p2.goto(url + '#privacy', { waitUntil: 'load' });
  await p2.waitForFunction(() => window.book && typeof window.book.go === 'function');
  const at = await p2.evaluate(() => ({ open: !document.getElementById('mapwin').hidden, focus: document.activeElement && document.activeElement.id }));
  if (!at.open || at.focus !== 'privacy') fail.push(`forget: #privacy left the map ${at.open ? 'open' : 'shut'} with focus on "${at.focus}"`);
  say(`forget: opening the map stored ${afterOpen.length ? afterOpen.join(', ') : 'nothing'}; picking Tiles stored gwbook.look = ${stored}; ` +
      `Forget left ${left.length ? left.join(', ') : 'nothing'} and said "${said}"; #privacy opens the map at the note ${at.open && at.focus === 'privacy' ? 'yes' : 'NO'}`);
  await c2.close();
}

async function lost(browser) {
  const { ctx, page } = await open(browser);
  await page.keyboard.press('ArrowRight'); await page.keyboard.press('ArrowRight');
  for (let i = 0; i < 3; i++) { await page.keyboard.press('ArrowLeft'); await page.keyboard.press('ArrowRight'); }
  const shown = await page.evaluate(() => !document.getElementById('nudge').hidden);
  if (!shown) fail.push('lost: paging back and forth six times did not offer the map');
  say(`lost: paging back and forth offers the map ${shown ? 'yes' : 'NO'}`);
  await ctx.close();
}

async function motion(browser) {
  const { ctx, page } = await open(browser, { reducedMotion: 'reduce' });
  await page.keyboard.press('ArrowRight');
  const r = await page.evaluate(() => {
    const p = document.querySelector('.book .page.on');
    return { anim: getComputedStyle(p).animationName, dur: getComputedStyle(p).animationDuration };
  });
  if (r.anim !== 'none' && r.dur !== '0s') fail.push('motion: with reduced motion asked for, the page still animates (' + r.anim + ' ' + r.dur + ')');
  say(`motion: reduced motion asked for; the turning page animates: ${r.anim === 'none' || r.dur === '0s' ? 'no' : 'YES'}`);
  await ctx.close();
}

async function narrow(browser) {
  const { ctx, page } = await open(browser, { viewport: { width: 390, height: 844 }, isMobile: true, hasTouch: true });
  const v0 = await visible(page);
  await page.click('#next');
  const v1 = await visible(page);
  if (v0.join() !== '0' || v1.join() !== '1') fail.push('narrow: a phone shows pages ' + v0.join(',') + ' then ' + v1.join(',') + ', not 0 then 1');
  say(`narrow: on a phone, pages ${v0.join(',')} then ${v1.join(',')}`);
  await ctx.close();
}

async function figures(browser) {
  const { ctx, page } = await open(browser);
  const n = await page.evaluate(() => window.book.count);
  let checked = 0;
  for (let p = 0; p < n; p += 2) {
    await page.evaluate((p) => window.book.go(p, true), p);
    const r = await page.evaluate(() => {
      const out = [], seen = [];
      const hit = (a, b) => a.left < b.right && b.left < a.right && a.top < b.bottom && b.top < a.bottom;
      [].slice.call(document.querySelectorAll('.book .picpage.on')).forEach((pg) => {
        const box = pg.getBoundingClientRect();
        const figs = [].slice.call(pg.querySelectorAll('.fig')).map((f) => {
          const r = f.getBoundingClientRect(), dx = r.width * 0.12, dy = r.height * 0.1;   // the drawn body, not its shadow
          return { who: f.getAttribute('data-who'), left: r.left + dx, right: r.right - dx, top: r.top + dy, bottom: r.bottom - dy };
        });
        const lines = [];
        [].slice.call(pg.querySelectorAll('.words p')).forEach((el) => {
          const rg = document.createRange(); rg.selectNodeContents(el);
          [].slice.call(rg.getClientRects()).forEach((r) => { if (r.width > 2) lines.push({ text: el.textContent.slice(0, 30), r }); });
        });
        lines.forEach(({ text, r }) => {
          if (r.left < box.left - 1 || r.right > box.right + 1 || r.top < box.top - 1 || r.bottom > box.bottom + 1)
            out.push(`${pg.id}: "${text}" runs off its page`);
          figs.forEach((f) => { if (hit(r, f)) out.push(`${pg.id}: "${text}" sits on ${f.who}`); });
        });
        seen.push(pg.id);
      });
      return { out, seen };
    });
    checked += r.seen.length;
    r.out.forEach((m) => fail.push('figures: ' + m));
  }
  say(`figures: ${checked} picture pages; every word clear of Spoke, Pin and Chad, and on its page`);
  await ctx.close();
}

async function fit(browser) {
  const { ctx, page } = await open(browser);
  const n = await page.evaluate(() => window.book.count);
  let checked = 0;
  for (let p = 0; p < n; p += 2) {
    await page.evaluate((p) => window.book.go(p, true), p);
    const r = await page.evaluate(() => [].slice.call(document.querySelectorAll('.book .page.on .inner[data-fs]')).map((i) => ({
      id: i.parentElement.id || i.parentElement.getAttribute('aria-label'), over: i.scrollHeight - i.clientHeight,
      fs: getComputedStyle(i).getPropertyValue('--fs') })));
    r.forEach((x) => { checked++; if (x.over > 2) fail.push(`fit: ${x.id} runs ${x.over}px past its page (type at ${x.fs})`); });
  }
  say(`fit: ${checked} text pages, each holding its words on a wide screen`);
  await ctx.close();
}

(async () => {
  if (mode !== 'read') { console.error('usage: book.js read FILE [PROMISE]'); process.exit(2); }
  const browser = await chromium.launch();
  try {
    for (const [name, fn] of [['facing', facing], ['title', title], ['keys', keys], ['map', map], ['forget', forget],
      ['lost', lost], ['motion', motion], ['narrow', narrow], ['figures', figures], ['fit', fit]]) if (want(name)) await fn(browser);
  } catch (e) { fail.push('the check itself failed: ' + String(e).slice(0, 200)); }
  await browser.close();
  fail.forEach((m) => say('FAIL ' + m));
  process.exit(fail.length ? 1 : 0);
})();
