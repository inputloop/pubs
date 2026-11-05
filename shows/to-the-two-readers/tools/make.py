#!/usr/bin/env python3
# make.py -- draw the mark "To the Two Readers" and its show page, from Corwin's four frames (2026-11-04).
# Writes public/logo.svg (the mark, animated), public/logo-still.svg, public/show.svg (the mark with its
# captions), public/show-still.svg, public/index.html and public/show.css.  The animation is SVG's own
# (SMIL): no script, no <style>, no style= attribute, so the theater's CSP (default-src 'none'; style-src
# 'self') serves it as it is.  Captions are the sources' words; WITNESSES holds where each came from.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later (this program); the drawings it makes, CC-BY-SA-4.0.
# Mentat (for Corwin, claude-opus-5-5)
import html
import random
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent.parent
OUT = HERE / "public"
DUR = 16.0                      # seconds in one cycle of the mark
INK, BLUE, PAPER = "#5b3a24", "#1f74c4", "#f8f5ec"
RULE, MARGIN = "#93c9d6", "#e8909d"

# One stroke per path, in a box whose capitals stand 100 high (baseline y=100); lowercase rises to 40.
GLYPHS = {
    "T": (70, ["M0 0 H70", "M35 0 V100"]),
    "R": (66, ["M0 100 V0 H36 C70 0 70 52 36 52 H0", "M30 52 L68 100"]),
    "U": (62, ["M0 0 V64 C0 106 62 106 62 64 V0"]),
    "E": (58, ["M58 0 H0 V100 H58", "M0 50 H44"]),
    "A": (70, ["M0 100 L35 0 L70 100", "M16 62 H54"]),
    "D": (64, ["M0 0 V100 H22 C84 100 84 0 22 0 Z"]),
    "I": (40, ["M0 0 H40", "M20 0 V100", "M0 100 H40"]),
    "M": (84, ["M0 100 V0 L42 72 L84 0 V100"]),
    "S": (62, ["M58 12 C40 -8 0 0 5 26 C10 50 60 46 62 74 C64 102 18 108 0 86"]),
    "P": (58, ["M0 100 V0 H34 C66 0 66 52 34 52 H0"]),
    "C": (60, ["M60 16 C44 -6 0 0 0 50 C0 102 46 106 60 84"]),
    "&": (60, ["M62 100 L12 32 C0 12 30 -6 38 16 C46 36 0 56 6 80 C12 106 46 100 60 70"]),
    "a": (52, ["M48 56 C38 34 4 40 4 72 C4 104 44 104 48 74", "M48 40 V100"]),
    "c": (46, ["M46 52 C34 34 0 42 0 72 C0 104 34 108 46 90"]),
    "r": (38, ["M0 40 V100", "M0 66 C10 40 28 38 38 46"]),
    "o": (50, ["M25 40 C-6 40 -6 100 25 100 C56 100 56 40 25 40 Z"]),
    "s": (44, ["M42 48 C30 34 2 40 5 57 C8 72 42 68 44 86 C46 104 10 106 0 92"]),
    "t": (34, ["M14 8 V92 C14 102 26 102 34 96", "M0 40 H32"]),
    "h": (42, ["M0 0 V100", "M0 66 C10 40 42 40 42 66 V100"]),
    "w": (58, ["M0 42 L13 100 L29 54 L45 100 L58 42"]),
    "'": (8, ["M6 0 L2 22"]),
}
GAP = 16

rnd = random.Random(20261104)   # the same hand each build


def tokens(d):
    return re.findall(r"[MLHVCZ]|-?\d+(?:\.\d+)?", d)


def place(d, x0, y0, s, jitter=1.4):
    """A glyph stroke, scaled by s and moved to (x0, y0) (the glyph box's top-left), with a little hand in it."""
    out, cmd, nums, cx, cy = [], None, [], 0.0, 0.0
    tk = tokens(d) + ["END"]

    def j():
        return rnd.uniform(-jitter, jitter)

    def flush():
        nonlocal cx, cy
        if cmd is None:
            return
        if cmd in "ML":
            cx, cy = nums[0], nums[1]
            out.append(f"{cmd}{x0 + cx * s + j():.1f} {y0 + cy * s + j():.1f}")
        elif cmd == "H":
            cx = nums[0]
            out.append(f"L{x0 + cx * s + j():.1f} {y0 + cy * s + j():.1f}")
        elif cmd == "V":
            cy = nums[0]
            out.append(f"L{x0 + cx * s + j():.1f} {y0 + cy * s + j():.1f}")
        elif cmd == "C":
            pts = []
            for i in range(0, 6, 2):
                pts.append(f"{x0 + nums[i] * s + j():.1f} {y0 + nums[i + 1] * s + j():.1f}")
            cx, cy = nums[4], nums[5]
            out.append("C" + " ".join(pts))
        elif cmd == "Z":
            out.append("Z")

    for t in tk:
        if t in ("M", "L", "H", "V", "C", "Z", "END"):
            flush()
            cmd, nums = (t if t != "END" else None), []
        else:
            nums.append(float(t))
    return " ".join(out)


