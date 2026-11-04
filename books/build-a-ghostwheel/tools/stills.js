#!/usr/bin/env node
// stills.js -- a few frames of the video, at twice the pixels, for a person to look at.
// Copyright 2026 Corwin Brust; GPL-3.0-or-later
//
// Reads $GW_OUT/slides.html and $GW_BUILD/<take>/timeline.json; writes
// $GW_OUT/stills/<take>-<n>-<page>.png at 3840x2160 (deviceScaleFactor 2).
// Each still is the moment halfway through one chosen line, drawn exactly as
// the frames stage draws it (the same zoom, light and lift).
'use strict';
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const BUILD = process.env.GW_BUILD || 'build';
const OUT = process.env.GW_OUT || '.';
const TAKE = process.env.GW_TAKE || '';
const tl = JSON.parse(fs.readFileSync(path.join(BUILD, TAKE || 'default', 'timeline.json'), 'utf8'));
// which moments: a shot, and the line to stand in (by who spoke it, or which fact it names)
const PICKS = [
  { shot: 'chad/picture', who: 'chad', nth: 1 },
  { shot: 'door/picture', at: 0.6 },
  { shot: 'door/fuller', fact: 'derive' },
  { shot: 'letters/fuller', fact: 'srow' },
];
const clamp = (x) => (x < 0 ? 0 : x > 1 ? 1 : x);
const ease = (x) => x * x * (3 - 2 * x);
const env = (t, s, e, rin, rout) => ease(clamp((t - s) / rin)) * ease(clamp((e + rout - t) / rout));

(async () => {
  const dir = path.join(OUT, 'stills');
  fs.mkdirSync(dir, { recursive: true });
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 1920, height: 1080 }, deviceScaleFactor: 2 });
  await page.goto('file://' + path.resolve(OUT, 'slides.html') + '?render');
  let n = 0;
  for (const pick of PICKS) {
    const shot = tl.shots.find((s) => s.id === pick.shot);
    if (!shot) continue;
    let t;
    if (pick.at !== undefined) t = shot.start + pick.at * (shot.end - shot.start);
    else {
      const ls = shot.lines.filter((l) => (pick.who ? l.who === pick.who : l.fact === pick.fact));
      const l = ls[Math.min(pick.nth || 0, ls.length - 1)];
      if (!l) continue;
      t = (l.start + l.end) / 2;
    }
    const facts = {}, who = {};
    for (const l of shot.lines) {
      if (l.fact) facts[l.fact] = Math.max(facts[l.fact] || 0, env(t, l.start - 0.1, l.end, 0.4, 0.7));
      const e = env(t, l.start, l.end, 0.15, 0.3);
      if (e > 0) who[l.who] = Math.max(who[l.who] || 0, e * 0.8);
    }
    const kb = clamp((t - shot.start) / (shot.end - shot.start));
    await page.evaluate((m) => window.deck.frame(m.shot, m.kb, m.t, m.facts, m.who), { shot: shot.id, kb, t, facts, who });
    const name = `${TAKE || 'x'}-${++n}-${shot.id.replace('/', '-')}.png`;
    await page.screenshot({ path: path.join(dir, name) });
    console.log(`stills: ${path.join(dir, name)}`);
  }
  await browser.close();
})().catch((e) => { console.error(e); process.exit(1); });
