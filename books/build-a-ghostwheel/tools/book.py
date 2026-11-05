#!/usr/bin/env python3
# book.py -- source to book: the picture book, as facing pages, in one self-contained HTML file.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# Reads the same sources as slides.py and writes $GW_OUT/book.html.
#
# A paper picture book is the thing it copies, and it says where it leaves the paper behind:
#   - The first opening is the title page (the picture, the title lettered into the drawing,
#     never repeated in the words) with the dedication facing it. An empty dedication: line
#     in src/book leaves a blank page with only the ghost light on it.
#   - After that, facing pages: the picture page on the left, the fuller page on the right.
#     A Part page faces each of Chad's visits. NEWS and the ChangeLog sit at the back, and the
#     map of the shop is inside the back cover.
#   - The picture page's words go where its == layout == section says (below, above, inset,
#     scatter or wrap), so they lead the eye round the drawing.
#   - Off the paper: the numbered marks open Pin's notes; M opens the map (plan, tiles or
#     board), which also offers itself when someone pages back and forth as if lost.
#   - A narrow screen shows one page at a time, the picture page first.
#
# Nothing loads from anywhere: the Content Security Policy allows only this file's own style
# and script, by hash. Every position the layouts ask for is written into that one stylesheet.

import html
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import slides  # noqa: E402
import spread  # noqa: E402

E = html.escape
WORDS = ("below", "above", "inset", "scatter", "wrap")


class LayoutError(SystemExit):
    pass


# ---------------------------------------------------------------- the ghost light
# The one lamp left burning on an empty stage. It stands on the pages that have no words.
def ghost_light(cls="gl", label="The ghost light: one bare bulb in a little wire cage, on a tall stand, glowing."):
    return (f'<svg class="{cls}" viewBox="0 0 200 420" role="img" aria-label="{E(label)}" focusable="false">'
            '<defs><radialGradient id="GLID" cx="50%" cy="50%" r="50%">'
            '<stop offset="0" stop-color="#ffe9a8" stop-opacity=".95"/><stop offset=".45" stop-color="#ffd27a" stop-opacity=".35"/>'
            '<stop offset="1" stop-color="#ffd27a" stop-opacity="0"/></radialGradient></defs>'
            '<circle cx="100" cy="92" r="88" fill="url(#GLID)" class="glow"/>'
            '<path d="M100 132 V392" stroke="#5b5560" stroke-width="7" stroke-linecap="round"/>'
            '<path d="M58 404 L100 380 L142 404" fill="none" stroke="#5b5560" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>'
            '<path d="M86 132 h28 v-10 h-28 z" fill="#5b5560"/>'
            '<ellipse cx="100" cy="92" rx="22" ry="27" fill="#fff6d6" stroke="#c9a14a" stroke-width="3"/>'
            '<path d="M93 96 q7 -14 14 0" fill="none" stroke="#e0a83a" stroke-width="2.5"/>'
            '<g fill="none" stroke="#5b5560" stroke-width="3"><path d="M74 92 a26 34 0 0 1 52 0"/><path d="M74 92 a26 34 0 0 0 52 0"/>'
            '<path d="M100 58 V126"/><path d="M78 74 h44 M78 110 h44"/></g></svg>')


# ---------------------------------------------------------------- layouts
def _nums(v, n, where):
    try:
        xs = [float(x) for x in v.split()]
    except ValueError:
        raise LayoutError(f"book: {where}: '{v}' is not {n} numbers")
    if len(xs) != n or any(x < -1 or x > 101 for x in xs):
        raise LayoutError(f"book: {where}: '{v}' should be {n} numbers from 0 to 100")
    return xs


def layout_of(sp):
    """Read and check a picture page's == layout ==; fill in what it leaves out."""
    name = sp["name"]
    vb = re.search(r'viewBox="\s*0\s+0\s+(\d+(?:\.\d+)?)\s+(\d+(?:\.\d+)?)"', sp["svg"] or "")
    square = bool(vb) and abs(float(vb.group(1)) - float(vb.group(2))) < 1
    L = {"picture": "full" if square else "top", "words": None, "at": [], "side": "right",
         "outline": None, "align": None, "ground": None, "size": None}
    for k, v in sp["layout"]:
        if k == "at":
            L["at"].append(_nums(v, 3, f"{name}: at:"))
        elif k == "outline":
            pts = [p.strip() for p in v.split(",") if p.strip()]
            L["outline"] = [_nums(p, 2, f"{name}: outline:") for p in pts]
            if len(L["outline"]) < 3:
                raise LayoutError(f"book: {name}: outline: needs at least three points")
        elif k in L:
            L[k] = v.lower()
        else:
            raise LayoutError(f"book: {name}: layout has no '{k}:' (have: picture, words, at, side, outline, align, ground, size)")
    if L["picture"] not in ("full", "top"):
        raise LayoutError(f"book: {name}: picture: is full or top, not '{L['picture']}'")
    L["words"] = L["words"] or ("below" if L["picture"] == "top" else "inset")
    if L["words"] not in WORDS:
        raise LayoutError(f"book: {name}: words: is one of {', '.join(WORDS)}, not '{L['words']}'")
    n = len(sp["picture_page"])
    if L["words"] == "scatter" and len(L["at"]) != n:
        raise LayoutError(f"book: {name}: words: scatter wants one at: per paragraph ({n}), and has {len(L['at'])}")
    if L["words"] == "inset":
        L["at"] = L["at"][:1] or [[7, 6, 86]]
    if L["words"] == "wrap" and not L["outline"]:
        raise LayoutError(f"book: {name}: words: wrap needs an outline: of the drawing")
    if L["side"] not in ("left", "right"):
        raise LayoutError(f"book: {name}: side: is left or right")
    for x, y, w in L["at"]:
        if x + w > 101:
            raise LayoutError(f"book: {name}: at: {x:g} {y:g} {w:g} runs off the page")
    if L["size"] is not None:
        L["size"] = _nums(L["size"], 1, f"{name}: size:")[0]
        if not 2 <= L["size"] <= 7:
            raise LayoutError(f"book: {name}: size: is the words' height in percent of the page width, from 2 to 7")
    L["align"] = L["align"] or ("center" if L["words"] in ("below", "above") else
                                ("left" if L["side"] == "right" or L["words"] != "wrap" else "right"))
    return L