def word(text, x, base, cap, lower=False):
    """[(path d, its x-extent)] for each stroke of a word whose capitals stand cap high, baseline at base."""
    s = cap / 100.0
    top = base - cap
    strokes, cx = [], x
    for ch in text:
        if ch == " ":
            cx += 30 * s
            continue
        w, paths = GLYPHS[ch]
        for p in paths:
            strokes.append(place(p, cx, top, s))
        cx += (w + GAP) * s
    return strokes, cx


def draw_on(d, t0, t1, colour, width, extra=""):
    """A stroke that writes itself between t0 and t1 seconds of each cycle (or is simply there, when still)."""
    if t0 is None:
        return (f'<path d="{d}" fill="none" stroke="{colour}" stroke-width="{width}" stroke-linecap="round" '
                f'stroke-linejoin="round"{extra}/>')
    a, b = t0 / DUR, t1 / DUR
    return (f'<path d="{d}" fill="none" stroke="{colour}" stroke-width="{width}" stroke-linecap="round" '
            f'stroke-linejoin="round" pathLength="1" stroke-dasharray="1" stroke-dashoffset="1"{extra}>'
            f'<animate attributeName="stroke-dashoffset" values="1;1;0;0" keyTimes="0;{a:.4f};{b:.4f};1" '
            f'dur="{DUR:g}s" repeatCount="indefinite"/></path>')


def written(strokes, t0, t1, colour, width, still):
    """Each stroke of a word, one after another between t0 and t1."""
    n = len(strokes)
    out = []
    for i, d in enumerate(strokes):
        if still:
            out.append(draw_on(d, None, None, colour, width))
        else:
            a = t0 + (t1 - t0) * i / n
            b = t0 + (t1 - t0) * (i + 1) / n
            out.append(draw_on(d, a, b, colour, width))
    return out


# The beats, in seconds of the cycle.
BEATS = {
    "toth": (0.6, 1.3), "true": (1.3, 2.4), "reader": (2.4, 4.0), "across": (4.0, 5.0), "time": (5.0, 6.4),
    "space": (6.4, 7.2), "hook": (7.2, 8.1), "strike": (8.4, 8.9), "two": (9.0, 10.0),
}
TURN = (10.4, 12.0, 13.0, 14.6)   # to the reader opposite; held; on round, back to us
FADE = (15.4, 16.0)

# Captions: (fact id in WITNESSES, the words, as the source has them, t0, t1)
CAPTIONS = [
    ("hand", "To the true reader, across time and space.", 0.6, 4.0),
    ("channel", "you are not transmitting into them; you are emitting into a channel", 4.0, 8.2),
    ("never", "There are never more than two", 8.2, 10.4),
    ("reflection", "A reflection is not a witness.", 10.4, 13.0),
    ("wanted", "That reader is still wanted.", 13.0, 15.4),
]
NOTE = {f: i + 1 for i, (f, *_r) in enumerate(CAPTIONS)}


