#!/usr/bin/env node
// frames.js -- slides to frames: draw every video frame from the deck itself.
// Copyright 2026 Corwin Brust; GPL-3.0-or-later
//
// Reads:  $GW_OUT/slides.html, $GW_BUILD/<take>/timeline.json
// Writes: $GW_BUILD/<take>/frames/<n>/f00000.jpg ...  one folder per shot
//         $GW_BUILD/<take>/segments.txt               what the mp4 stage joins
//
// Each shot's frames run a little past its narration on both sides, so that
// neighbouring shots overlap by one crossfade, centred on the boundary.
// Movement, all gentle: a slow zoom over each picture (--kb), the figures'
// own idle motion, the fact being spoken lit on the page and in the diagram,
// and a small lift for whoever is talking.
// Settings: GW_FPS (25), GW_XFADE seconds (0.8), GW_WIDTH x GW_HEIGHT (1920x1080),
// GW_JOBS pages drawn at once (2), GW_QUALITY jpeg quality (90).
'use strict';
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const BUILD = process.env.GW_BUILD || 'build';
const OUT = process.env.GW_OUT || '.';
const TAKE = process.env.GW_TAKE || '';
const FPS = +(process.env.GW_FPS || 25);
const XF = +(process.env.GW_XFADE || 0.8);
const W = +(process.env.GW_WIDTH || 1920), H = +(process.env.GW_HEIGHT || 1080);
const JOBS = +(process.env.GW_JOBS || 2);
const Q = +(process.env.GW_QUALITY || 90);

const dir = path.join(BUILD, TAKE || 'default');
const tl = JSON.parse(fs.readFileSync(path.join(dir, 'timeline.json'), 'utf8'));
const deck = 'file://' + path.resolve(OUT, 'slides.html') + '?render';

const shots = tl.shots;
const total = Math.round(tl.total * FPS);
const half = Math.round((XF * FPS) / 2);
const segs = shots.map((s, k) => ({
  k, shot: s,
  a: k === 0 ? 0 : Math.round(s.start * FPS) - half,
  b: k === shots.length - 1 ? total : Math.round(shots[k + 1].start * FPS) + half,
}));

const clamp = (x) => (x < 0 ? 0 : x > 1 ? 1 : x);
const ease = (x) => x * x * (3 - 2 * x);
// how lit something is at time t, for a span [s, e]: in over rin, out over rout
const env = (t, s, e, rin, rout) => ease(clamp((t - s) / rin)) * ease(clamp((e + rout - t) / rout));

function moment(seg, g) {
  const t = g / FPS;
  const kb = (g - seg.a) / Math.max(1, seg.b - seg.a);
  const facts = {}, who = {};
  for (const ln of seg.shot.lines) {
    if (ln.fact) facts[ln.fact] = Math.max(facts[ln.fact] || 0, env(t, ln.start - 0.1, ln.end, 0.4, 0.7));
    const e = env(t, ln.start, ln.end, 0.15, 0.3);
    if (e > 0) who[ln.who] = Math.max(who[ln.who] || 0, e * (0.65 + 0.35 * Math.abs(Math.sin(Math.PI * 1.8 * (t - ln.start)))));
  }
  return { shot: seg.shot.id, kb, t, facts, who };
}

(async () => {
  const fdir = path.join(dir, 'frames');
  fs.rmSync(fdir, { recursive: true, force: true });
  const browser = await chromium.launch();
  const queue = segs.slice();
  let drawn = 0;
  const t0 = Date.now();
  async function worker() {
    const ctx = await browser.newContext({ viewport: { width: W, height: H }, deviceScaleFactor: 1, reducedMotion: 'no-preference' });
    const page = await ctx.newPage();
    page.on('pageerror', (e) => { console.error('frames: page error:', e.message); process.exitCode = 1; });
    await page.goto(deck);
    await page.evaluate(() => document.fonts.ready);
    for (let seg; (seg = queue.shift());) {
      const sd = path.join(fdir, String(seg.k));
      fs.mkdirSync(sd, { recursive: true });
      for (let g = seg.a; g < seg.b; g++) {
        const m = moment(seg, g);
        await page.evaluate((m) => window.deck.frame(m.shot, m.kb, m.t, m.facts, m.who), m);
        await page.screenshot({ path: path.join(sd, 'f' + String(g - seg.a).padStart(5, '0') + '.jpg'), type: 'jpeg', quality: Q });
        if (++drawn % 500 === 0) console.log(`frames: ${drawn} drawn, ${((Date.now() - t0) / 1000).toFixed(0)} s`);
      }
    }
    await ctx.close();
  }
  await Promise.all(Array.from({ length: Math.min(JOBS, segs.length) }, worker));
  await browser.close();
  const lines = [`fps ${FPS} xfade ${(2 * half) / FPS} frames ${total} width ${W} height ${H}`];
  for (const s of segs) lines.push(`seg ${path.join(fdir, String(s.k))} ${s.b - s.a} ${(s.a / FPS).toFixed(6)} ${s.shot.id}`);
  fs.writeFileSync(path.join(dir, 'segments.txt'), lines.join('\n') + '\n');
  console.log(`frames: take ${TAKE || '-'}: ${drawn} frames in ${segs.length} shots, ${((Date.now() - t0) / 1000).toFixed(0)} s`);
})().catch((e) => { console.error(e); process.exit(1); });
