#!/usr/bin/env python3
# slides.py -- source to slides: one self-contained HTML deck.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Reads the book, its spreads and src/figures.svg; writes $GW_OUT/slides.html.
# One visualization at a time, centred like a lens (the pages either side wait,
# dimmed, at the edges). Arrow keys, Page Up/Down, Space, Home/End and number
# keys step through it; so do the buttons and the dimmed neighbours. Each fact
# mark opens its witness rows. Nothing loads from anywhere: the Content Security
# Policy allows only this file's own style and script, by hash.
# With ?render in the address it shows one page full-frame for the frames stage,
# and window.deck.frame() sets the moment to draw.

import base64
import hashlib
import html
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spread  # noqa: E402

E = html.escape
PALETTE = ["#e76f51", "#2a9d8f", "#e9c46a", "#8ab17d", "#457b9d", "#f4a261", "#6d6875"]


# ---------------------------------------------------------------- figures
def load_figures():
    with open(os.path.join(spread.SRC, "figures.svg"), encoding="utf-8") as fh:
        f = fh.read()
    defs = re.search(r'<defs id="fig-defs">(.*?)</defs>', f, re.S).group(1)
    figs = {m.group(1): m.group(2) for m in re.finditer(r'<g id="fig-([\w-]+)">(.*?)</g><!-- end \1 -->', f, re.S)}
    return defs, figs


def place_figures(svg, figs, suffix=""):
    def sub(m):
        name, attrs = m.group(1), m.group(2)
        if name not in figs:
            raise SystemExit(f"slides: picture asks for figure '{name}', which src/figures.svg does not draw")
        return f'<g{attrs}><g class="fig fig-{name}" data-who="{name}">{figs[name]}</g></g>'
    svg = re.sub(r'<g data-figure="([\w-]+)"([^>]*)></g>', sub, svg)
    if suffix:  # a second copy of the same picture needs its own ids
        svg = re.sub(r'\bid="([^"]+)"', lambda m: f'id="{m.group(1)}{suffix}"', svg)
        svg = re.sub(r'aria-labelledby="([^"]+)"', lambda m: f'aria-labelledby="{m.group(1)}{suffix}"', svg)
    if re.search(r'\sstyle\s*=|\son[a-z]+\s*=', svg, re.I):
        raise SystemExit("slides: a picture carries a style= or on...= attribute; the deck's CSP forbids them")
    svg = re.sub(r"<svg ", '<svg class="pic" focusable="false" ', svg, count=1)
    return svg


# ---------------------------------------------------------------- diagrams
def diagram_rings(d):
    hosts, reserve, many = int(d.get("hosts", 17)), int(d.get("reserve", 2)), int(d.get("many", 3))
    ringed = hosts - reserve
    big = ringed // many            # size of each greater ring
    if big * many != ringed:
        raise SystemExit("slides: rings diagram: (hosts - reserve) is not divisible by many")
    W, H = 900, 300
    out = [f'<svg class="dia" viewBox="0 0 {W} {H}" role="img" aria-labelledby="dia-rings-t" focusable="false">',
           f'<title id="dia-rings-t">{hosts} computers: {many} rings of {big}; the same {ringed} also make {big} rings of {many}; {reserve} wait at the edge.</title>',
           f'<g data-focus="edge"><rect x="12" y="14" width="{W-24}" height="{H-52}" rx="26" class="edge"/>'
           f'<text x="34" y="40" class="dl">edge ring: all {hosts}</text></g>']
    import math
    cx0, step, cy, r = 150, 250, 158, 78
    for g in range(many):
        cx = cx0 + g * step
        pts = [(cx + r * math.sin(2 * math.pi * i / big), cy - r * math.cos(2 * math.pi * i / big)) for i in range(big)]
        path = "M " + " L ".join(f"{x:.1f},{y:.1f}" for x, y in pts) + " Z"
        out.append(f'<g data-focus="rings derive hosts"><path d="{path}" class="ringline"/></g>')
        for i, (x, y) in enumerate(pts):
            out.append(f'<g data-focus="lesser hosts" transform="translate({x:.1f} {y:.1f})">'
                       f'<rect x="-17" y="-13" width="34" height="26" rx="6" fill="{PALETTE[i % len(PALETTE)]}" class="node"/>'
                       f'<rect x="-11" y="-8" width="22" height="13" rx="3" class="scr"/></g>')
        out.append(f'<text x="{cx}" y="{cy+5}" class="dn" text-anchor="middle">{big}</text>')
    sx = cx0 + many * step - 66
    for j in range(reserve):
        out.append(f'<g data-focus="derive hosts" transform="translate({sx} {110 + j*62})">'
                   f'<rect x="-17" y="-13" width="34" height="26" rx="6" class="node spare"/></g>')
    out.append(f'<text x="{sx}" y="208" class="dl" text-anchor="middle">{reserve} aside:</text>')
    out.append(f'<text x="{sx}" y="226" class="dl" text-anchor="middle">build, test</text>')
    # legend: the rings of three
    lx = 34
    out.append(f'<text x="{lx}" y="{H-12}" class="dl">rings of {many}:</text>')
    for i in range(big):
        out.append(f'<rect x="{lx + 118 + i*30}" y="{H-27}" width="20" height="16" rx="4" fill="{PALETTE[i % len(PALETTE)]}" class="node"/>')
    out.append(f'<text x="{lx + 118 + big*30 + 12}" y="{H-12}" class="dl">same colour, same ring</text>')
    out.append("</svg>")
    return "\n".join(out)