def picture_page(sp, figs, css, side, pno, room, extra="", show_no=True):
    """The picture page: the drawing, and its words where the layout puts them."""
    L = layout_of(sp)
    pid = f"pg-{sp['name']}"
    svg = slides.place_figures(sp["svg"], figs)
    if L["picture"] == "full" and "preserveAspectRatio" not in svg[:400]:
        svg = svg.replace("<svg ", '<svg preserveAspectRatio="xMidYMid slice" ', 1)
    paras = [E(p) for p in sp["picture_page"]]
    al = f" al-{L['align']}"
    gr = " soft" if L["ground"] == "soft" else ""
    w = L["words"]
    if L["size"]:
        css.append(f"#{pid} .words,#{pid} .words .w{{font-size:{L['size']:g}cqw}}")
    if w == "scatter":
        words = "".join(f'<p class="w w{i}{gr}">{p}</p>' for i, p in enumerate(paras))
        for i, (x, y, wd) in enumerate(L["at"]):
            css.append(f"#{pid} .w{i}{{left:{x:g}%;top:{y:g}%;width:{wd:g}%}}")
        box = f'<div class="words scatter{al}">{words}</div>'
    elif w == "inset":
        x, y, wd = L["at"][0]
        css.append(f"#{pid} .words{{left:{x:g}%;top:{y:g}%;width:{wd:g}%}}")
        box = f'<div class="words inset{al}{gr}">{"".join(f"<p>{p}</p>" for p in paras)}</div>'
    elif w == "wrap":
        # the words' box is inset 5% all round; the outline is given in percent of the page
        pts = ", ".join(f"{(x - 5) / 0.9:.2f}% {(y - 5) / 0.9:.2f}%" for x, y in L["outline"])
        fl = "left" if L["side"] == "right" else "right"
        css.append(f"#{pid} .shape{{float:{fl};shape-outside:polygon({pts})}}")
        box = (f'<div class="words wrap{al}"><div class="shape" aria-hidden="true"></div>'
               f'{"".join(f"<p><span class={chr(34)}soft-in{chr(34)}>{p}</span></p>" if gr else f"<p>{p}</p>" for p in paras)}</div>')
    else:  # below, above
        box = f'<div class="words band {w}{al}{gr}">{"".join(f"<p>{p}</p>" for p in paras)}</div>'
    no = f'<span class="pageno">{pno}</span>' if show_no else ""
    return (f'<div class="page {side} picpage pic-{L["picture"]} lay-{w}{extra}" id="{pid}" data-room="{room}" '
            f'role="group" aria-roledescription="page" aria-label="{E(sp["title"])}: picture page">'
            f'<div class="plate"><div class="art">{svg}</div>{box}</div>{no}</div>')


def fuller_page(sp, side, pno, room):
    paras, dia, wit = slides.fuller_page(sp)
    num = sp["meta"].get("number", "")
    return (f'<div class="page {side} fullpage" id="fp-{sp["name"]}" data-room="{room}" role="group" '
            f'aria-roledescription="page" aria-label="{E(sp["title"])}: fuller page">'
            f'<div class="inner" data-fs="2.2"><h2><span class="num">{E(num)}</span> {E(sp["title"])}</h2><div class="fuller">{paras}</div>{dia}</div>'
            f'{wit}<span class="pageno">{pno}</span></div>')


def quiet_page(side, room, label, inner="", gl=True, cls=""):
    light = ghost_light().replace("GLID", f"gl-{room}-{side}") if gl else ""
    return (f'<div class="page {side} quiet {cls}" data-room="{room}" role="group" aria-roledescription="page" '
            f'aria-label="{E(label)}">{inner}{light}</div>')


def text_page(side, room, label, title, body, pno):
    return (f'<div class="page {side} textpage" data-room="{room}" role="group" aria-roledescription="page" '
            f'aria-label="{E(label)}"><div class="inner" data-fs="1.75"><h2>{E(title)}</h2><pre class="gnu">{E(body)}</pre></div><span class="pageno">{pno}</span></div>')


# ---------------------------------------------------------------- the map of the shop
# One room per spread, Chad's visits as little round rooms, the entrance and the way out.
# Laid out as a snake on two pages; drawn three ways from the same list: a floor plan, a
# roguelike's tiles, and a board of cards.
def map_rooms(spreads):
    rooms = [{"id": "entrance", "label": "Come in", "num": "", "kind": "door", "half": 0}]
    half = 0
    for sp in spreads:
        k, n = sp["kind"], sp["name"]
        if k == "card" and n == "cover":
            continue
        if k == "intermezzo":
            if (sp["meta"].get("part", "") or "").lower().startswith("part two"):
                half = 1
            rooms.append({"id": n, "label": "Chad was here", "num": "?", "kind": "visit", "half": half})
        elif k == "spread":
            rooms.append({"id": n, "label": sp["title"], "num": sp["meta"].get("number", ""), "kind": "room", "half": half,
                          "worm": n == "wormholes", "first": (sp["picture_page"] or [""])[0]})
        else:
            rooms.append({"id": n, "label": "The end", "num": "", "kind": "door", "half": 1})
    # place: four to a row, snaking, each half on its own page of a 1600 x 800 sheet
    for h in (0, 1):
        mine = [r for r in rooms if r["half"] == h]
        for i, r in enumerate(mine):
            row, col = divmod(i, 4)
            if row % 2:
                col = 3 - col
            r["cx"] = h * 800 + 118 + col * 188
            # the left page reads down from the top; the right page climbs from the long hall
            r["cy"] = 168 + row * 176 if h == 0 else 520 - row * 176
    return rooms


def map_plan(rooms, suffix, here=False):
    W, H = 1600, 800
    o = [f'<svg class="mapsvg" viewBox="0 0 {W} {H}" role="img" aria-labelledby="mp-t{suffix}" focusable="false">'
         f'<title id="mp-t{suffix}">The map of the shop: a floor plan with one room for each spread, in reading order, '
         f'snaking across two pages; Chad\'s three visits are small round rooms; the wormholes room has a round door with a star.</title>'
         f'<defs><pattern id="mp-grid{suffix}" width="40" height="40" patternUnits="userSpaceOnUse">'
         f'<path d="M40 0H0V40" fill="none" class="mgrid"/></pattern></defs>'
         f'<rect width="{W}" height="{H}" class="mpaper"/><rect width="{W}" height="{H}" fill="url(#mp-grid{suffix})"/>'
         '<text x="60" y="78" class="mtitle">The Shop</text>'
         '<text x="860" y="78" class="msub">how a ghostwheel wakes up</text>'
         '<text x="60" y="106" class="msub">how we say things</text>']
    # corridors under the rooms, in reading order; the long hall joins the two pages
    pts = []
    for a, b in zip(rooms, rooms[1:]):
        if a["half"] != b["half"]:
            pts.append(f'M{a["cx"]},{a["cy"]} V700 H{b["cx"]} V{b["cy"]}')
        elif a["cy"] == b["cy"]:
            pts.append(f'M{a["cx"]},{a["cy"]} H{b["cx"]}')
        else:
            pts.append(f'M{a["cx"]},{a["cy"]} V{b["cy"]} H{b["cx"]}')
    o.append(f'<path d="{" ".join(pts)}" class="mhall"/>')
    o.append('<text x="800" y="728" text-anchor="middle" class="mnote">the long hall</text>')
    for r in rooms:
        x, y = r["cx"], r["cy"]
        tip = f'{r["num"]} {r["label"]}'.strip()
        inner = ""
        if r["kind"] == "visit":
            inner = (f'<circle cx="{x}" cy="{y}" r="32" class="mvisit"/>'
                     f'<text x="{x}" y="{y + 11}" text-anchor="middle" class="mq">?</text>')
        elif r["kind"] == "door":
            inner = (f'<path d="M{x - 44},{y + 34} V{y - 6} a44 44 0 0 1 88 0 V{y + 34} Z" class="mdoor"/>'
                     f'<text x="{x}" y="{y + 16}" text-anchor="middle" class="mlabel">{E(r["label"])}</text>')
        else:
            inner = (f'<rect x="{x - 66}" y="{y - 50}" width="132" height="100" rx="6" class="mroom"/>'
                     f'<path d="M{x - 12},{y - 50} h24 M{x - 12},{y + 50} h24 M{x - 66},{y - 10} v20 M{x + 66},{y - 10} v20" class="mgap"/>'
                     f'<text x="{x}" y="{y - 8}" text-anchor="middle" class="mnum">{E(r["num"])}</text>'
                     f'<text x="{x}" y="{y + 26}" text-anchor="middle" class="mlabel">{E(r["label"].lower())}</text>')
            if r.get("worm"):
                inner += (f'<circle cx="{x + 52}" cy="{y - 50}" r="16" class="mworm"/>'
                          f'<path d="M{x + 52},{y - 60} l3,7 7,1 -5,5 1,7 -6,-3 -6,3 1,-7 -5,-5 7,-1 z" class="mstar"/>'
                          f'<path d="M{x + 60},{y - 64} C {x + 90},{y - 120} {x + 150},{y - 112} {x + 180},{y - 150}" class="mout"/>')
        o.append(f'<a href="#room-{r["id"]}" class="room" data-room="{r["id"]}" data-cx="{x}" data-cy="{y}">'
                 f'<title>{E(tip)}</title>{inner}</a>')
    if here:
        o.append('<g id="here-plan" class="here" transform="translate(-200 -200)" aria-hidden="true">'
                 '<path d="M-17,10 V-6 a17 17 0 0 1 34 0 V10 l-6,-5 -5,5 -6,-5 -6,5 -5,-5 z" class="hghost"/>'
                 '<circle cx="-6" cy="-6" r="2.6" class="heye"/><circle cx="6" cy="-6" r="2.6" class="heye"/>'
                 '<text x="0" y="34" text-anchor="middle" class="hyou">you are here</text></g>')
    o.append('</svg>')
    return "".join(o)


