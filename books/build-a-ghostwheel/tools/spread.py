# spread.py -- read the hand-written sources of the ghostwheel pilot.
# Copyright 2026 Corwin Brust; GPL-3.0-or-later
#
# One source file per spread, plain text. The shape:
#
#   # comment lines start with '#' (outside the picture)
#   kind: spread            (spread, intermezzo or card)
#   title: Door
#   part: Part One: how we say things      (optional)
#
#   == picture page ==      at most about 40 easy words
#   == fuller page ==       at most about 250 words; [id] after a claim marks a fact
#   == diagram ==           key: value lines, then rows of data
#   == facts ==             witness rows: blocks of key: value, a blank line between
#   == narration ==         [picture] / [fuller] / [card] headings, then "who: words"
#                           or "who [fact]: words"; {shown|said} gives a word its sound.
#                           A heading may name a take: [picture A] holds lines for take A
#                           only; lines under a heading with no take belong to every take.
#   == picture ==           an SVG drawing; <g data-figure="spoke" ...></g> pulls a figure
#   == layout ==            how the picture page sits (tools/book.py): picture, words, at,
#                           side, outline, align, ground; one "key: value" a line, at: repeats
#
# The book file (src/book) gives the title and the order of the spreads.
# The cast file (src/cast) says which voice speaks for whom.

import os
import re

SRC = os.environ.get("GW_SRC", "src")
BUILD = os.environ.get("GW_BUILD", "build")
OUT = os.environ.get("GW_OUT", ".")
TAKE = os.environ.get("GW_TAKE", "")
CACHE = os.environ.get("GW_CACHE", os.path.join(os.path.expanduser("~"), ".cache", "ghostwheel-pilot"))

HEADER = re.compile(r"^==\s*(.+?)\s*==\s*$")
FIELD = re.compile(r"^([A-Za-z][\w -]*?):\s?(.*)$")
NARR = re.compile(r"^([a-z][\w-]*)\s*(?:\[([\w-]+)\])?\s*:\s*(.+)$")
SAY = re.compile(r"\{([^{}|]*)\|([^{}]*)\}")
MARK = re.compile(r"\s?\[([a-z][\w-]*)\]")


class SourceError(Exception):
    pass


def shown(text):
    """The words as they are written on the page and in captions."""
    return SAY.sub(lambda m: m.group(1), text)


def said(text):
    """The words as they are handed to the voice."""
    return SAY.sub(lambda m: m.group(2), text)


def read_kv_blocks(lines):
    """Blocks of 'key: value' lines, split by blank lines."""
    blocks, cur = [], {}
    for ln in lines + [""]:
        if not ln.strip():
            if cur:
                blocks.append(cur)
                cur = {}
            continue
        m = FIELD.match(ln)
        if m:
            cur[m.group(1).strip().lower()] = m.group(2).strip()
        elif cur:
            # a continuation line belongs to the last key
            k = list(cur)[-1]
            cur[k] = (cur[k] + " " + ln.strip()).strip()
    return blocks


def paragraphs(lines):
    out, cur = [], []
    for ln in lines:
        if ln.strip():
            cur.append(ln.strip())
        elif cur:
            out.append(" ".join(cur))
            cur = []
    if cur:
        out.append(" ".join(cur))
    return out


def read_spread(path):
    name = os.path.basename(path)
    with open(path, encoding="utf-8") as fh:
        raw = fh.read().splitlines()
    head, sections, order, cur = [], {}, [], None
    for ln in raw:
        m = HEADER.match(ln)
        if m:
            cur = m.group(1).lower()
            if cur in sections:
                raise SourceError(f"{name}: section '{cur}' appears twice")
            sections[cur] = []
            order.append(cur)
            continue
        if cur != "picture" and ln.lstrip().startswith("#"):
            continue
        (head if cur is None else sections[cur]).append(ln)
    meta = {}
    for ln in head:
        m = FIELD.match(ln)
        if m:
            meta[m.group(1).strip().lower()] = m.group(2).strip()
    sp = {
        "name": name,
        "path": path,
        "kind": meta.get("kind", "spread"),
        "title": meta.get("title", name),
        "meta": meta,
        "picture_page": paragraphs(sections.get("picture page", [])),
        "fuller_page": paragraphs(sections.get("fuller page", [])),
        "facts": [],
        "diagram": None,
        "narration": [],
        "svg": "\n".join(sections.get("picture", [])).strip(),
        "layout": [],
    }
    for ln in sections.get("layout", []):
        m = FIELD.match(ln.strip())
        if m:
            sp["layout"].append((m.group(1).strip().lower(), m.group(2).strip()))
        elif ln.strip():
            raise SourceError(f"{name}: layout line not understood: {ln.strip()!r}")
    for b in read_kv_blocks(sections.get("facts", [])):
        if "fact" not in b:
            raise SourceError(f"{name}: a witness row has no 'fact:' line: {b}")
        if not b.get("from"):
            raise SourceError(f"{name}: witness row for '{b['fact']}' has no 'from:' (a fact needs its source)")
        sp["facts"].append(b)
    if "diagram" in sections:
        dl = sections["diagram"]
        d = {"rows": []}
        for ln in dl:
            if not ln.strip():
                continue
            m = FIELD.match(ln)
            if m and not d["rows"] and m.group(1).lower() in ("kind", "caption", "hosts", "reserve", "many", "focus", "rows-from", "label", "dim", "show", "left", "right"):
                d[m.group(1).lower()] = m.group(2).strip()
            else:
                d["rows"].append(ln.split())
        sp["diagram"] = d
    page, take = None, ""
    for ln in sections.get("narration", []):
        s = ln.strip()
        if not s:
            continue
        if s.startswith("[") and s.endswith("]"):
            bits = s[1:-1].split()
            page = bits[0].lower()
            take = bits[1] if len(bits) > 1 else ""
            continue
        m = NARR.match(s)
        if not m:
            raise SourceError(f"{name}: narration line not understood: {s!r}")
        sp["narration"].append({
            "page": page or ("card" if sp["kind"] == "card" else "picture"),
            "who": m.group(1),
            "fact": m.group(2),
            "text": m.group(3).strip(),
            "take": take,
        })
    # every fact mark on the fuller page needs at least one witness row
    have = {f["fact"] for f in sp["facts"]}
    for p in sp["fuller_page"]:
        for fid in MARK.findall(p):
            if fid not in have:
                raise SourceError(f"{name}: fact mark [{fid}] has no witness row")
    for n in sp["narration"]:
        if n["fact"] and n["fact"] not in have:
            raise SourceError(f"{name}: narration names fact [{n['fact']}] with no witness row")
    return sp