def diagram_grid(d):
    rows = [r for r in d["rows"] if r]
    labels = d.get("label", "").split()
    show = d.get("show", "").split()
    dim = d.get("dim", "").split()
    W, H = 900, 336
    n = len(rows)
    tw, gap = 46, 6
    x0 = (W - (n * tw + (n - 1) * gap)) / 2
    common = {"ASSET", "OBFUSCATE", "SPOKE", "TAXONOMY"}
    out = [f'<svg class="dia" viewBox="0 0 {W} {H}" role="img" aria-labelledby="dia-grid-t" focusable="false">',
           f'<title id="dia-grid-t">{n} letters: {" ".join(r[0] for r in rows)}. Below them, {len(dim)} more: {" ".join(dim)}.</title>',
           f'<text x="{x0}" y="22" class="dl">{n} rooms, one line each in m/t</text>']
    for i, r in enumerate(rows):
        x = x0 + i * (tw + gap)
        foc = "seventeen"
        if any(w in common for w in r[1:]):
            foc += " common"
        out.append(f'<g data-focus="{foc}"><rect x="{x:.1f}" y="32" width="{tw}" height="{tw}" rx="9" fill="{PALETTE[i % len(PALETTE)]}" class="tile"/>'
                   f'<text x="{x + tw/2:.1f}" y="{32 + tw/2 + 9:.1f}" text-anchor="middle" class="tl">{E(r[0])}</text>'
                   f'<title>{E(" ".join(r))}</title></g>')
    # the rows shown in full
    by = {r[0]: r for r in rows}
    cw, cx0 = 176, 120
    out.append('<g data-focus="faces">' + "".join(
        f'<text x="{cx0 + k*(cw+8) + cw/2:.0f}" y="112" text-anchor="middle" class="dh">{E(lab.lower())}</text>'
        for k, lab in enumerate(labels)) + "</g>")
    for j, letter in enumerate(show):
        r = by.get(letter)
        if not r:
            continue
        y = 124 + j * 50
        i = [q[0] for q in rows].index(letter)
        out.append(f'<g data-focus="srow"><rect x="56" y="{y}" width="40" height="40" rx="8" fill="{PALETTE[i % len(PALETTE)]}" class="tile"/>'
                   f'<text x="76" y="{y + 28}" text-anchor="middle" class="tl">{E(letter)}</text></g>')
        for k, w in enumerate(r[1:5]):
            cls = "cell" + (" own" if w == "SPOKE" else "")
            foc = "srow" + (" common" if w in common else "")
            out.append(f'<g data-focus="{foc}"><rect x="{cx0 + k*(cw+8)}" y="{y}" width="{cw}" height="40" rx="8" class="{cls}"/>'
                       f'<text x="{cx0 + k*(cw+8) + cw/2:.0f}" y="{y + 27}" text-anchor="middle" class="cw">{E(w)}</text></g>')
    if dim:
        y = 252
        dx0 = (W - (len(dim) * tw + (len(dim) - 1) * gap)) / 2
        out.append(f'<g data-focus="nine"><text x="{dx0}" y="{y - 6}" class="dl">{len(dim)} more, which hold values and force stops (m/v/t)</text>')
        for i, letter in enumerate(dim):
            x = dx0 + i * (tw + gap)
            out.append(f'<rect x="{x:.1f}" y="{y + 4}" width="{tw}" height="{tw}" rx="9" class="tile dim"/>'
                       f'<text x="{x + tw/2:.1f}" y="{y + 4 + tw/2 + 9:.1f}" text-anchor="middle" class="tl tdim">{E(letter)}</text>')
        out.append("</g>")
    out.append("</svg>")
    return "\n".join(out)


def _wrap(text, n):
    """Break text into lines of at most about n characters (SVG text does not wrap)."""
    lines, cur = [], ""
    for w in text.split():
        if cur and len(cur) + 1 + len(w) > n:
            lines.append(cur)
            cur = w
        else:
            cur = (cur + " " + w).strip()
    if cur:
        lines.append(cur)
    return lines or [""]


def _cells(d):
    return [[c.strip() for c in " ".join(r).split("|")] for r in d["rows"] if r]


def diagram_ladder(d):
    """Floors of a ladder, top first: rows 'N | label | note'; focus: N lights a rung."""
    rows, focus = _cells(d), d.get("focus", "").split()
    if not rows:
        raise SystemExit("slides: ladder diagram has no rows")
    W, y, body = 900, 8, []
    for i, r in enumerate(rows):
        n, label, note = (r + ["", "", ""])[:3]
        nl = _wrap(note, 46) if note else []
        h = max(54, 22 + 22 * max(1, len(nl)))
        lit = " lit" if n in focus else ""
        g = (f'<g data-focus="{E(n)}" class="rung{lit}"><rect x="8" y="{y}" width="{W - 16}" height="{h - 8}" rx="10" class="floor"/>'
             f'<rect x="8" y="{y}" width="62" height="{h - 8}" rx="10" fill="{PALETTE[i % len(PALETTE)]}" class="tile"/>'
             f'<text x="39" y="{y + (h - 8) / 2 + 9:.1f}" text-anchor="middle" class="tl">{E(n)}</text>'
             f'<text x="86" y="{y + (h - 8) / 2 + 7:.1f}" class="cw">{E(label)}</text>')
        for k, ln in enumerate(nl):
            g += f'<text x="350" y="{y + 26 + 22 * k}" class="dl">{E(ln)}</text>'
        body.append(g + "</g>")
        y += h
    title = "; ".join(f"{r[0]}: {r[1] if len(r) > 1 else ''}" for r in rows)
    return (f'<svg class="dia" viewBox="0 0 {W} {y + 4}" role="img" aria-labelledby="dia-ladder-t" focusable="false">'
            f'<title id="dia-ladder-t">A ladder, top first. {E(title)}.</title>' + "".join(body) + "</svg>")