def map_tiles(rooms):
    """The same rooms as a roguelike draws them: walls, floors, doors and corridors in letters."""
    TW, TH = 20, 25
    cols, rows = 80, 32
    g = [[" "] * cols for _ in range(rows)]
    rects = []
    for r in rooms:
        cx, cy = round(r["cx"] / TW), round(r["cy"] / TH)
        hw, hh = (2, 1) if r["kind"] != "room" else (3, 2)
        rects.append((r, cx - hw, cy - hh, cx + hw, cy + hh))

    def put(x, y, ch, over=False):
        if 0 <= x < cols and 0 <= y < rows and (over or g[y][x] == " "):
            g[y][x] = ch
    # corridors first, so rooms draw over them
    for (a, *_), (b, *_) in zip(rects, rects[1:]):
        ax, ay, bx, by = round(a["cx"] / TW), round(a["cy"] / TH), round(b["cx"] / TW), round(b["cy"] / TH)
        if a["half"] != b["half"]:
            hall = round(700 / TH)
            path = [(ax, y) for y in range(min(ay, hall), max(ay, hall) + 1)] + \
                   [(x, hall) for x in range(min(ax, bx), max(ax, bx) + 1)] + \
                   [(bx, y) for y in range(min(by, hall), max(by, hall) + 1)]
        else:
            path = [(ax, y) for y in range(min(ay, by), max(ay, by) + 1)] + \
                   [(x, by) for x in range(min(ax, bx), max(ax, bx) + 1)]
        for x, y in path:
            put(x, y, "#")
    for r, x0, y0, x1, y1 in rects:
        for x in range(x0, x1 + 1):
            for y in range(y0, y1 + 1):
                edge_x, edge_y = x in (x0, x1), y in (y0, y1)
                ch = "+" if g[y][x] == "#" and (edge_x or edge_y) else ("-" if edge_y else "|" if edge_x else ".")
                put(x, y, ch, over=True)
        lab = (r["num"] or ("?" if r["kind"] == "visit" else ">"))[:2]
        for i, ch in enumerate(lab):
            put((x0 + x1) // 2 - len(lab) // 2 + i, y0 + 1, ch, over=True)
    # textLength holds every row to the grid, whatever monospace face the reader has
    lines = "".join(f'<text x="0" y="{(y + 1) * TH - 6}" class="trow" textLength="{cols * TW}" lengthAdjust="spacing">'
                    f'{E("".join(row)).replace(" ", chr(160))}</text>' for y, row in enumerate(g))
    links = "".join(f'<a href="#room-{r["id"]}" class="room" data-room="{r["id"]}" data-tx="{(x0 + x1) // 2 * TW + 4}" '
                    f'data-ty="{(y1) * TH - 8}"><title>{E((r["num"] + " " + r["label"]).strip())}</title>'
                    f'<rect x="{x0 * TW}" y="{y0 * TH}" width="{(x1 - x0 + 1) * TW}" height="{(y1 - y0 + 1) * TH}" class="thit"/></a>'
                    for r, x0, y0, x1, y1 in rects)
    return (f'<svg class="mapsvg tiles" viewBox="0 0 {cols * TW} {rows * TH}" role="img" aria-labelledby="mt-t" focusable="false">'
            '<title id="mt-t">The same map drawn as a roguelike game draws it: walls of dashes and bars, floors of dots, '
            'corridors of hashes, doors of plus signs, and an at sign for you.</title>'
            f'<rect width="{cols * TW}" height="{rows * TH}" class="tbg"/>{lines}{links}'
            '<text id="here-tiles" class="tyou" x="-99" y="-99" aria-hidden="true">@</text></svg>')


def map_board(rooms):
    cols = [("how we say things", [r for r in rooms if r["half"] == 0]),
            ("how a ghostwheel wakes up", [r for r in rooms if r["half"] == 1])]
    out = []
    for title, rs in cols:
        cards = "".join(
            f'<li><a href="#room-{r["id"]}" class="card room k-{r["kind"]}" data-room="{r["id"]}">'
            f'<span class="cn">{E(r["num"])}</span><span class="ct">{E(r["label"])}</span>'
            + (f'<span class="cf">{E(r["first"])}</span>' if r.get("first") else "") + "</a></li>" for r in rs)
        out.append(f'<section class="col"><h3>{E(title)}</h3><ol>{cards}</ol></section>')
    return f'<div class="board">{"".join(out)}</div>'


# ---------------------------------------------------------------- the book
def build(meta, spreads, figs):
    pages, css, rooms = [], [], map_rooms(spreads)
    pno = 1  # the printed number is the number the bar says

    def add(left, right, label):
        pages.append((left, right, label))

    cover = next((s for s in spreads if s["name"] == "cover"), None)
    title = meta.get("title", "")
    if cover:
        left = picture_page(cover, figs, css, "L", pno, "entrance", extra=" titlepage", show_no=False)
        left = left.replace('<div class="plate">', f'<h1 class="vh">{E(title)}</h1><div class="plate">', 1)
    else:
        left = quiet_page("L", "entrance", "Title page", f'<h1>{E(title)}</h1>', gl=False)
    ded = meta.get("dedication", "").strip()
    right = quiet_page("R", "entrance", "Dedication" if ded else "A blank page, with the ghost light on it",
                       f'<p class="dedication">{E(ded)}</p>' if ded else "", cls="dedpage")
    add(left, right, "Title page and dedication")
    pno += 2
    for sp in spreads:
        k, n = sp["kind"], sp["name"]
        if n == "cover":
            continue
        if k == "intermezzo":
            part = (sp["meta"].get("part", "") or "").strip()
            if part:
                head, _, tail = part.partition(":")
                inner = f'<div class="parthead"><p class="pnum">{E(head.strip())}</p><p class="pname">{E(tail.strip())}</p></div>'
                lab = part
            else:
                inner, lab = "", "A quiet page, with the ghost light on it"
            add(quiet_page("L", n, lab, inner, cls="partpage"),
                picture_page(sp, figs, css, "R", pno + 1, n), f"{part or 'A visit'}: Chad")
        elif k == "spread":
            add(picture_page(sp, figs, css, "L", pno, n), fuller_page(sp, "R", pno + 1, n),
                f'{sp["meta"].get("number", "")} {sp["title"]}'.strip())
        else:  # the closing card: its picture, and the colophon facing it
            col = "".join(f"<p>{E(p)}</p>" for p in sp["fuller_page"])
            add(picture_page(sp, figs, css, "L", pno, n),
                f'<div class="page R colophon" data-room="{n}" role="group" aria-roledescription="page" aria-label="Colophon">'
                f'<div class="inner" data-fs="2.5"><h2>Colophon</h2>{col}</div><span class="pageno">{pno + 1}</span></div>', sp["title"])
        pno += 2
    news, clog = os.path.join(spread.SRC, "NEWS"), os.path.join(spread.SRC, "ChangeLog")
    if os.path.exists(news) and os.path.exists(clog):
        last = rooms[-1]["id"]
        add(text_page("L", last, "NEWS", "NEWS", open(news, encoding="utf-8").read().strip(), pno),
            text_page("R", last, "ChangeLog", "ChangeLog", open(clog, encoding="utf-8").read().strip(), pno + 1), "NEWS and ChangeLog")
        pno += 2
    plan = map_plan(rooms, "-e")
    last = rooms[-1]["id"]
    add(f'<div class="page L endpaper" data-room="{last}" role="group" aria-roledescription="page" aria-label="The map, left half">'
        f'<div class="half h0">{plan.replace("mp-", "mpl-")}</div></div>',
        f'<div class="page R endpaper" data-room="{last}" role="group" aria-roledescription="page" aria-label="The map, right half">'
        f'<div class="half h1">{plan.replace("mp-", "mpr-")}</div></div>', "The map, inside the back cover")
    return pages, css, rooms


CSS = r"""
:root{--paper:#fbf6ec;--ink:#2d2a32;--ink2:#5b5560;--accent:#b4532f;--room:#e6dccb;--room2:#d9ccb6;--bar:#2d2a32;--bar-ink:#fbf6ec;
--barh:4.25rem;--lamp:rgba(255,236,190,.55);--focus:#1d6fd6;
--easy:"Atkinson Hyperlegible","Andika","Lexend","Inter","Verdana","DejaVu Sans",system-ui,sans-serif;
--serif:"Charter","Bitstream Charter","Iowan Old Style","Lora","Georgia","DejaVu Serif",serif;--mono:"DejaVu Sans Mono","Menlo","Consolas",monospace}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--room:#241f1b;--room2:#16120f;--bar:#0f0d0b;--lamp:rgba(255,214,150,.16)}}
:root[data-theme="dark"]{--room:#241f1b;--room2:#16120f;--bar:#0f0d0b;--lamp:rgba(255,214,150,.16)}
*{box-sizing:border-box}html,body{margin:0;height:100%}
body{background:radial-gradient(ellipse at 50% 42%,var(--room) 0%,var(--room2) 100%);color:var(--ink);font-family:var(--easy);overflow:hidden}
.vh{position:absolute!important;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap}
main{position:fixed;inset:0 0 var(--barh) 0;display:grid;place-items:center}
main::before{content:"";position:absolute;inset:0;background:radial-gradient(ellipse 60% 55% at 50% 48%,var(--lamp),transparent 70%);pointer-events:none}
.book{position:relative;width:min(96vw,calc((100vh - var(--barh) - 2.5rem) * 2));aspect-ratio:2/1}
.page{position:absolute;top:0;width:50%;height:100%;container-type:size;background:var(--paper);overflow:hidden;display:none}
.page.on{display:block;animation:turn .42s cubic-bezier(.2,.7,.2,1)}
.page.L{left:0;border-radius:1.2cqw 0 0 1.2cqw;box-shadow:-.6cqw .8cqw 2.4cqw rgba(0,0,0,.32)}
.page.R{right:0;border-radius:0 1.2cqw 1.2cqw 0;box-shadow:.6cqw .8cqw 2.4cqw rgba(0,0,0,.32)}
.page.L::after,.page.R::after{content:"";position:absolute;top:0;bottom:0;width:7%;pointer-events:none;z-index:4}
.page.L::after{right:0;background:linear-gradient(90deg,transparent,rgba(80,60,40,.16))}
.page.R::after{left:0;background:linear-gradient(270deg,transparent,rgba(80,60,40,.18))}
@keyframes turn{from{opacity:.25;transform:translateY(.4%)}to{opacity:1;transform:none}}
.pageno{position:absolute;bottom:2.2cqw;font-family:var(--serif);font-size:2cqw;color:var(--ink2);z-index:3}
.L .pageno{left:3.4cqw}.R .pageno{right:3.4cqw}
:focus-visible{outline:3px solid var(--focus);outline-offset:2px}
/* the picture page */
.plate{position:absolute;inset:0}
.art{position:absolute;left:0;right:0}.pic{display:block;width:100%;height:100%}
.pic-full .art{inset:0}
.pic-top .art{top:0;height:75%}
.pic-top.lay-above .art{top:auto;bottom:0}
.words{position:absolute;font-family:var(--easy);color:var(--ink);line-height:1.26;z-index:2}
.words p{margin:0 0 .35em}
.al-left{text-align:left}.al-center{text-align:center}.al-right{text-align:right}
.band{left:6%;right:6%;font-size:3.7cqw;display:flex;flex-direction:column;justify-content:center}
.pic-top .band.below{top:75%;bottom:5%}.pic-top .band.above{top:3%;height:22%}
.pic-full .band.below{bottom:6%}.pic-full .band.above{top:5%}
.inset{font-size:4cqw}
.scatter{position:absolute;inset:0}.scatter .w{position:absolute;font-size:4cqw;margin:0}
.wrap{inset:5%;font-size:3.8cqw}.wrap .shape{width:100%;height:100%;shape-margin:2.5%}
.soft,.inset.soft{background:radial-gradient(ellipse at 50% 50%,rgba(251,246,236,.94) 55%,rgba(251,246,236,0) 100%);padding:.5em .8em;border-radius:1.5em}
.soft-in{background:rgba(251,246,236,.9);box-decoration-break:clone;-webkit-box-decoration-break:clone;padding:.06em .32em;border-radius:.35em}
.titlepage .scatter .w{font-size:4.6cqw}
.pic .titlearc{font:700 44px var(--serif);fill:#4a3b2a;letter-spacing:.4px;paint-order:stroke;stroke:#fbf6ec;stroke-width:5px;stroke-linejoin:round}
/* the fuller page */
.inner{position:absolute;inset:0;overflow:auto;padding:5.5cqw 6.5cqw 6.5cqw 8.5cqw}
.fullpage .inner{display:flex;flex-direction:column}
h2{font-family:var(--serif);font-weight:600;font-size:4.2cqw;margin:0 0 1.6cqw;color:var(--ink)}
h2 .num{color:var(--accent);margin-right:.25em}
.fuller{font-family:var(--serif);font-size:calc(var(--fs,2.2) * 1cqw);line-height:1.44;color:var(--ink);hyphens:auto}
.fuller p{margin:0 0 .6em}
.claim{border-radius:.2em;box-decoration-break:clone;-webkit-box-decoration-break:clone;
background:linear-gradient(transparent 12%,rgba(233,196,106,calc(var(--hl,0) * .6)) 12%,rgba(233,196,106,calc(var(--hl,0) * .6)) 92%,transparent 92%)}
.mark{font:600 1.5cqw/1 var(--easy);display:inline-flex;align-items:center;justify-content:center;vertical-align:.45em;
width:2.6cqw;height:2.6cqw;margin-left:.18em;padding:0;border-radius:50%;border:.22cqw solid var(--accent);background:var(--paper);color:var(--accent);cursor:pointer}
.mark[aria-expanded="true"],.mark:hover{background:var(--accent);color:var(--paper)}
.diagram{margin:auto 0 1.2cqw;padding:0}
.dia{display:block;width:100%;height:auto;max-height:26cqh}
.diagram figcaption{font-family:var(--serif);font-style:italic;font-size:1.8cqw;color:var(--ink2);margin-top:.5cqw}
.dia text{font-family:var(--easy)}
.dia .dl{font-size:17px;fill:var(--ink2)}.dia .dn{font-size:26px;font-weight:700;fill:#c9b79c}.dia .dh{font-size:17px;fill:var(--ink2);letter-spacing:.04em}
.dia .edge{fill:none;stroke:#9c8a74;stroke-width:2.5px;stroke-dasharray:7 7}.dia .ringline{fill:none;stroke:#b98f5a;stroke-width:4px;stroke-linejoin:round}
.dia .node{stroke:#2d2a32;stroke-width:2.5}.dia .scr{fill:#fffdf6;opacity:.8}.dia .spare{fill:#f1e7d6;stroke-dasharray:4 3}
.dia .tile{stroke:#2d2a32;stroke-width:2}.dia .tl{font-size:24px;font-weight:700;fill:#fffdf6}
.dia .tile.dim{fill:#ece3d4;stroke-dasharray:5 4}.dia .tdim{fill:#8b7f73}
.dia .cell{fill:#fffdf6;stroke:#b8a990;stroke-width:2}.dia .cell.own{fill:#f3eeff;stroke:#6d5fb3}
.dia .cw{font-size:19px;font-weight:600;fill:var(--ink)}
.dia .floor{fill:#fffdf6;stroke:#b8a990;stroke-width:2}.dia .rung.lit .floor{fill:#fff1c9;stroke:#c9a14a;stroke-width:3}
.witness{position:absolute;left:5%;right:5%;bottom:4%;max-height:80%;overflow:auto;background:#fffdf8;border:.3cqw solid var(--accent);
border-radius:1.6cqw;padding:2.4cqw 3cqw;box-shadow:0 1.2cqw 4cqw rgba(0,0,0,.3);font-family:var(--serif);font-size:1.95cqw;z-index:5}
.witness h3{font-size:2.4cqw;margin:0 0 1cqw}.witness ol{margin:0;padding-left:1.3em}.witness li{margin:0 0 1.4cqw}
.witness .said{font-style:italic;margin:0 0 .4cqw}.witness dl{display:grid;grid-template-columns:auto 1fr;gap:.2cqw 1.6cqw;margin:0}
.witness dt{color:var(--ink2)}.witness dd{margin:0}.witness .sha{font-family:var(--mono);font-size:1.6cqw;word-break:break-all}
.witness .note,.witness .dagger{color:var(--ink2);margin:.5cqw 0 0}.witness .close{margin-top:1cqw;font:inherit;cursor:pointer}
/* quiet pages: the dedication, the Part pages */
.quiet .gl{position:absolute;left:50%;bottom:9%;width:15%;transform:translateX(-50%)}
.dedpage .gl{width:13%;bottom:12%}
.partpage .gl{width:11%;bottom:8%;opacity:.85}
.dedication{position:absolute;left:14%;right:14%;top:30%;text-align:center;font-family:var(--serif);font-style:italic;font-size:3.6cqw;color:var(--ink2)}
.parthead{position:absolute;left:10%;right:10%;top:26%;text-align:center}
.pnum{font-family:var(--serif);font-size:8cqw;margin:0;color:var(--accent);font-weight:600}
.pname{font-family:var(--serif);font-style:italic;font-size:4.6cqw;margin:.6cqw 0 0;color:var(--ink)}
.colophon .inner{padding:10cqw 9cqw 9cqw 10cqw;font-family:var(--serif);font-size:calc(var(--fs,2.5) * 1cqw);line-height:1.5;color:var(--ink)}
.textpage h2{font-size:3.6cqw}
.gnu{font-family:var(--mono);font-size:calc(var(--fs,1.75) * 1cqw);line-height:1.45;white-space:pre-wrap;margin:0;color:var(--ink);tab-size:8}
/* the map */
.endpaper{background:#efe3c8}.endpaper .half{position:absolute;inset:0;overflow:hidden}
.endpaper .mapsvg{position:absolute;top:0;height:100%;width:200%}.endpaper .h0 .mapsvg{left:0}.endpaper .h1 .mapsvg{left:-100%}
.mpaper{fill:#f1e6cc}.mgrid{stroke:#d9c9a6;stroke-width:1}
.mtitle{font:700 44px var(--serif);fill:#4a3b2a}.msub{font:italic 24px var(--serif);fill:#6b5a44}.mnote{font:italic 20px var(--serif);fill:#7d6a52}
.mhall{fill:none;stroke:#d8c39a;stroke-width:26;stroke-linejoin:round;stroke-linecap:round}
.mroom{fill:#fbf6ec;stroke:#3b2f24;stroke-width:6}.mgap{stroke:#fbf6ec;stroke-width:7}
.mnum{font:700 34px var(--easy);fill:#b4532f}.mlabel{font:600 20px var(--easy);fill:#3b2f24}
.mvisit{fill:#fbf6ec;stroke:#3b2f24;stroke-width:5;stroke-dasharray:9 6}.mq{font:700 30px var(--serif);fill:#6d5fb3}
.mdoor{fill:#e9c46a;stroke:#3b2f24;stroke-width:5}
.mworm{fill:#e7e0ff;stroke:#3b2f24;stroke-width:4}.mstar{fill:#e9c46a;stroke:#3b2f24;stroke-width:1.5}.mout{fill:none;stroke:#6d5fb3;stroke-width:3;stroke-dasharray:6 7}
.room{cursor:pointer}.room:focus-visible .mroom,.room:hover .mroom{stroke:var(--focus)}
.hghost{fill:#fffdf6;stroke:#2d2a32;stroke-width:2.5}.heye{fill:#2d2a32}.hyou{font:italic 700 18px var(--serif);fill:#1d6fd6}
.here{transition:transform .35s}
.tbg{fill:#14110e}.trow{font:22px var(--mono);fill:#b9e3a6;white-space:pre}.thit{fill:transparent}.tyou{font:700 24px var(--mono);fill:#ffd166}
.room:focus-visible .thit,.room:hover .thit{fill:rgba(255,209,102,.18)}
/* the map's window */
.mapwin{position:fixed;inset:3vh 3vw calc(var(--barh) + 2vh);z-index:20;background:#f6eedd;color:var(--ink);border-radius:1rem;
box-shadow:0 1.5rem 4rem rgba(0,0,0,.45);display:flex;flex-direction:column;padding:1rem 1.25rem}
.mapwin[hidden]{display:none}
.mapwin header{display:flex;flex-wrap:wrap;align-items:center;gap:.6rem 1rem}
.mapwin h2{font-size:1.5rem;margin:0 auto 0 0}
.looks button,.mapwin .x{font:inherit;border:2px solid var(--ink);background:transparent;border-radius:999px;padding:.3rem .9rem;cursor:pointer;color:var(--ink)}
.looks button[aria-pressed="true"]{background:var(--ink);color:#f6eedd}
.mapwin .stage{flex:1;min-height:0;display:flex;align-items:center;justify-content:center;margin:.6rem 0}
.mapwin .look{width:100%;height:100%;display:flex;align-items:center;justify-content:center}.mapwin .look[hidden]{display:none}
.mapwin .mapsvg{width:100%;height:100%}
.mapwin .legend{font-family:var(--serif);font-size:.95rem;color:var(--ink2);margin:0}
.mapwin .privacy{font-size:.85rem;color:var(--ink2);margin:.5rem 0 0}.mapwin .privacy code{font-size:.85em}
.mapwin .privacy button{font:inherit;border:1px solid var(--ink2);background:transparent;border-radius:999px;padding:.1rem .7rem;cursor:pointer;color:var(--ink)}
.board{display:grid;grid-template-columns:1fr 1fr;gap:1.2rem;width:100%;height:100%;overflow:auto}
.board h3{font:italic 1.1rem var(--serif);margin:0 0 .5rem}.board ol{list-style:none;margin:0;padding:0;display:grid;grid-template-columns:repeat(auto-fill,minmax(11rem,1fr));gap:.6rem}
.card{display:flex;flex-direction:column;gap:.15rem;text-decoration:none;color:var(--ink);background:#fffdf8;border:2px solid #cdbb98;border-radius:.6rem;padding:.55rem .7rem;min-height:4.6rem}
.card .cn{font-weight:700;color:var(--accent)}.card .ct{font-weight:600}.card .cf{font-size:.8rem;color:var(--ink2)}
.card.k-visit{border-style:dashed}.card[aria-current="page"]{border-color:var(--focus);box-shadow:0 0 0 3px rgba(29,111,214,.35)}
.nudge{position:fixed;left:50%;bottom:calc(var(--barh) + 1rem);transform:translateX(-50%);z-index:15;background:#fffdf8;color:var(--ink);
border:2px solid var(--accent);border-radius:999px;padding:.5rem 1rem;font:1rem var(--easy);box-shadow:0 .5rem 1.5rem rgba(0,0,0,.3);display:flex;gap:.7rem;align-items:center}
.nudge[hidden]{display:none}.nudge button{font:inherit;border:0;background:var(--accent);color:#fff;border-radius:999px;padding:.3rem .8rem;cursor:pointer}
.nudge .no{background:transparent;color:var(--ink2)}
/* controls */
.bar{position:fixed;left:0;right:0;bottom:0;height:calc(var(--barh) + env(safe-area-inset-bottom, 0px));display:flex;align-items:center;justify-content:center;gap:1rem;background:var(--bar);color:var(--bar-ink);font:1rem/1.2 var(--easy);padding:0 max(1rem, env(safe-area-inset-right, 0px)) env(safe-area-inset-bottom, 0px) max(1rem, env(safe-area-inset-left, 0px))}
.bar button{font:inherit;color:inherit;background:transparent;border:2px solid currentColor;border-radius:999px;padding:.45rem 1.1rem;cursor:pointer;min-width:6rem}
.bar button:disabled{opacity:.35;cursor:default}
.where{min-width:15rem;text-align:center}.keys{opacity:.7;font-size:.85rem}
.turnedge{position:fixed;top:0;bottom:var(--barh);width:6vw;border:0;background:transparent;cursor:pointer;z-index:2;color:transparent}
.turnedge.prev{left:0}.turnedge.next{right:0}.turnedge:focus-visible{outline:3px solid var(--focus);outline-offset:-6px;color:var(--bar-ink)}
/* one page at a time, on a narrow screen */
@media (max-width:760px),(max-aspect-ratio:1/1){
.book{width:calc(100vw - 32px);height:calc(100vh - var(--barh) - 1.5rem);aspect-ratio:auto}
.page{width:100%;left:0!important;right:auto!important;border-radius:1.2cqw!important}
.picpage.on{overflow-y:auto}.pic-full.on{display:flex;align-items:center}
.plate{position:relative;inset:auto;width:100%;aspect-ratio:1/1}
.pic-full .words .w,.pic-full .inset{font-size:max(14px,4cqw)!important}
.pic-top .plate{aspect-ratio:auto}.pic-top .art{position:relative;height:auto;aspect-ratio:4/3}
.pic-top .words,.pic-top .words .w{position:static!important;width:auto!important;display:block;font-size:max(18px,4.6cqw)!important;text-align:left!important}
.pic-top .words{padding:3% 6% 12%}.pic-top .words .w{margin:0 0 .5em}
.page.L::after,.page.R::after{display:none}
.fuller{font-size:max(16px,2.6cqw)}.fullpage h2{font-size:max(21px,4.2cqw)}.mark{width:max(20px,2.6cqw);height:max(20px,2.6cqw);font-size:max(12px,1.5cqw)}
.endpaper .h0 .mapsvg,.endpaper .h1 .mapsvg{width:200%}
.keys{display:none}.bar button{min-width:auto}.where{min-width:0;font-size:.85rem}.board{grid-template-columns:1fr}}
@media (prefers-reduced-motion:reduce){*,*::before,*::after{animation:none!important;transition:none!important}}
@media print{body{overflow:visible;background:#fff}main{position:static;display:block}main::before,.bar,.turnedge,.nudge,.mapwin{display:none!important}
.book{width:100%;aspect-ratio:auto}.page{position:relative;display:block!important;width:100%;aspect-ratio:1/1;break-after:page;box-shadow:none;border-radius:0!important}
.inner{overflow:visible}.witness{display:none!important}*{animation:none!important}}
"""

JS = r"""
// @license magnet:?xt=urn:btih:1f739d935676111cfff4b4693e3816e664797050&dn=gpl-3.0.txt GPL-3.0-or-later
(function () {
  'use strict';
  var root = document.documentElement;
  var pages = [].slice.call(document.querySelectorAll('.book .page'));
  var live = document.getElementById('live'), where = document.getElementById('where');
  var prevB = document.getElementById('prev'), nextB = document.getElementById('next');
  var mapB = document.getElementById('mapbtn'), mapW = document.getElementById('mapwin');
  var nudge = document.getElementById('nudge');
  var narrowQ = window.matchMedia('(max-width:760px),(max-aspect-ratio:1/1)');
  var cur = 0, opener = null, mapOpener = null, moves = [], nudged = 0, look = 'plan';
  var labels = JSON.parse(document.getElementById('labels').textContent);
  try { look = localStorage.getItem('gwbook.look') || 'plan'; } catch (e) { /* a private window */ }

  function narrow() { return narrowQ.matches; }
  function shown() { return narrow() ? [cur] : [cur - (cur % 2), cur - (cur % 2) + 1]; }
  function closeNotes() {
    var open = [].slice.call(document.querySelectorAll('.witness:not([hidden])'));
    open.forEach(function (w) {
      w.hidden = true;
      var b = document.querySelector('.mark[aria-controls="' + w.id + '"]');
      if (b) b.setAttribute('aria-expanded', 'false');
    });
    return open.length > 0;
  }
  // A typesetter's fit: step the type down until the page holds it, rather than let it scroll.
  function fit(p) {
    var inner = p.querySelector('.inner[data-fs]');
    if (!inner) return;
    var fs = parseFloat(inner.getAttribute("data-fs")), lo = fs * 0.74;
    inner.style.setProperty('--fs', String(fs));
    if (narrow()) return;
    while (inner.scrollHeight > inner.clientHeight + 1 && fs > lo) { fs -= 0.05; inner.style.setProperty('--fs', fs.toFixed(2)); }
  }
  function draw(quiet) {
    var on = shown();
    pages.forEach(function (p, k) {
      var vis = on.indexOf(k) >= 0;
      p.classList.toggle('on', vis);
      if (vis) p.removeAttribute('inert'); else p.setAttribute('inert', '');
    });
    on.forEach(function (k) { if (pages[k]) fit(pages[k]); });
    var v = cur >> 1, n = pages.length;
    var text = narrow() ? ('Page ' + (cur + 1) + ' of ' + n + ' · ' + labels[v])
                        : ('Pages ' + (on[0] + 1) + '–' + (on[1] + 1) + ' of ' + n + ' · ' + labels[v]);
    where.textContent = text;
    if (!quiet) live.textContent = text;
    prevB.disabled = cur === 0;
    nextB.disabled = narrow() ? cur >= n - 1 : (cur >> 1) >= (n >> 1) - 1;
    root.setAttribute('data-page', String(cur));
    if (history.replaceState) history.replaceState(null, '', '#p' + (cur + 1));
    markHere();
  }
  function go(p, quiet, how) {
    p = Math.max(0, Math.min(pages.length - 1, p | 0));
    if (p === cur && !quiet) return;
    var dir = p > cur ? 1 : -1, was = cur;
    cur = p; closeNotes(); draw(quiet);
    if (!quiet && how !== 'jump' && p !== was) watch(dir);
  }
  function next() {
    if (narrow()) { go(cur + 1); return; }
    if ((cur - cur % 2) + 2 < pages.length) go((cur - cur % 2) + 2);
  }
  function prev() { go(narrow() ? cur - 1 : (cur - cur % 2) - 2); }

  // Someone who pages back and forth is looking for their place: offer the map, once in a while.
  function watch(dir) {
    var now = Date.now();
    moves.push({ d: dir, t: now });
    moves = moves.filter(function (m) { return now - m.t < 30000; });
    var flips = 0;
    for (var i = 1; i < moves.length; i++) if (moves[i].d !== moves[i - 1].d) flips++;
    if (flips >= 4 && now - nudged > 120000 && mapW.hidden) {
      nudged = now; moves = [];
      nudge.hidden = false;
      live.textContent = 'Looking for your place? Press M for the map.';
      setTimeout(function () { nudge.hidden = true; }, 9000);
    }
  }

  // the map
  function roomOf(p) { return pages[p].getAttribute('data-room'); }
  function firstPageOf(room) {
    for (var i = 0; i < pages.length; i++) if (pages[i].getAttribute('data-room') === room) return i;
    return -1;
  }
  function markHere() {
    var room = roomOf(cur);
    var a = mapW.querySelector('.look-plan .room[data-room="' + room + '"]');
    var g = document.getElementById('here-plan');
    if (a && g) g.setAttribute('transform', 'translate(' + a.getAttribute('data-cx') + ' ' + (+a.getAttribute('data-cy') - 98) + ')');
    var t = mapW.querySelector('.look-tiles .room[data-room="' + room + '"]'), at = document.getElementById('here-tiles');
    if (t && at) { at.setAttribute('x', t.getAttribute('data-tx')); at.setAttribute('y', t.getAttribute('data-ty')); }
    [].slice.call(mapW.querySelectorAll('.board .card')).forEach(function (c) {
      if (c.getAttribute('data-room') === room) c.setAttribute('aria-current', 'page'); else c.removeAttribute('aria-current');
    });
  }
  function setLook(l, pick) {
    look = l;
    [].slice.call(mapW.querySelectorAll('.looks button')).forEach(function (b) { b.setAttribute('aria-pressed', String(b.getAttribute('data-look') === l)); });
    [].slice.call(mapW.querySelectorAll('.look')).forEach(function (s) { s.hidden = !s.classList.contains('look-' + l); });
    if (pick) try { localStorage.setItem('gwbook.look', l); } catch (e) { /* fine */ }
  }
  function openMap(from) {
    nudge.hidden = true; closeNotes();
    mapOpener = from || document.activeElement;
    setLook(look); markHere();
    mapW.hidden = false; mapB.setAttribute('aria-expanded', 'true');
    document.getElementById('map-h').focus();
  }
  function closeMap() {
    if (mapW.hidden) return false;
    mapW.hidden = true; mapB.setAttribute('aria-expanded', 'false');
    if (mapOpener && mapOpener.focus) mapOpener.focus();
    return true;
  }

  document.addEventListener('keydown', function (e) {
    if (e.altKey || e.ctrlKey || e.metaKey) return;
    var k = e.key, t = e.target, onButton = t && t.closest && t.closest('button, a');
    if (k === 'Escape') {
      if (closeMap() || closeNotes()) { e.preventDefault(); if (opener && mapW.hidden) opener.focus(); }
      nudge.hidden = true;
      return;
    }
    if (k === 'm' || k === 'M') { e.preventDefault(); if (mapW.hidden) openMap(); else closeMap(); return; }
    if (!mapW.hidden) return;
    if (k === 'ArrowRight' || k === 'PageDown' || (k === ' ' && !onButton && !e.shiftKey)) { e.preventDefault(); next(); }
    else if (k === 'ArrowLeft' || k === 'PageUp' || (k === ' ' && !onButton && e.shiftKey)) { e.preventDefault(); prev(); }
    else if (k === 'Home') { e.preventDefault(); go(0, false, 'jump'); }
    else if (k === 'End') { e.preventDefault(); go(pages.length - 1, false, 'jump'); }
  });
  prevB.addEventListener('click', prev);
  nextB.addEventListener('click', next);
  document.getElementById('edge-prev').addEventListener('click', prev);
  document.getElementById('edge-next').addEventListener('click', next);
  mapB.addEventListener('click', function () { if (mapW.hidden) openMap(mapB); else closeMap(); });
  document.getElementById('mapclose').addEventListener('click', closeMap);
  document.getElementById('nudge-yes').addEventListener('click', function () { openMap(mapB); });
  document.getElementById('nudge-no').addEventListener('click', function () { nudge.hidden = true; });
  [].slice.call(mapW.querySelectorAll('.looks button')).forEach(function (b) {
    b.addEventListener('click', function () { setLook(b.getAttribute('data-look'), true); });
  });

  document.addEventListener('click', function (e) {
    var r = e.target.closest && e.target.closest('a.room');
    if (r) {
      e.preventDefault();
      var p = firstPageOf(r.getAttribute('data-room'));
      if (p >= 0) { closeMap(); go(p, false, 'jump'); }
      return;
    }
    var b = e.target.closest && e.target.closest('.mark');
    if (b) {
      var w = document.getElementById(b.getAttribute('aria-controls')), wasOpen = !w.hidden;
      closeNotes();
      if (!wasOpen) { w.hidden = false; b.setAttribute('aria-expanded', 'true'); opener = b; w.querySelector('h3').focus(); }
      return;
    }
    var c = e.target.closest && e.target.closest('[data-close]');
    if (c) { closeNotes(); if (opener) opener.focus(); }
  });
  function lightClaim(e, on) {
    var b = e.target.closest && e.target.closest('.mark');
    if (!b) return;
    [].slice.call(b.closest('.page').querySelectorAll('.claim[data-fact="' + b.getAttribute('data-fact') + '"]')).forEach(function (s) {
      if (on) s.style.setProperty('--hl', '1'); else s.style.removeProperty('--hl');
    });
  }
  document.addEventListener('focusin', function (e) { lightClaim(e, true); });
  document.addEventListener('focusout', function (e) { lightClaim(e, false); });
  document.addEventListener('mouseover', function (e) { lightClaim(e, true); });
  document.addEventListener('mouseout', function (e) { lightClaim(e, false); });
  narrowQ.addEventListener('change', function () { draw(true); });
  var rs = 0;
  window.addEventListener('resize', function () { clearTimeout(rs); rs = setTimeout(function () { shown().forEach(function (k) { if (pages[k]) fit(pages[k]); }); }, 150); });

  // Forget my settings: remove every key this book writes (all begin "gwbook.") and say so.
  document.getElementById('forget').addEventListener('click', function () {
    var gone = 0;
    try {
      for (var i = localStorage.length - 1; i >= 0; i--) {
        var key = localStorage.key(i);
        if (key && key.indexOf('gwbook.') === 0) { localStorage.removeItem(key); gone++; }
      }
    } catch (e) { /* a private window: nothing was stored */ }
    document.getElementById('forgot').textContent = gone ? 'Forgotten. Nothing from this book is stored in this browser now.'
                                                         : 'Nothing from this book was stored in this browser.';
  });

  window.book = { go: go, get page() { return cur; }, count: pages.length, openMap: openMap, closeMap: closeMap,
                  narrow: narrow, shown: shown };
  // #privacy (linked from the house page) opens the map at the note on what this book remembers;
  // read it before go() writes the page into the address.
  var askedPrivacy = location.hash === '#privacy';
  var m = /^#p(\d+)$/.exec(location.hash || '');
  var h = m ? parseInt(m[1], 10) : 1;
  cur = -1; go(h >= 1 && h <= pages.length ? h - 1 : 0, true);
  if (askedPrivacy) { openMap(); document.getElementById('privacy').focus(); }
})();
// @license-end
"""


def main():
    meta, spreads = spread.read_book()
    # The request-log sentence is the book's own: lo1re renders it from the logreq register into
    # src/privacy-log (line 1: the rows it came from and the sentence's sha256; line 2: the sentence).
    # It is read here and typed nowhere else; checks/run.sh privacy holds the note to it and it to its stamp.
    with open(os.path.join(spread.SRC, "privacy-log"), encoding="utf-8") as fh:
        book_log = fh.read().split("\n")[1]
    defs, figs = slides.load_figures()
    views, css, rooms = build(meta, spreads, figs)
    style = CSS + "\n" + "\n".join(css)
    labels = [lab for _, _, lab in views]
    import json
    labels_json = json.dumps(labels).replace("<", "\\u003c")
    csp = ("default-src 'none'; img-src data:; "
           f"style-src 'sha256-{slides.sha256_b64(style)}'; script-src 'sha256-{slides.sha256_b64(JS)}'; "
           "base-uri 'none'; form-action 'none'")
    title = meta.get("title", "Book")
    body = "\n".join(l + "\n" + r for l, r, _ in views)
    mapwin = (f'<div class="mapwin" id="mapwin" role="dialog" aria-modal="true" aria-labelledby="map-h" hidden>'
              f'<header><h2 id="map-h" tabindex="-1">The map of the shop</h2>'
              f'<div class="looks" role="group" aria-label="How the map is drawn">'
              f'<button type="button" data-look="plan" aria-pressed="true">Floor plan</button>'
              f'<button type="button" data-look="tiles" aria-pressed="false">Tiles</button>'
              f'<button type="button" data-look="board" aria-pressed="false">Board</button></div>'
              f'<button type="button" class="x" id="mapclose">Close <span aria-hidden="true">(Esc)</span></button></header>'
              f'<div class="stage"><div class="look look-plan">{map_plan(rooms, "-w", here=True)}</div>'
              f'<div class="look look-tiles" hidden>{map_tiles(rooms)}</div>'
              f'<div class="look look-board" hidden>{map_board(rooms)}</div></div>'
              f'<p class="legend">Each room is one spread of the book, in the order you read it; choose one to go there. '
              f'The round rooms are where Chad turned up. The door with a star is a wormhole. '
              f'A paper book stops at the page: the numbered marks (Pin\'s notes) and this map are where this one goes on past it.</p>'
              f'<p class="privacy" id="privacy" tabindex="-1">This book remembers which map view you last picked '
              f'(<code>gwbook.look</code>), in your browser only; nothing is sent anywhere. '
              f'{E(book_log, quote=False)} '
              f'<button type="button" id="forget">Forget my settings</button> <span id="forgot" role="status"></span></p></div>')
    doc = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Security-Policy" content="{csp}">
<meta name="color-scheme" content="light dark">
<title>{E(title)}</title>
<meta name="description" content="{E(title)} {E(meta.get('subtitle', ''))}">
<meta name="generator" content="ghostwheel tools/book.py">
<!-- {E(meta.get('copyright', ''))}. Code that made this page, and the script in it: GPL-3.0-or-later. -->
<style>{style}</style>
</head>
<body>
<svg width="0" height="0" class="vh" aria-hidden="true" focusable="false"><defs>{defs}</defs></svg>
<main aria-label="{E(title)}">
<p class="vh" id="howto">A picture book with facing pages. The arrow keys, Page Up and Page Down, Space, or the buttons at the bottom turn the pages. M opens the map of the book. Numbered marks in the text open Pin's notes on where each fact came from; Escape closes them.</p>
<div class="book" aria-describedby="howto">
{body}
</div>
</main>
<button type="button" class="turnedge prev" id="edge-prev" aria-label="Previous pages">previous</button>
<button type="button" class="turnedge next" id="edge-next" aria-label="Next pages">next</button>
{mapwin}
<div class="nudge" id="nudge" role="status" hidden><span>Looking for your place?</span>
<button type="button" id="nudge-yes">Show the map</button><button type="button" class="no" id="nudge-no">No, thanks</button></div>
<nav class="bar" aria-label="Pages">
<button type="button" id="prev"><span aria-hidden="true">&larr;</span> Back</button>
<span class="where" id="where" aria-hidden="true"></span>
<button type="button" id="next">Next <span aria-hidden="true">&rarr;</span></button>
<button type="button" id="mapbtn" aria-expanded="false" aria-controls="mapwin">Map</button>
<span class="keys" aria-hidden="true">keys: &larr; &rarr; &middot; M map &middot; Home End</span>
</nav>
<div class="vh" id="live" role="status" aria-live="polite"></div>
<script type="application/json" id="labels">{labels_json}</script>
<script>{JS}</script>
</body>
</html>
"""
    os.makedirs(spread.OUT, exist_ok=True)
    # The hosted edition: the host wraps the page in its own skeleton and enforces its own policy,
    # so this one carries no doctype, head or CSP of its own; everything else is the same page.
    body_start = doc.index("<body>") + len("<body>")
    hosted = (f"<title>{E(title)}</title>\n<meta name=\"description\" content=\"{E(title)} {E(meta.get('subtitle', ''))}\">\n"
              f"<!-- {E(meta.get('copyright', ''))}. Code that made this page, and the script in it: GPL-3.0-or-later. -->\n"
              f"<style>{style}</style>\n" + doc[body_start:doc.index("</body>")].strip() + "\n")
    with open(os.path.join(spread.OUT, "book-hosted.html"), "w", encoding="utf-8") as fh:
        fh.write(hosted)
    out = os.path.join(spread.OUT, "book.html")
    with open(out, "w", encoding="utf-8") as fh:
        fh.write(doc)
    print(f"book: {out}: {len(views)} openings, {2 * len(views)} pages, {len(doc) // 1024} KB")


if __name__ == "__main__":
    main()