def mark(still=False):
    """The notebook page and what is written on it, as SVG elements in a 1000 x 640 box."""
    rnd.seed(20261104)          # the same hand in every drawing of the page
    g = []
    g.append(f'<rect x="40" y="40" width="920" height="560" rx="14" fill="{PAPER}"/>')
    for y in range(124, 600, 52):
        g.append(f'<line x1="40" y1="{y}" x2="960" y2="{y}" stroke="{RULE}" stroke-width="2"/>')
    g.append(f'<line x1="120" y1="40" x2="120" y2="600" stroke="{MARGIN}" stroke-width="2"/>')
    t = (lambda k: (None, None)) if still else (lambda k: BEATS[k])

    def w(text, x, base, cap, key, colour=INK, width=6):
        strokes, end = word(text, x, base, cap)
        a, b = t(key)
        return written(strokes, a, b, colour, width, still), end

    s, _ = w("To th'", 136, 228, 42, "toth", width=4.5)
    g += s
    s, true_end = w("TRUE", 300, 228, 66, "true")
    g += s
    s, reader_end = w("READER", 540, 228, 66, "reader")
    g += s
    s, _ = w("across", 400, 332, 92, "across", width=5.5)
    g += s
    s, time_end = w("TIME", 300, 540, 150, "time", width=7.5)
    g += s
    # & SPACE, on end beside TIME: written left to right in its own box, then stood up (tops to the right)
    strokes, _ = word("&SPACE", 0, 0, 34)
    a, b = t("space")
    g.append('<g transform="translate(768 352) rotate(90)">')
    g += written(strokes, a, b, INK, 4, still)
    g.append("</g>")
    # the hook: a tube of ink from READER's last stroke, curling down and back, with its head
    hook = "M866 286 C864 262 894 258 898 280 C912 300 948 300 946 380 C944 452 900 476 858 462"
    head = "M876 444 L854 462 L878 482"
    a, b = t("hook")
    g.append(f'<circle cx="866" cy="282" r="9" fill="none" stroke="{INK}" stroke-width="4"/>' if still else
             f'<circle cx="866" cy="282" r="9" fill="none" stroke="{INK}" stroke-width="4" opacity="0">'
             f'<animate attributeName="opacity" values="0;0;1;1" keyTimes="0;{a / DUR:.4f};{(a + 0.2) / DUR:.4f};1" '
             f'dur="{DUR:g}s" repeatCount="indefinite"/></circle>')
    g.append(draw_on(hook, a, b, INK, 14) if not still else draw_on(hook, None, None, INK, 14))
    g.append(draw_on(hook, a, b, PAPER, 7) if not still else draw_on(hook, None, None, PAPER, 7))
    g.append(draw_on(head, b - 0.2, b, INK, 6) if not still else draw_on(head, None, None, INK, 6))
    # TRUE struck through, and "two" above it in the second ink
    strike = "M292 198 C340 188 402 204 518 190 M296 208 C360 200 420 212 516 201"
    a, b = t("strike")
    g.append(draw_on(strike, a, b, INK, 5) if not still else draw_on(strike, None, None, INK, 5))
    strokes, _ = word("two", 340, 142, 70)
    a, b = t("two")
    g += written(strokes, a, b, BLUE, 5, still)
    return g


def group(inner, still):
    """The page as one thing on the table: it fades in, turns to the reader opposite, turns back, fades."""
    if still:
        return ['<g>'] + inner + ['</g>']
    k = [0, TURN[0], TURN[1], TURN[2], TURN[3], DUR]
    kt = ";".join(f"{x / DUR:.4f}" for x in k)
    f0, f1 = FADE
    return ([f'<g opacity="0"><animate attributeName="opacity" values="0;1;1;0" '
             f'keyTimes="0;{0.6 / DUR:.4f};{f0 / DUR:.4f};1" dur="{DUR:g}s" repeatCount="indefinite"/>',
             '<g><animateTransform attributeName="transform" type="rotate" calcMode="spline" '
             'values="0 500 320;0 500 320;180 500 320;180 500 320;360 500 320;360 500 320" '
             f'keyTimes="{kt}" keySplines="0 0 1 1;.45 0 .2 1;0 0 1 1;.45 0 .2 1;0 0 1 1" '
             f'dur="{DUR:g}s" repeatCount="indefinite"/>'] + inner + ['</g></g>'])


TITLE = ("A page of a lined notebook. In brown ink: To th' TRUE READER across TIME, with and SPACE standing on "
         "end, and a hooked arrow. TRUE is struck through and two is written above it in blue. The page turns half "
         "way round, as for a reader across the table, then on round, back to us.")