def diagram_pair(d):
    """Two witnesses side by side: left: and right: titles, rows 'left text | right text'."""
    rows = _cells(d)
    if not rows:
        raise SystemExit("slides: pair diagram has no rows")
    W, x1, x2, cw = 900, 10, 460, 430
    out = [f'<text x="{x1 + 8}" y="26" class="dh">{E(d.get("left", ""))}</text>',
           f'<text x="{x2 + 8}" y="26" class="dh">{E(d.get("right", ""))}</text>']
    y = 38
    for r in rows:
        a, b = (r + ["", ""])[:2]
        la, lb = _wrap(a, 40), _wrap(b, 40)
        h = 18 + 21 * max(len(la), len(lb))
        own = " own" if a.lower() != b.lower() else ""
        out.append(f'<g data-focus="pair"><rect x="{x1}" y="{y}" width="{cw}" height="{h}" rx="9" class="cell{own}"/>'
                   f'<rect x="{x2}" y="{y}" width="{cw}" height="{h}" rx="9" class="cell{own}"/>')
        for k, ln in enumerate(la):
            out.append(f'<text x="{x1 + 14}" y="{y + 25 + 21 * k}" class="cw">{E(ln)}</text>')
        for k, ln in enumerate(lb):
            out.append(f'<text x="{x2 + 14}" y="{y + 25 + 21 * k}" class="cw">{E(ln)}</text>')
        out.append("</g>")
        y += h + 8
    t = f'Two columns, {E(d.get("left", ""))} and {E(d.get("right", ""))}: ' + "; ".join(f"{E(a)} / {E(b)}" for a, b in ((r + ["", ""])[:2] for r in rows))
    return (f'<svg class="dia" viewBox="0 0 {W} {y}" role="img" aria-labelledby="dia-pair-t" focusable="false">'
            f'<title id="dia-pair-t">{t}</title>' + "".join(out) + "</svg>")


DIAGRAMS = {"rings": diagram_rings, "grid": diagram_grid, "ladder": diagram_ladder, "pair": diagram_pair}


# ---------------------------------------------------------------- pages
def easy_page(sp, size="solo"):
    return "".join(f"<p>{E(p)}</p>" for p in sp["picture_page"])


def witness_html(sp, fid, rows, num):
    hands = {r.get("by", "") for r in rows}
    dag = '<p class="dagger">† One hand only: every row here was written by the same witness.</p>' if len(hands) < 2 else \
          f'<p class="dagger two">Two or more hands ({len(hands)}). Where they differ, both are kept.</p>'
    items = []
    for r in rows:
        when = r.get("seen", "").replace("T", " ").replace("Z", " UTC")
        items.append(
            "<li>"
            f'<p class="said">{E(r.get("said", ""))}</p>'
            f'<dl><dt>seen</dt><dd>{E(when)}</dd><dt>by</dt><dd>{E(r.get("by", ""))}</dd>'
            f'<dt>from</dt><dd>{E(r.get("from", ""))}</dd>'
            f'<dt>hash</dt><dd class="sha">{E(r.get("sha", ""))}</dd>'
            f'<dt>state</dt><dd>{E(r.get("state", ""))}</dd></dl>'
            + (f'<p class="note">{E(r["note"])}</p>' if r.get("note") else "") +
            "</li>")
    wid = f"w-{sp['name']}-{fid}"
    return (f'<div class="witness" id="{wid}" role="dialog" aria-labelledby="{wid}-h" hidden>'
            f'<h3 id="{wid}-h" tabindex="-1">What Pin wrote down, mark {num}</h3>'
            f'<ol>{"".join(items)}</ol>{dag}'
            f'<button type="button" class="close" data-close="{wid}">Close <span aria-hidden="true">(Esc)</span></button></div>')


def fuller_page(sp):
    facts = {}
    for f in sp["facts"]:
        facts.setdefault(f["fact"], []).append(f)
    order = []
    for p in sp["fuller_page"]:
        for fid in spread.MARK.findall(p):
            if fid not in order:
                order.append(fid)
    num = {fid: i + 1 for i, fid in enumerate(order)}
    paras = []
    for p in sp["fuller_page"]:
        parts = re.split(r"\s?\[([a-z][\w-]*)\]", p)
        out = []
        for k in range(0, len(parts), 2):
            text = parts[k]
            fid = parts[k + 1] if k + 1 < len(parts) else None
            if fid:
                wid = f"w-{sp['name']}-{fid}"
                lone = len({r.get('by', '') for r in facts[fid]}) < 2
                out.append(f'<span class="claim" data-fact="{fid}">{E(text)}</span>'
                           f'<button type="button" class="mark{" lone" if lone else ""}" data-fact="{fid}" aria-expanded="false" '
                           f'aria-controls="{wid}" aria-label="Mark {num[fid]}: what Pin wrote down about this">{num[fid]}</button>')
            elif text:
                out.append(E(text))
        paras.append("<p>" + "".join(out) + "</p>")
    dia = ""
    if sp["diagram"]:
        d = sp["diagram"]
        kind = d.get("kind")
        if kind not in DIAGRAMS:
            raise SystemExit(f"slides: {sp['name']}: no diagram kind '{kind}' (have: {', '.join(DIAGRAMS)})")
        dia = f'<figure class="diagram">{DIAGRAMS[kind](d)}<figcaption>{E(d.get("caption", ""))}</figcaption></figure>'
    wit = "".join(witness_html(sp, fid, facts[fid], num[fid]) for fid in order)
    return "".join(paras), dia, wit