def read_book(src=SRC):
    meta, order = {}, []
    with open(os.path.join(src, "book"), encoding="utf-8") as fh:
        for ln in fh:
            s = ln.strip()
            if not s or s.startswith("#"):
                continue
            m = FIELD.match(s)
            if m and m.group(1).lower() == "take":
                t, _, desc = m.group(2).strip().partition(" ")
                meta.setdefault("takes", {})[t] = desc.strip()
            elif m and m.group(1).lower() != "spread":
                meta[m.group(1).strip().lower()] = m.group(2).strip()
            elif m:
                order.append(m.group(2).strip())
    spreads = [read_spread(os.path.join(src, n)) for n in order]
    return meta, spreads


def parse_voice(spec, who):
    parts = spec.split()
    c = {"voice": parts[0], "speaker": None, "speed": 1.0, "fx": "", "label": who.title()}
    i = 1
    while i < len(parts):
        k = parts[i]
        v = parts[i + 1] if i + 1 < len(parts) else ""
        if k == "speaker":
            c["speaker"] = v
        elif k == "speed":
            c["speed"] = float(v)
        elif k == "fx":
            c["fx"] = v
        elif k == "label":
            c["label"] = v.replace("_", " ")
        i += 2
    return c


def read_cast(src=SRC, take=None):
    """who[@TAKE]: voice [speaker ID] [speed X] [fx FILTER] [label NAME] [| next voice ...]

    Several voices joined by '|' make a company: the role's lines pass from
    one to the next in turn. 'who@A' is used for take A in place of 'who'."""
    take = TAKE if take is None else take
    plain, taken = {}, {}
    with open(os.path.join(src, "cast"), encoding="utf-8") as fh:
        for ln in fh:
            s = ln.split("#", 1)[0].strip()
            if not s:
                continue
            who, rest = s.split(":", 1)
            who = who.strip()
            role, _, t = who.partition("@")
            company = [parse_voice(v, role) for v in rest.split("|") if v.strip()]
            (taken.setdefault(t, {}) if t else plain)[role] = company
    cast = dict(plain)
    cast.update(taken.get(take, {}))
    return cast


def voices_in_cast(src=SRC):
    """Every voice any take uses (for fetching)."""
    out = set()
    with open(os.path.join(src, "cast"), encoding="utf-8") as fh:
        for ln in fh:
            s = ln.split("#", 1)[0].strip()
            if s and ":" in s:
                for v in s.split(":", 1)[1].split("|"):
                    if v.strip():
                        out.add(v.split()[0])
    return sorted(out)


def lines_for(sp, take=None):
    take = TAKE if take is None else take
    return [n for n in sp["narration"] if not n["take"] or n["take"] == take]


def takes(spreads):
    return sorted({n["take"] for sp in spreads for n in sp["narration"] if n["take"]})


def shots(spreads, take=None):
    """The video's shots, in order: one per page that has narration in this take."""
    out = []
    for sp in spreads:
        mine = lines_for(sp, take)
        pages = []
        for n in mine:
            if n["page"] not in pages:
                pages.append(n["page"])
        for pg in pages:
            out.append({
                "id": f"{sp['name']}/{pg}",
                "spread": sp["name"],
                "page": pg,
                "lines": [n for n in mine if n["page"] == pg],
            })
    return out


def suffix(take=None):
    """pilot-A.mp4 for take A; pilot.mp4 when there is no take."""
    take = TAKE if take is None else take
    return f"-{take}" if take else ""