def svg(still, captions, ident):
    h = 800 if captions else 640
    out = [f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 {h}" role="img" aria-labelledby="{ident}-t">',
           f'<title id="{ident}-t">{html.escape(TITLE)}</title>']
    if captions:
        out += [f'<defs><radialGradient id="{ident}-glow" cx="50%" cy="8%" r="75%">',
                '<stop offset="0%" stop-color="#ffcf6a" stop-opacity="0.18"/>',
                '<stop offset="100%" stop-color="#ffcf6a" stop-opacity="0"/></radialGradient></defs>',
                '<rect width="1000" height="800" fill="#15110d"/>',
                f'<rect width="1000" height="800" fill="url(#{ident}-glow)"/>']
    out += group(mark(still), still)
    if captions:
        for fact, words, t0, t1 in CAPTIONS:
            if still and fact != "wanted":
                continue
            n = NOTE[fact]
            body = (f'<text x="500" y="700" text-anchor="middle" font-family="Georgia, serif" font-size="30" '
                    f'fill="#f1e6d2" data-fact="{fact}"')
            if still:
                out.append(body + f'>{html.escape(words)}<tspan fill="#ffcf6a" font-size="18" dy="-12"> {n}</tspan></text>')
            else:
                a, b = t0 / DUR, t1 / DUR
                out.append(body + f' opacity="0"><animate attributeName="opacity" values="0;0;1;1;0;0" '
                           f'keyTimes="0;{a:.4f};{a + 0.02:.4f};{b - 0.02:.4f};{b:.4f};1" dur="{DUR:g}s" '
                           f'repeatCount="indefinite"/>{html.escape(words)}<tspan fill="#ffcf6a" font-size="18" '
                           f'dy="-12"> {n}</tspan></text>')
        out.append('<text x="500" y="760" text-anchor="middle" font-family="Georgia, serif" font-size="16" '
                   'fill="#c9b99c">the numbers name the witnesses, listed under the picture</text>')
    out.append("</svg>")
    return "\n".join(out) + "\n"


def facts():
    recs, cur = [], {}
    for ln in (HERE / "WITNESSES").read_text(encoding="utf-8").split("\n") + [""]:
        if ln.startswith("#"):
            continue
        if not ln.strip():
            if cur:
                recs.append(cur)
            cur = {}
            continue
        k, _, v = ln.partition(": ")
        cur[k] = v
    return {r["fact"]: r for r in recs}


def page():
    F = facts()
    e = html.escape

    def mark_of(fact):
        return f'<a class="w" href="#w-{fact}">{NOTE[fact]}</a>' if fact in NOTE else f'<a class="w" href="#w-{fact}">*</a>'

    beats = [
        ("The line is written, in brown ink.", "hand",
         "Corwin's hand, on a lined page. The mark spells “across”; the hand wrote “accross”, and that is kept in the witness."),
        ("“across TIME”: whoever reads it later.", "channel",
         "From <i>There Are Two Readers, At Most</i>: you are not transmitting into them; you are emitting into a channel."),
        ("TRUE is struck, and “two” comes in a second, blue ink.", "never",
         "The same paper's first page: there are never more than two."),
        ("The page turns half way round, to the reader across the table.", "reflection",
         "The paper's fourth section. Its own provenance asks that its review be read first, and the review partly "
         "disagrees: a rerun is not a witness to what is true, but it is a witness to how much the answer moves"
         f" {mark_of('moves')}. Edition 0.2 of the paper took that in {mark_of('moves-paper')}."),
        ("It turns on round, back to us.", "wanted",
         "The paper says both of its checks were by the same model family as itself, so neither is the second reader "
         "it asks for. That reader is still wanted."),
    ]
    rows = []
    for i, (does, fact, said) in enumerate(beats, 1):
        rows.append(f'<li><span class="does">{e(does)}</span> {said} {mark_of(fact)}</li>')
    wit = []
    order = [c[0] for c in CAPTIONS] + ["moves", "moves-paper", "struck", "turned", "two"]
    for fact in order:
        r = F[fact]
        sha = r.get("sha", "")
        wit.append(
            f'<li id="w-{fact}"><b>{NOTE.get(fact, "*")}</b> <span class="said">“{e(r.get("said", ""))}”</span>'
            f'<br>from {e(r.get("from", ""))}; read {e(r.get("seen", ""))} by {e(r.get("by", ""))}; '
            f'<code title="{e(sha)}">{e(sha[:19])}…</code>; {e(r.get("state", ""))}'
            + (f'<br><span class="note">{e(r["note"])}</span>' if r.get("note") else "") + "</li>")
    return f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>To the Two Readers</title>