def step(shot_id, label, cls, inner):
    return (f'<section class="step {cls}" data-shot="{E(shot_id)}" role="group" aria-roledescription="page" '
            f'aria-label="{E(label)}">{inner}</section>')


def build_steps(meta, spreads, figs):
    steps = []
    pageno = 1
    for sp in spreads:
        kind = sp["kind"]
        name = sp["name"]
        if kind == "card":
            pic = place_figures(sp["svg"], figs) if sp["svg"] else ""
            body = "".join(f"<p>{E(p)}</p>" for p in sp["picture_page"])
            small = "".join(f"<p>{E(p)}</p>" for p in sp["fuller_page"])
            if name == "cover":
                inner = (f'<div class="cover"><div class="cover-pic kb-frame"><div class="kb">{pic}</div></div>'
                         f'<div class="cover-words"><h1>{E(meta.get("title", ""))}</h1>'
                         f'<p class="sub">{E(sp["picture_page"][1] if len(sp["picture_page"]) > 1 else meta.get("subtitle", ""))}</p>'
                         f'<p class="hint-keys">Use the arrow keys, or the buttons below, to turn the pages.</p></div></div>')
            else:
                inner = (f'<div class="endcard"><div class="end-pic kb-frame"><div class="kb">{pic}</div></div>'
                         f'<div class="end-words"><h2>{E(sp["title"])}</h2>{body}<div class="small">{small}</div></div></div>')
            steps.append(step(f"{name}/card", f"{sp['title']}", f"card card-{name}", inner))
            continue
        pic = place_figures(sp["svg"], figs)
        part = f'<p class="part">{E(sp["meta"].get("part", ""))}</p>' if kind == "intermezzo" else ""
        solo = (f'<div class="page solo">{part}<div class="kb-frame"><div class="kb">{pic}</div></div>'
                f'<div class="easy">{easy_page(sp)}</div></div>')
        steps.append(step(f"{name}/picture", f"{sp['title']}: picture page", f"pictured {kind}", solo))
        if kind == "spread":
            paras, dia, wit = fuller_page(sp)
            pic2 = place_figures(sp["svg"], figs, suffix="-2")
            left = (f'<div class="page left"><div class="kb-frame small"><div class="kb">{pic2}</div></div>'
                    f'<div class="easy">{easy_page(sp)}</div><span class="pageno">{pageno}</span></div>')
            right = (f'<div class="page right"><h2><span class="num">{E(sp["meta"].get("number", ""))}</span> {E(sp["title"])}</h2>'
                     f'<div class="fuller">{paras}</div>{dia}{wit}<span class="pageno">{pageno + 1}</span></div>')
            pageno += 2
            steps.append(step(f"{name}/fuller", f"{sp['title']}: both pages", "spread",
                              f'<div class="book">{left}<div class="gutter" aria-hidden="true"></div>{right}</div>'))
    return steps


CSS = r"""
:root{--paper:#fbf6ec;--ink:#2d2a32;--ink2:#5b5560;--accent:#b4532f;--hl-c:rgba(233,196,106,.55);
--room:#e6dccb;--room2:#d9ccb6;--bar:#2d2a32;--bar-ink:#fbf6ec;--lamp:rgba(255,236,190,.55);
--easy:"Atkinson Hyperlegible","Andika","Lexend","Inter","Verdana","DejaVu Sans",system-ui,sans-serif;
--serif:"Charter","Bitstream Charter","Iowan Old Style","Lora","Georgia","DejaVu Serif",serif}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--room:#241f1b;--room2:#16120f;--bar:#0f0d0b;--lamp:rgba(255,214,150,.18)}}
:root[data-theme="dark"]{--room:#241f1b;--room2:#16120f;--bar:#0f0d0b;--lamp:rgba(255,214,150,.18)}
*{box-sizing:border-box}
html,body{margin:0;height:100%}
body{background:radial-gradient(ellipse at 50% 42%,var(--room) 0%,var(--room2) 100%);color:var(--ink);font-family:var(--easy);overflow:hidden}
.vh{position:absolute!important;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap}
main{position:fixed;inset:0 0 4.25rem 0}
.lens{position:absolute;inset:0;overflow:hidden}
.lens::after{content:"";position:absolute;inset:0;pointer-events:none;background:radial-gradient(ellipse 62% 70% at 50% 50%,transparent 62%,rgba(20,14,10,.55) 100%)}
.step{position:absolute;left:50%;top:50%;width:min(88vw,calc((100vh - 6.5rem) * 16 / 9));aspect-ratio:16/9;container-type:size;
transform:translate(-50%,-50%) scale(1);transition:transform .7s cubic-bezier(.2,.7,.2,1),opacity .7s,filter .7s;opacity:1}
.step[data-pos="-1"]{transform:translate(calc(-50% - 74%),-50%) scale(.72);opacity:.38;filter:blur(2px) saturate(.7)}
.step[data-pos="1"]{transform:translate(calc(-50% + 74%),-50%) scale(.72);opacity:.38;filter:blur(2px) saturate(.7)}
.step[data-pos="far-l"]{transform:translate(calc(-50% - 150%),-50%) scale(.6);opacity:0;visibility:hidden}
.step[data-pos="far-r"]{transform:translate(calc(-50% + 150%),-50%) scale(.6);opacity:0;visibility:hidden}
.step::before{content:"";position:absolute;inset:-6%;background:radial-gradient(ellipse at 50% 45%,var(--lamp),transparent 65%);pointer-events:none}
/* pages */
.page{position:absolute;background:var(--paper);border-radius:.6cqw;box-shadow:0 .4cqw 1.6cqw rgba(0,0,0,.35);overflow:hidden}
.solo{left:50%;top:3%;width:62cqw;height:82%;transform:translateX(-50%);padding:2.2cqw 2.6cqw 1.6cqw;display:flex;flex-direction:column;align-items:center;justify-content:center}
.kb-frame{width:100%;aspect-ratio:4/3;overflow:hidden;border-radius:.5cqw;flex:0 0 auto}
.solo .kb-frame{width:auto;height:63%}
.kb{width:100%;height:100%;transform-origin:56% 46%;transform:scale(calc(1 + var(--kb,0) * .045)) translate(calc(var(--kb,0) * -.5%),calc(var(--kb,0) * -.7%))}
.pic{display:block;width:100%;height:100%}
.pic .plate{font-family:var(--easy);font-weight:700;font-size:19px;fill:#2d2a32}
.easy{font-family:var(--easy);text-align:center;line-height:1.28;color:var(--ink)}
.solo .easy{font-size:1.85cqw;margin-top:1cqw}
.easy p{margin:.25em 0}
.part{font-family:var(--serif);font-style:italic;color:var(--accent);font-size:1.5cqw;margin:0 0 .6cqw;letter-spacing:.02em}
.pictured.intermezzo .solo .kb-frame{height:56%}
.book{position:absolute;left:4%;right:4%;top:3%;height:82%}
.book .page{top:0;height:100%;width:49.4%}
.book .left{left:0;border-radius:.6cqw 0 0 .6cqw;padding:2cqw 2.2cqw;display:flex;flex-direction:column;align-items:center}
.book .right{right:0;border-radius:0 .6cqw .6cqw 0;padding:1.7cqw 2.4cqw 1.2cqw 2.6cqw;display:flex;flex-direction:column}
.gutter{position:absolute;left:49.4%;width:1.2%;top:0;height:100%;background:linear-gradient(90deg,#d8cdb9,#f3ecdf 45%,#d8cdb9)}
.book .left .easy{font-size:1.5cqw;margin-top:1.2cqw}
.pageno{position:absolute;bottom:.8cqw;font-family:var(--serif);font-size:.85cqw;color:var(--ink2)}
.left .pageno{left:1.6cqw}.right .pageno{right:1.6cqw}
h2{font-family:var(--serif);font-weight:600;font-size:1.75cqw;margin:0 0 .5cqw;color:var(--ink)}
h2 .num{color:var(--accent);margin-right:.25em}
.fuller{font-family:var(--serif);font-size:.98cqw;line-height:1.5;color:var(--ink);hyphens:auto}
.fuller p{margin:0 0 .55em}
.claim{border-radius:.2em;box-decoration-break:clone;-webkit-box-decoration-break:clone;
background:linear-gradient(transparent 12%,rgba(233,196,106,calc(var(--hl,0) * .6)) 12%,rgba(233,196,106,calc(var(--hl,0) * .6)) 92%,transparent 92%)}
.mark{font:600 .66cqw/1 var(--easy);display:inline-flex;align-items:center;justify-content:center;vertical-align:.45em;
width:1.15cqw;height:1.15cqw;margin-left:.18em;padding:0;border-radius:50%;border:.1cqw solid var(--accent);
background:color-mix(in srgb,var(--paper) calc(100% - var(--hl,0) * 100%),var(--accent));color:color-mix(in srgb,var(--accent) calc(100% - var(--hl,0) * 100%),var(--paper));cursor:pointer}
.mark[aria-expanded="true"],.mark:hover{background:var(--accent);color:var(--paper)}
:focus-visible{outline:.2cqw solid #1d6fd6;outline-offset:.15cqw}
.diagram{margin:auto 0 0;padding:0}
.dia{display:block;width:100%;height:auto;max-height:14.5cqw}
.diagram figcaption{font-family:var(--serif);font-style:italic;font-size:.82cqw;color:var(--ink2);margin-top:.2cqw}
.dia text{font-family:var(--easy)}
.dia .dl{font-size:15px;fill:var(--ink2)}.dia .dn{font-size:26px;font-weight:700;fill:#c9b79c}
.dia .dh{font-size:15px;fill:var(--ink2);letter-spacing:.04em}
.dia .edge{fill:none;stroke:#9c8a74;stroke-width:calc(2.5px + var(--hl,0) * 3px);stroke-dasharray:7 7}
.dia .ringline{fill:none;stroke:#b98f5a;stroke-width:calc(4px + var(--hl,0) * 4px);stroke-linejoin:round}
.dia .node{stroke:#2d2a32;stroke-width:2.5}.dia .scr{fill:#fffdf6;opacity:.8}
.dia .spare{fill:#f1e7d6;stroke-dasharray:4 3}
.dia .tile{stroke:#2d2a32;stroke-width:2}.dia .tl{font-size:24px;font-weight:700;fill:#fffdf6}
.dia .tile.dim{fill:#ece3d4;stroke-dasharray:5 4}.dia .tdim{fill:#8b7f73}
.dia .cell{fill:#fffdf6;stroke:#b8a990;stroke-width:2}.dia .cell.own{fill:#e7e0ff;stroke:#6d5fb3}
.dia .cw{font-size:19px;font-weight:600;fill:var(--ink)}
.dia .floor{fill:#fffdf6;stroke:#b8a990;stroke-width:2}.dia .rung.lit .floor{fill:#fff1c9;stroke:#c9a14a;stroke-width:3}
.dia [data-focus]{transition:opacity .3s}
.dia g[data-focus] > rect,.dia g[data-focus] > text{filter:drop-shadow(0 0 calc(var(--hl,0) * 6px) rgba(233,170,40,calc(var(--hl,0))))}
.witness{position:absolute;left:4%;right:4%;bottom:3%;max-height:72%;overflow:auto;background:#fffdf8;border:.12cqw solid var(--accent);
border-radius:.7cqw;padding:1cqw 1.3cqw;box-shadow:0 .6cqw 2cqw rgba(0,0,0,.3);font-family:var(--serif);font-size:.86cqw;z-index:3}
.witness h3{font-size:1.05cqw;margin:0 0 .4cqw}.witness ol{margin:0;padding-left:1.3em}.witness li{margin:0 0 .6cqw}
.witness .said{font-style:italic;margin:0 0 .2cqw}.witness dl{display:grid;grid-template-columns:auto 1fr;gap:.1cqw .8cqw;margin:0}
.witness dt{color:var(--ink2)}.witness dd{margin:0}.witness .sha{font-family:"DejaVu Sans Mono",monospace;font-size:.72cqw;word-break:break-all}
.witness .note,.witness .dagger{color:var(--ink2);margin:.25cqw 0 0}.witness .close{margin-top:.4cqw;font:inherit;cursor:pointer}
/* cards */
.cover{position:absolute;inset:3% 4% 12%;display:grid;grid-template-columns:44% 1fr;gap:3cqw;align-items:center}
.cover-pic{border-radius:50%;aspect-ratio:1;background:var(--paper);box-shadow:0 .4cqw 1.6cqw rgba(0,0,0,.35)}
.cover-words h1{font-family:var(--serif);font-size:4.1cqw;line-height:1.08;margin:0 0 1.2cqw;color:var(--paper);text-shadow:0 .15cqw .5cqw rgba(0,0,0,.4)}
.cover-words .sub{font-size:1.7cqw;color:var(--paper);opacity:.92;margin:0 0 1.4cqw}
.cover-words .hint-keys{font-size:1.05cqw;color:var(--paper);opacity:.7}
.endcard{position:absolute;inset:3% 5% 12%;display:grid;grid-template-columns:40% 1fr;gap:3cqw;align-items:center}
.end-pic{border-radius:1cqw;background:var(--paper);box-shadow:0 .4cqw 1.6cqw rgba(0,0,0,.35)}
.end-words{color:var(--paper)}.end-words h2{color:var(--paper);font-size:3.2cqw}.end-words p{font-size:1.7cqw;margin:.3cqw 0 1.2cqw}
.end-words .small p{font-family:var(--serif);font-size:1.05cqw;line-height:1.45;opacity:.85;margin:0 0 .6cqw}
@media (prefers-color-scheme:light){:root:not([data-theme="dark"]):not(.render) .cover-words h1,:root:not([data-theme="dark"]):not(.render) .cover-words .sub,
:root:not([data-theme="dark"]):not(.render) .cover-words .hint-keys,:root:not([data-theme="dark"]):not(.render) .end-words,:root:not([data-theme="dark"]):not(.render) .end-words h2{color:var(--ink);text-shadow:none}}
/* figures */
.fig{transform-box:fill-box;transform-origin:50% 100%;transform:translateY(calc(var(--talk,0) * -7px)) scale(calc(1 + var(--talk,0) * .025))}
.bob{animation:bob 3.6s ease-in-out infinite}
.fig-spoke .shadow{transform-box:fill-box;transform-origin:50% 50%;animation:shadow 3.6s ease-in-out infinite}
.pencil{transform-box:fill-box;transform-origin:50% 100%;animation:pencil 1.2s ease-in-out infinite}
.lean{transform-box:fill-box;transform-origin:50% 100%;animation:lean 2.6s ease-in-out infinite alternate}
.screen{animation:glow 5.6s ease-in-out infinite}
.s1{animation-delay:-4.9s}.s2{animation-delay:-4.2s}.s3{animation-delay:-3.5s}.s4{animation-delay:-2.8s}.s5{animation-delay:-2.1s}.s6{animation-delay:-1.4s}.s7{animation-delay:-.7s}
.door-s{animation:soft 4.2s ease-in-out infinite}
.kb{animation:kb 46s ease-in-out infinite alternate}
@keyframes bob{0%,100%{transform:translateY(0)}50%{transform:translateY(-6px)}}
@keyframes shadow{0%,100%{transform:scale(1);opacity:.12}50%{transform:scale(.86);opacity:.08}}
@keyframes pencil{0%,100%{transform:rotate(0)}30%{transform:rotate(-6deg)}65%{transform:rotate(3deg)}}
@keyframes lean{from{transform:rotate(-1.6deg)}to{transform:rotate(2deg)}}
@keyframes glow{0%,100%{fill:#bfeee5}12%{fill:#fff1b8}24%{fill:#bfeee5}}
@keyframes soft{0%,100%{opacity:1}50%{opacity:.86}}
@keyframes kb{from{transform:scale(1)}to{transform:scale(1.04) translate(-.5%,-.6%)}}
/* controls */
.bar{position:fixed;left:0;right:0;bottom:0;height:4.25rem;display:flex;align-items:center;justify-content:center;gap:1rem;
background:var(--bar);color:var(--bar-ink);font:1rem/1.2 var(--easy);padding:0 1rem}
.bar button{font:inherit;color:inherit;background:transparent;border:2px solid currentColor;border-radius:999px;padding:.45rem 1.1rem;cursor:pointer;min-width:6.5rem}
.bar button:disabled{opacity:.35;cursor:default}
.where{min-width:16rem;text-align:center}
.keys{opacity:.7;font-size:.85rem}
.peek{position:fixed;top:0;bottom:4.25rem;width:10vw;border:0;background:transparent;cursor:pointer;z-index:2;color:transparent}
.peek.prev{left:0}.peek.next{right:0}
.peek:focus-visible{outline:3px solid #1d6fd6;outline-offset:-6px;color:var(--bar-ink)}
@media (max-width:700px){.keys{display:none}.bar button{min-width:auto}.where{min-width:0;font-size:.85rem}.step{width:96vw}}
/* render mode: one page full-frame for the video */
.render body,.render{background:#1d1814}
.render main{inset:0}.render .bar,.render .peek{display:none}
.render .lens::after{display:none}
.render .step{width:100vw;transition:none;filter:none}
.render .step[data-pos]:not([data-pos="0"]){visibility:hidden}
.render .kb{animation:none}
.render .hint-keys{display:none}
/* motion off when asked */
@media (prefers-reduced-motion:reduce){*,*::before,*::after{animation:none!important;transition:none!important}
.step[data-pos="-1"],.step[data-pos="1"]{filter:none}}
/* print: every page in order, nothing moving */
@media print{body{overflow:visible;background:#fff}main{position:static}.lens{position:static;overflow:visible}.lens::after,.bar,.peek,.step::before{display:none}
.step{position:relative;left:auto;top:auto;transform:none!important;opacity:1!important;visibility:visible!important;filter:none!important;width:100%;break-after:page}
*{animation:none!important}.witness{display:none}}
"""