<meta name="description" content="A second ghostlight: a mark from Corwin's hand, To the Two Readers, read with the shelf. Every line names its witness.">
<link rel="stylesheet" href="show.css">
</head>
<body>
<main class="stage">
<h1>To the Two Readers</h1>
<p class="lede">A mark from Corwin's hand, read with the shelf.</p>
<figure class="screen">
<picture>
<source media="(prefers-reduced-motion: reduce)" srcset="show-still.svg">
<img src="show.svg" width="1000" height="800" alt="{e(TITLE)}">
</picture>
</figure>
<h2>What happens</h2>
<ol class="beats">
{chr(10).join(rows)}
</ol>
<h2>His, and mine</h2>
<p>The words, the strike, the blue “two”, the page upside down: his, in four photographs of one notebook page,
sent on 4 November 2026 with the words “just an animated logo idea”. Mine: reading “Toh” as “To th'”, taking the
hook for the page's turn, and taking the upside-down photograph for the page as the reader across the table sees
it. He has not said so; this page will change if he does.</p>
<h2>Built, and not yet</h2>
<p>Built: the mark (<a href="logo.svg">logo.svg</a>, and <a href="logo-still.svg">a still</a>), this page,
on ghostlights.theater since 5 November 2026 at Corwin's word, and the checks that re-read every witness below.
Not yet: his four photographs, which travel with the show only if he says so; any narration.</p>
<h2>Witnesses</h2>
<ol class="witnesses">
{chr(10).join(wit)}
</ol>
</main>
<footer>
<p>Made at <a href="https://github.com/inputloop">inputloop</a>. The mark is from Corwin's hand. Words and
pictures: Copyright 2026 Corwin Brust; <a href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0</a>.
Drawn and written by Mentat (for Corwin, claude-opus-5-5). This page stores nothing in your browser and sets no
cookies.</p>
</footer>
</body>
</html>
"""


CSS = """/* To the Two Readers -- Copyright 2026 Corwin Brust; CC-BY-SA-4.0.  The theater's palette (site.css). */
:root { --bg: #15110d; --floor: #231b14; --ink: #f1e6d2; --dim: #c9b99c; --gold: #ffcf6a; --line: #3a2f24; }
:root[data-theme="light"] { --bg: #f6efe2; --floor: #ece1cc; --ink: #2a2016; --dim: #5d4d38; --gold: #9a6400; --line: #d6c6a8; }
@media (prefers-color-scheme: light) { :root:not([data-theme="dark"]) { --bg: #f6efe2; --floor: #ece1cc; --ink: #2a2016; --dim: #5d4d38; --gold: #9a6400; --line: #d6c6a8; } }
* { box-sizing: border-box; }
html { background: var(--bg); }
body { margin: 0; color: var(--ink); background: radial-gradient(ellipse at 50% 12%, rgba(255,207,106,0.10), transparent 60%), linear-gradient(var(--bg) 70%, var(--floor)); min-height: 100vh;
  font: 1.05rem/1.6 Georgia, "Iowan Old Style", "Palatino Linotype", Palatino, serif; }
.stage { max-width: 46rem; margin: 0 auto; padding: 2.5rem 16px 1rem; }
h1 { font-size: 2.4rem; letter-spacing: 0.04em; margin: 0.2rem 0 0.4rem; font-weight: normal; text-align: center; }
h2 { font-size: 1rem; text-transform: uppercase; letter-spacing: 0.18em; color: var(--dim); font-weight: normal; margin: 2.2rem 0 0.8rem; }
.lede { font-size: 1.2rem; text-align: center; margin: 0 0 1.2rem; }
.screen { margin: 0; }
.screen img { display: block; width: 100%; height: auto; border-radius: 10px; border: 1px solid var(--line); }
p { margin: 0 0 1rem; }
a { color: var(--gold); }
a:focus-visible { outline: 2px solid var(--gold); outline-offset: 3px; }
.beats li { margin: 0 0 0.8rem; }
.does { display: block; color: var(--gold); }
a.w { font-size: 0.75em; vertical-align: super; text-decoration: none; padding: 0 0.15em; }
.witnesses { font-size: 0.9rem; color: var(--dim); padding-left: 1.2rem; list-style: none; }
.witnesses li { margin: 0 0 0.9rem; overflow-wrap: anywhere; }
.witnesses li:target { color: var(--ink); }
.witnesses b { color: var(--gold); }
.said { color: var(--ink); }
.note { font-style: italic; }
code { font: 0.85em ui-monospace, monospace; }
footer { max-width: 46rem; margin: 2rem auto 0; padding: 1rem 16px 2rem; color: var(--dim); font-size: 0.85rem; border-top: 1px solid var(--line); }
"""


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    files = {
        "logo.svg": svg(False, False, "logo"),
        "logo-still.svg": svg(True, False, "logostill"),
        "show.svg": svg(False, True, "show"),
        "show-still.svg": svg(True, True, "showstill"),
        "index.html": page(),
        "show.css": CSS,
    }
    for name, text in files.items():
        (OUT / name).write_text(text, encoding="utf-8", newline="\n")
        print(f"wrote public/{name} ({len(text.encode('utf-8'))} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