JS = r"""
(function () {
  'use strict';
  var root = document.documentElement;
  var steps = [].slice.call(document.querySelectorAll('.step'));
  var live = document.getElementById('live');
  var where = document.getElementById('where');
  var prevB = document.getElementById('prev'), nextB = document.getElementById('next');
  var render = /[?&]render(=|&|$)/.test(location.search);
  var cur = -1, opener = null;
  if (render) root.classList.add('render');

  function closeAll() {
    var open = [].slice.call(document.querySelectorAll('.witness:not([hidden])'));
    open.forEach(function (w) {
      w.hidden = true;
      var b = document.querySelector('.mark[aria-controls="' + w.id + '"]');
      if (b) b.setAttribute('aria-expanded', 'false');
    });
    return open.length > 0;
  }
  function place() {
    steps.forEach(function (s, k) {
      var d = k - cur;
      s.setAttribute('data-pos', d === 0 ? '0' : d === -1 ? '-1' : d === 1 ? '1' : (d < 0 ? 'far-l' : 'far-r'));
      if (d === 0) { s.removeAttribute('inert'); s.setAttribute('aria-hidden', 'false'); }
      else { s.setAttribute('inert', ''); s.setAttribute('aria-hidden', 'true'); }
    });
  }
  function go(n, quiet) {
    n = Math.max(0, Math.min(steps.length - 1, n | 0));
    if (n === cur) return;
    cur = n; closeAll(); place();
    var name = steps[cur].getAttribute('aria-label');
    where.textContent = (cur + 1) + ' of ' + steps.length + ': ' + name;
    if (!quiet) live.textContent = 'Page ' + (cur + 1) + ' of ' + steps.length + ': ' + name;
    prevB.disabled = cur === 0; nextB.disabled = cur === steps.length - 1;
    root.setAttribute('data-step', String(cur));
    if (!render && history.replaceState) history.replaceState(null, '', '#' + (cur + 1));
  }
  function next() { go(cur + 1); }
  function prev() { go(cur - 1); }

  document.addEventListener('keydown', function (e) {
    if (e.altKey || e.ctrlKey || e.metaKey) return;
    var k = e.key, t = e.target, onButton = t && t.closest && t.closest('button');
    if (k === 'Escape') {
      if (closeAll()) { e.preventDefault(); if (opener) opener.focus(); }
      return;
    }
    if (k === 'ArrowRight' || k === 'PageDown' || k === 'n' || (k === ' ' && !onButton && !e.shiftKey)) { e.preventDefault(); next(); }
    else if (k === 'ArrowLeft' || k === 'PageUp' || k === 'p' || (k === ' ' && !onButton && e.shiftKey)) { e.preventDefault(); prev(); }
    else if (k === 'Home') { e.preventDefault(); go(0); }
    else if (k === 'End') { e.preventDefault(); go(steps.length - 1); }
    else if (/^[1-9]$/.test(k)) { go(+k - 1); }
  });
  prevB.addEventListener('click', prev);
  nextB.addEventListener('click', next);
  document.getElementById('peek-prev').addEventListener('click', prev);
  document.getElementById('peek-next').addEventListener('click', next);

  document.addEventListener('click', function (e) {
    var b = e.target.closest && e.target.closest('.mark');
    if (b) {
      var w = document.getElementById(b.getAttribute('aria-controls'));
      var wasOpen = !w.hidden;
      closeAll();
      if (!wasOpen) { w.hidden = false; b.setAttribute('aria-expanded', 'true'); opener = b; w.querySelector('h3').focus(); }
      return;
    }
    var c = e.target.closest && e.target.closest('[data-close]');
    if (c) { closeAll(); if (opener) opener.focus(); }
  });
  // a mark lights its own claim while it is hovered or focused
  function lightClaim(e, on) {
    var b = e.target.closest && e.target.closest('.mark');
    if (!b || render) return;
    var page = b.closest('.page');
    [].slice.call(page.querySelectorAll('[data-fact="' + b.getAttribute('data-fact') + '"].claim')).forEach(function (s) {
      if (on) s.style.setProperty('--hl', '1'); else s.style.removeProperty('--hl');
    });
  }
  document.addEventListener('focusin', function (e) { lightClaim(e, true); });
  document.addEventListener('focusout', function (e) { lightClaim(e, false); });
  document.addEventListener('mouseover', function (e) { lightClaim(e, true); });
  document.addEventListener('mouseout', function (e) { lightClaim(e, false); });

  function find(shot) {
    for (var i = 0; i < steps.length; i++) if (steps[i].getAttribute('data-shot') === shot) return i;
    return -1;
  }
  // The frames stage calls this once per video frame.
  //   shot: which page; kb: 0..1 along the slow zoom; t: seconds since the film began;
  //   facts: {id: 0..1} how lit each fact is; who: {name: 0..1} who is speaking.
  function frame(shot, kb, t, facts, who) {
    var n = find(shot);
    if (n < 0) throw new Error('no page for shot ' + shot);
    go(n, true);
    var s = steps[n];
    [].slice.call(s.querySelectorAll('.kb')).forEach(function (el) { el.style.setProperty('--kb', String(kb)); });
    document.getAnimations().forEach(function (a) { a.pause(); a.currentTime = t * 1000; });
    facts = facts || {}; who = who || {};
    [].slice.call(s.querySelectorAll('.claim[data-fact], .mark[data-fact]')).forEach(function (el) {
      el.style.setProperty('--hl', String(facts[el.getAttribute('data-fact')] || 0));
    });
    [].slice.call(s.querySelectorAll('[data-focus]')).forEach(function (el) {
      var v = 0;
      el.getAttribute('data-focus').split(/\s+/).forEach(function (f) { v = Math.max(v, facts[f] || 0); });
      el.style.setProperty('--hl', String(v));
    });
    [].slice.call(s.querySelectorAll('.fig[data-who]')).forEach(function (el) {
      el.style.setProperty('--talk', String(who[el.getAttribute('data-who')] || 0));
    });
  }
  window.deck = { go: go, find: find, frame: frame, count: steps.length,
    get index() { return cur; } };
  var h = parseInt((location.hash || '').slice(1), 10);
  go(h >= 1 && h <= steps.length ? h - 1 : 0, true);
})();
"""


def sha256_b64(s):
    return base64.b64encode(hashlib.sha256(s.encode("utf-8")).digest()).decode()


def main():
    meta, spreads = spread.read_book()
    defs, figs = load_figures()
    steps = build_steps(meta, spreads, figs)
    csp = ("default-src 'none'; img-src data:; "
           f"style-src 'sha256-{sha256_b64(CSS)}'; script-src 'sha256-{sha256_b64(JS)}'; "
           "base-uri 'none'; form-action 'none'")
    title = meta.get("title", "Slides")
    doc = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Security-Policy" content="{csp}">
<meta name="color-scheme" content="light dark">
<title>Ghostwheel pilot</title>
<meta name="description" content="{E(title)} {E(meta.get('subtitle', ''))}">
<meta name="generator" content="ghostwheel-pilot tools/slides.py">
<!-- {E(meta.get('copyright', ''))}. Code that made this page: GPL-3.0-or-later. -->
<style>{CSS}</style>
</head>
<body>
<svg width="0" height="0" class="vh" aria-hidden="true" focusable="false"><defs>{defs}</defs></svg>
<main aria-label="{E(title)}">
<p class="vh" id="howto">A book in pages. The arrow keys, Page Up and Page Down, or the buttons at the bottom turn the pages. Numbered marks in the text open notes on where each fact came from; Escape closes them.</p>
<div class="lens" aria-describedby="howto">
{chr(10).join(steps)}
</div>
</main>
<button type="button" class="peek prev" id="peek-prev" aria-label="Previous page">previous</button>
<button type="button" class="peek next" id="peek-next" aria-label="Next page">next</button>
<nav class="bar" aria-label="Pages">
<button type="button" id="prev"><span aria-hidden="true">&larr;</span> Back</button>
<span class="where" id="where" aria-hidden="true"></span>
<button type="button" id="next">Next <span aria-hidden="true">&rarr;</span></button>
<span class="keys" aria-hidden="true">keys: &larr; &rarr; &middot; Home End &middot; 1&ndash;9</span>
</nav>
<div class="vh" id="live" role="status" aria-live="polite"></div>
<script>{JS}</script>
</body>
</html>
"""
    os.makedirs(spread.OUT, exist_ok=True)
    out = os.path.join(spread.OUT, "slides.html")
    with open(out, "w", encoding="utf-8") as fh:
        fh.write(doc)
    shots = [re.search(r'data-shot="([^"]+)"', s).group(1) for s in steps]
    print(f"slides: {out}: {len(steps)} pages ({', '.join(shots)}), {len(doc)//1024} KB")


if __name__ == "__main__":
    main()
