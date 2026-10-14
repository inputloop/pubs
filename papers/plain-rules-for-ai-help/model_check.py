#!/usr/bin/env python3
# model_check.py --- check the form of a "Plain Rules for AI Help" model file (SPEC-model-check.md v3).
#
# Copyright (C) 2026 Corwin Brust
# SPDX-License-Identifier: GPL-3.0-or-later
#
# The second implementation of SPEC-model-check.md. Version 2 by a second reader (Claude, claude-opus-5-5, run
# G1CC2); version 3 by the consolidation run of the same model, 2026-09-30, for the consolidated form. Written to
# the SPEC text, in a language other than model-check.sh (POSIX sh + awk). Python 3 standard library only.
# Reviewed by: no person yet.
#
# usage:
#   model_check.py [--pins FILE] [check] MODEL.md
#   model_check.py --prove-red      the author's own plants (they do not prove the check; Rule 5)
#   model_check.py --help
# exit: 0 OK · 1 RED · 77 NOT CHECKED. It never answers OK over nothing.

import hashlib
import os
import re
import shutil
import sys
import tempfile

OK, RED, NC = 0, 1, 77

PINS_BUILTIN = {
    "score": "49969c6936c84d54faa42706dc5557df956f6bc15dacb739dedff4e80a05210d",
    "score3": "95dd05bda313de98060d6d382219a8df39e55c83649fe483da24d6640ca938fe",
    "paper": "034f8694b13f1fe4dfde62d82b52833bf5d9ca8d7394c7bf72b5556f9ccf8028",
    "row1-conclusive": "0ddc250fd2f386e71d2647c284d9da0ce900c29141365c7a3969f5292e2116fb",
    "row1-contested": "789d435f02f473414c876ee0bdbe600fb099b360e6c60a1daf8d01cf9ca6b965",
    "new-ideas": "c02902dd2ae16c8464072d68b0a603b4199f197ee123da3a4d38542677a14794",
    "org-rule": "8f42a69a689ba1c4138471815ebcb995820698bec2d025e90f09464fef18b7b5",
    "base": "3c8db5aa2e9ead287632b0bf3ef5bad67d90d984088fe8492cda238330095235",
}

PLACEHOLDERS = {"", "n/a", "na", "none", "nothing", "never", "tbd", "tba", "todo", "unknown",
                "to be written", "to be decided"}
NUMBER_WORDS = {"one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8,
                "nine": 9, "ten": 10, "eleven": 11, "twelve": 12}
EDGE_PUNCT = " .,;:()!?*_`\"-"
LISTS = ("HEAD", "RULES", "HELD", "HANDS", "MEETINGS")
DOT = "\u00b7"
# Z1: invisible or direction-changing characters (a NOTE, never RED)
INVISIBLE = re.compile("[\u00ad\u200b-\u200f\u2028-\u202e\u2060-\u2064\u2066-\u2069\ufeff]")
ID_IN_CORE = re.compile(r"R[23]S-[0-9]|paper:[A-Za-z]|row1:[A-Za-z]|BASE L[0-9]")
FIELD = re.compile(r"^- \*\*([A-Za-z ]+):\*\*(.*)$")


class Findings:
    def __init__(self):
        self.lines = []
        self.n_red = 0
        self.n_nc = 0

    def red(self, code, msg, show=True):
        if show:
            self.lines.append("RED          %s  %s" % (code, msg))
        self.n_red += 1

    def nc(self, code, msg):
        self.lines.append("NOT CHECKED  %s  %s" % (code, msg))
        self.n_nc += 1

    def note(self, code, msg):
        self.lines.append("NOTE         %s  %s" % (code, msg))


def read_lines(path):
    """Lines of a file, one trailing CR removed from each (F1)."""
    with open(path, "rb") as fh:
        text = fh.read().decode("utf-8", errors="surrogateescape")
    parts = text.split("\n")
    if parts and parts[-1] == "":
        parts.pop()
    return [p[:-1] if p.endswith("\r") else p for p in parts]


def sha256_of(path):
    h = hashlib.sha256()
    with open(path, "rb") as fh:
        for chunk in iter(lambda: fh.read(65536), b""):
            h.update(chunk)
    return h.hexdigest()


def norm(s):
    """Runs of space, tab, CR and LF become one space; ends trimmed (the SPEC's whitespace-normalisation)."""
    return re.sub(r"[ \t\r\n]+", " ", s).strip(" \t")


def is_placeholder(s):
    t = re.sub(r"[ \t]+", " ", s.lower()).strip(EDGE_PUNCT)
    return t in PLACEHOLDERS


def label_position(text, label):
    start = 0
    while True:
        i = text.find(label, start)
        if i < 0:
            return -1
        if i == 0 or not (text[i - 1].isascii() and text[i - 1].isalpha()):
            return i
        start = i + 1


REF_HEAD = re.compile(r"Rules? [0-9]+")
REF_MORE = re.compile(r"(?:,| to| and) ([0-9]+)")


def rule_refs(text):
    s = norm(text)
    out, pos = [], 0
    while True:
        m = REF_HEAD.search(s, pos)
        if not m:
            return out
        tok = m.group(0)
        out.append(int(tok.split()[1]))
        pos = m.end()
        if tok.startswith("Rules "):
            while True:
                more = REF_MORE.match(s, pos)
                if not more:
                    break
                out.append(int(more.group(1)))
                pos = more.end()


def parse_ranges(text):
    return [(int(m.group(1)), int(m.group(2)) if m.group(2) else int(m.group(1)))
            for m in re.finditer(r"L([0-9]+)(?:-([0-9]+))?", text)]


def logical_lines(lines):
    out, buf, at = [], None, 0
    starter = re.compile(r"^(#|- |\||[0-9]+\. |---)")
    for n, line in enumerate(lines, 1):
        if re.match(r"^[ \t]*$", line):
            if buf is not None:
                out.append((at, buf))
            buf = None
            continue
        if starter.match(line):
            if buf is not None:
                out.append((at, buf))
            buf, at = line, n
            continue
        if buf is None:
            buf, at = line, n
        else:
            buf = buf + " " + line
    if buf is not None:
        out.append((at, buf))
    return out


def cells(text):
    return [c.strip(" \t") for c in text.split("|")]


class Sources:
    def __init__(self, rows, pins, fx):
        self.path, self.ok = {}, {}
        for name, path, want in rows:
            readable = os.path.isfile(path) and os.access(path, os.R_OK)
            self.path[name], self.ok[name] = path, readable
            if not readable:
                fx.nc("S1", "source %s cannot be read: %s" % (name, path))
            else:
                got = sha256_of(path)
                if got.lower() != want.lower():
                    fx.red("S2", "source %s changed since it was cited (table %s, file %s)" % (name, want[:12], got[:12]))
            pin = pins.get(name)
            if pin and pin.lower() != want.lower():
                fx.red("S3", "source %s: the table names a copy (%s) other than the pinned one (%s)" % (name, want[:12], pin[:12]))

    def readable(self, name):
        return self.ok.get(name, False)

    def lines(self, name):
        return read_lines(self.path[name])


def sources_table(lines, model_dir):
    rows, inside = [], False
    for line in lines:
        if line.startswith("## "):
            inside = line.startswith("## Sources")
            continue
        if line.startswith("---"):
            inside = False
        if inside and line.startswith("|"):
            c = line.split("|")
            if len(c) < 5:
                continue
            name, path, sha = (x.strip(" \t") for x in c[1:4])
            if name == "name" or re.fullmatch(r"-+", name):
                continue
            if not path.startswith("/"):
                path = os.path.join(model_dir, path)
            rows.append((name, path, sha))
    return rows


class Study:
    """What the study's files hold: ids, the org rule's lines, the base's paragraph starts."""

    def __init__(self, src):
        self.r2s, self.r3s, self.paper, self.f_not_yet = set(), set(), set(), set()
        self.conc, self.contested, self.ideas, self.org, self.base = {}, set(), set(), [], []
        self.starts, self.hard = [], set()
        if src.readable("score"):
            self.r2s = {m.group(1) for ln in src.lines("score") for m in [re.match(r"^### (R2S-[0-9]{3})", ln)] if m}
        if src.readable("score3"):
            self.r3s = {m.group(1) for ln in src.lines("score3") for m in [re.match(r"^### (R3S-[0-9]{3})", ln)] if m}
        if src.readable("paper"):
            for ln in src.lines("paper"):
                m = re.match(r"^\| (F[0-9]+) \|", ln)
                if m:
                    self.paper.add(m.group(1))
                    status = [c for c in cells(ln) if c != ""]
                    if status and status[-1].startswith("NOT YET"):
                        self.f_not_yet.add(m.group(1))
                    continue
                m = re.match(r"^\*\*([SWOT][0-9]+) ", ln)
                if m:
                    self.paper.add(m.group(1))
                    continue
                m = re.match(r"^## ([0-9]+[a-z]?)\.", ln)
                if m:
                    self.paper.add("sec" + m.group(1))
        for name, target in (("row1-conclusive", self.conc), ("row1-contested", self.contested), ("new-ideas", self.ideas)):
            if src.readable(name):
                for ln in src.lines(name):
                    c = ln.split("\t")
                    if c[0] in ("id", ""):
                        continue
                    if isinstance(target, dict):
                        target[c[0]] = c[2] if len(c) > 2 else ""
                    else:
                        target.add(c[0])
        if src.readable("org-rule"):
            self.org = src.lines("org-rule")
        if src.readable("base"):
            self.base = src.lines("base")
            after_blank = True
            for n, ln in enumerate(self.base, 1):
                if re.match(r"^[ \t]*$", ln):
                    after_blank = True
                    continue
                if ln.startswith("#") or ln.startswith("---"):
                    self.hard.add(n)
                if ln[:1] in ("#", ">", "|") or ln.startswith("---"):
                    after_blank = False
                    continue
                if after_blank or n == 1 or ln.startswith("- "):
                    self.starts.append(n)
                after_blank = False


def check(model, pins):
    """Returns (exit code, output lines)."""
    if not (os.path.isfile(model) and os.access(model, os.R_OK)):
        return NC, ["NOT CHECKED  F0  cannot read %s" % model]
    if os.path.getsize(model) == 0:
        return NC, ["NOT CHECKED  F0  %s is empty" % model]
    fx = Findings()
    lines = read_lines(model)
    mdir = os.path.dirname(model) or "."
    src = Sources(sources_table(lines, mdir), pins, fx)
    st = Study(src)

    # --- physical lines: SPDX, foot, Z1, the five lists (K1)
    if not any("SPDX-License-Identifier: CC-BY-4.0" in ln for ln in lines[:3]):
        fx.red("H3", "no SPDX-License-Identifier: CC-BY-4.0 line in the first 3 lines")
    dashes = [i for i, ln in enumerate(lines) if ln == "---"]
    foot = "\n".join(lines[dashes[-1] + 1:]) if dashes else ""
    if "\u00a9" not in foot or "CC BY 4.0" not in foot:
        fx.red("H4", "the foot (after the last ---) carries no copyright and CC BY 4.0 credit line")
    n_invisible, in_core_phys = 0, False
    list_count, list_line, list_parts = {}, {}, {}
    for n, ln in enumerate(lines, 1):
        if INVISIBLE.search(ln):
            n_invisible += 1
            if n_invisible <= 12:
                fx.note("Z1", "model L%d holds an invisible or direction-changing character (%s); a person should read it "
                        "(never RED: a right-to-left text may need one)"
                        % (n, ", ".join("U+%04X" % ord(c) for c in sorted(set(INVISIBLE.findall(ln))))))
        if ln.startswith("## "):
            in_core_phys = re.match(r"^## The model[ \t]*$", ln) is not None
        m = re.match(r"^[ \t]*(HEAD|RULES|HELD|HANDS|MEETINGS)[ \t]", ln)
        if in_core_phys and m and (" " + DOT + " ") in ln:
            name = m.group(1)
            list_count[name] = list_count.get(name, 0) + 1
            list_line[name] = n
            list_parts[name] = len(ln.lstrip(" \t").split(" " + DOT + " "))

    # --- logical lines
    head_owners, owner_placeholder, head_licence, licence_line = 0, False, None, ""
    in_head, in_core, have_core, in_why_sec = True, False, False, False
    in_limits = has_limits = in_parts = has_parts = in_choices = False
    rule, why, section3 = None, None, ""
    rules, whys, items, references = [], {}, [], []
    claimed, n_quotes, n_limits, n_c1, choice_row, part_row = None, 0, 0, 0, 0, 0
    for at, text in logical_lines(lines):
        m = re.match(r"^### Rule ([0-9]+) ", text)
        if m:
            in_head, why = False, None
            rule = {"number": int(m.group(1)), "line": at, "fields": {}, "body": False}
            rules.append(rule)
            if not in_core:
                fx.red("R7", "Rule %s (model L%d) sits outside the core (## The model)" % (m.group(1), at))
            continue
        references.extend((n, at) for n in rule_refs(text))
        if in_core and ID_IN_CORE.search(text):
            n_c1 += 1
            fx.red("C1", "model L%d: an evidence id or baseline reference inside the core; it belongs at the back" % at,
                   show=n_c1 <= 12)
        m = re.search(r"These are ([A-Za-z0-9]+) rules", text)
        if m:
            claimed = (m.group(1), at)
        if text.startswith("## "):
            in_head, rule, why, section3, in_choices = False, None, None, "", False
            in_core = re.match(r"^## The model[ \t]*$", text) is not None
            have_core = have_core or in_core
            in_why_sec = text.startswith("## Why each rule is here")
            in_limits = text.startswith("## Honest limits")
            has_limits = has_limits or in_limits
            in_parts = text.startswith("## Why each other part is here")
            if in_parts:
                has_parts, part_row = True, 0
            n_quotes += quotes(text, at, st.org, src, fx)
            continue
        if text.startswith("### Rule"):
            fx.red("R5", "the heading at model L%d begins \"### Rule\" but has no number the checker can read" % at)
        m = re.match(r"^### Why Rule ([0-9]+) ", text)
        if in_why_sec and m:
            rule, why = None, int(m.group(1))
            entry = whys.setdefault(why, {"count": 0, "line": at, "fields": {}})
            entry["count"] += 1
            continue
        if text.startswith("### "):
            rule, why, section3 = None, None, text
            in_choices = in_core and text.startswith("### Choices")
            choice_row = 0
            continue
        if in_head:
            if text.startswith("- **Owner:**"):
                head_owners += 1
                owner_placeholder = owner_placeholder or is_placeholder(text[len("- **Owner:**"):])
            if re.match(r"^- \*\*Licen[cs]e[:]\*\*", text):
                head_licence = "CC BY 4.0" in text and "GPL-3.0-or-later" in text
                licence_line = text
        fm = FIELD.match(text)
        if rule is not None:
            if fm:
                rule["fields"].setdefault(fm.group(1), (fm.group(2).strip(" \t"), at))
            elif not rule["fields"]:
                rule["body"] = True
        if why is not None and fm:
            whys[why]["fields"].setdefault(fm.group(1), (fm.group(2).strip(" \t"), at))
        if in_choices and text.startswith("|"):
            choice_row += 1
            c = cells(text)
            if choice_row > 2:
                if len(c) < 6:
                    fx.red("D1", "choices row at model L%d has fewer than four cells" % at)
                elif is_placeholder(c[2]) or is_placeholder(c[3]) or is_placeholder(c[4]):
                    fx.red("D1", "choices row at model L%d leaves its default, other choice or change-it-if empty" % at)
        if in_parts and text.startswith("|"):
            part_row += 1
            c = cells(text)
            if part_row > 2 and (len(c) < 5 or is_placeholder(c[-2])):
                fx.red("P1", "part row at model L%d says nothing under Drop it if" % at)
        if in_limits and re.match(r"^[0-9]+\. ", text):
            n_limits += 1
            t = norm(text)
            i = t.find("Shown wrong if:")
            if i < 0:
                fx.red("L1", "honest limit at model L%d has no \"Shown wrong if:\"" % at)
            elif is_placeholder(t[i + 15:].lstrip("* \t")):
                fx.red("L1", "honest limit at model L%d names no condition under Shown wrong if" % at)
        im = re.match(r"^- BASE (L[0-9]+(?:-[0-9]+)?(?:, *L[0-9]+(?:-[0-9]+)?)*)", text)
        if im and (section3.startswith("### Kept") or section3.startswith("### Left out, and why")):
            kind = "kept" if section3.startswith("### Kept") else "left"
            item = {"kind": kind, "line": at, "ranges": parse_ranges(im.group(1)), "refs": []}
            if kind == "left" and not re.search(r"why: *[^ ]", text):
                fx.red("B2", "Left-out item at model L%d gives no reason (why:)" % at)
            if kind == "kept":
                where = re.search(r"in: *[^ ]", text)
                if not where:
                    fx.red("B2", "Kept item at model L%d says not where it went (in:)" % at)
                else:
                    item["refs"] = rule_refs(text[where.start():])
            items.append(item)
        n_quotes += quotes(text, at, st.org, src, fx)

    # --- head
    if head_owners == 0:
        fx.red("H1", "the head has no Owner line")
    elif head_owners > 1:
        fx.red("H1", "the head has %d Owner lines; it must have one" % head_owners)
    elif owner_placeholder:
        fx.red("H1", "the head Owner line is empty or a placeholder")
    if head_licence is None:
        fx.red("H2", "the head has no Licence line")
    elif not head_licence:
        fx.red("H2", "the head Licence line does not name both CC BY 4.0 and GPL-3.0-or-later")
    for name in re.findall(r"`([^`]+)`", licence_line):
        if not re.fullmatch(r"[A-Za-z0-9_.-]+\.[A-Za-z0-9]+", name):
            continue
        path = os.path.join(mdir, name)
        head10 = []
        if os.path.isfile(path) and os.access(path, os.R_OK):
            head10 = read_lines(path)[:10]
        if not head10:
            fx.note("H5", "%s is not beside this copy; its licence line was not looked at" % name)
        elif not any("SPDX-License-Identifier: GPL-3.0-or-later" in ln for ln in head10):
            fx.red("H5", "%s sits beside this file without an SPDX-License-Identifier: GPL-3.0-or-later line" % name)
    if not have_core:
        fx.red("C1", "no \"## The model\" section: the core is missing")
    if not rules:
        fx.nc("R0", "no \"### Rule <n> \" blocks found; nothing to check")

    numbers = {}
    for r in rules:
        if r["number"] in numbers:
            fx.red("R1", "Rule %d appears twice (model L%d and L%d)" % (r["number"], numbers[r["number"]], r["line"]))
        else:
            numbers[r["number"]] = r["line"]

    # --- each rule, and its Why block
    stats = {"ids": 0, "strong": 0, "weak": 0, "ask": 0}
    rule_ranges = []
    for r in rules:
        n, f = r["number"], r["fields"]
        if not r["body"]:
            fx.red("R6", "Rule %d (model L%d) has no rule text before its fields" % (n, r["line"]))
        if "Owner" not in f:
            fx.red("R2", "Rule %d (model L%d) has no Owner line" % (n, r["line"]))
        elif f["Owner"][0] == "":
            fx.red("R2", "Rule %d Owner line is empty" % n)
        else:
            v = norm(f["Owner"][0])
            i = v.find("source:")
            if i < 0 or is_placeholder(v[i + 7:]):
                fx.red("O1", "Rule %d: the Owner line names no source" % n)
        if "Check" not in f:
            fx.red("R2", "Rule %d (model L%d) has no Check line" % (n, r["line"]))
        elif f["Check"][0] == "":
            fx.red("R2", "Rule %d Check line is empty" % n)
        else:
            check_field(n, f["Check"][0], fx)
        w = whys.get(n)
        if w is None:
            fx.red("W1", "Rule %d has no Why block under ## Why each rule is here" % n)
            continue
        if w["count"] > 1:
            fx.red("W1", "Rule %d has %d Why blocks; it must have one" % (n, w["count"]))
        wf = w["fields"]
        if not wf.get("Evidence", ("",))[0]:
            fx.red("W1", "Why Rule %d has no Evidence line" % n)
        else:
            evidence(n, wf["Evidence"][0], src, st, stats, fx)
        if not wf.get("Baseline", ("",))[0]:
            fx.red("W1", "Why Rule %d has no Baseline line" % n)
        else:
            value, at = wf["Baseline"]
            if not re.match(r"^new([ .,;]|$)", value):
                if not re.search(r"BASE L[0-9]", value):
                    fx.red("W1", "Why Rule %d: Baseline names no BASE lines and does not say new" % n)
                else:
                    for m in re.finditer(r"BASE L([0-9]+)(?:-([0-9]+))?", value):
                        a = int(m.group(1))
                        rule_ranges.append((n, a, int(m.group(2)) if m.group(2) else a, at))
        if "Drop it if" not in wf or is_placeholder(wf["Drop it if"][0]):
            fx.red("W1", "Why Rule %d says nothing under Drop it if" % n)
    for n, w in whys.items():
        if n not in numbers:
            fx.red("W1", "a Why block (model L%d) names Rule %d, which does not exist" % (w["line"], n))

    # --- references, counts, lists, limits, parts
    for n, at in references:
        if n not in numbers:
            fx.red("X1", "model L%d refers to Rule %d, which does not exist" % (at, n))
    if claimed:
        word, at = claimed
        want = int(word) if word.isdigit() else NUMBER_WORDS.get(word.lower(), -1)
        if want != len(rules):
            fx.red("X2", "model L%d says \"These are %s rules\"; there are %d" % (at, word, len(rules)))
    for name in LISTS:
        if name not in list_count:
            fx.red("K1", "the core does not name the %s list" % name)
        elif list_count[name] > 1:
            fx.red("K1", "the core names the %s list %d times" % (name, list_count[name]))
        elif list_parts[name] < 3:
            fx.red("K1", "the %s list (model L%d) has fewer than three parts" % (name, list_line[name]))
    if not has_limits:
        fx.nc("L1", "no ## Honest limits section; no falsifiers to look at")
    if not has_parts:
        fx.nc("P1", "no ## Why each other part is here section; no Drop it if to look at")
    for it in items:
        for n in it["refs"]:
            if n not in numbers:
                fx.red("B4", "a Kept item names Rule %d, which does not exist (model L%d)" % (n, it["line"]))

    # --- the baseline accounting
    covered = 0
    if not src.readable("base"):
        if items or rule_ranges:
            fx.nc("B1", "the base source cannot be read; the baseline accounting is not checked")
    else:
        every = [(a, b, it["line"]) for it in items for (a, b) in it["ranges"]] + [(a, b, at) for (_, a, b, at) in rule_ranges]
        for a, b, at in every:
            if a < 1 or b < a or b > len(st.base):
                fx.red("B3", "BASE L%d-%d at model L%d is outside the base file (%d lines)" % (a, b, at, len(st.base)))
                continue
            crossed = [k for k in range(a, b + 1) if k in st.hard]
            if crossed:
                fx.red("B5", "BASE L%d-%d at model L%d crosses the base heading or rule at L%d" % (a, b, at, crossed[0]))
        starts_of = [set() for _ in items]
        n_uncovered = 0
        for s in st.starts:
            hit = False
            for k, it in enumerate(items):
                if any(a <= s <= b for (a, b) in it["ranges"]):
                    starts_of[k].add(s)
                    hit = True
            if hit:
                covered += 1
            else:
                n_uncovered += 1
                fx.red("B1", "BASE L%d is neither kept nor left out" % s, show=n_uncovered <= 12)
        if n_uncovered > 12:
            fx.lines.append("RED          B1  ... and %d more uncovered paragraph starts" % (n_uncovered - 12))
        for k, it in enumerate(items):
            if it["kind"] != "kept" or not it["refs"]:
                continue
            named = set(it["refs"])
            for s in sorted(starts_of[k]):
                if not any(n in named and a <= s <= b for (n, a, b, _) in rule_ranges):
                    fx.red("B6", "Kept item at model L%d says it went into Rule(s) %s, but no Baseline line of those rules covers BASE L%d"
                           % (it["line"], ", ".join(str(n) for n in it["refs"]), s))
                    break
        if items:
            k = max(range(len(items)), key=lambda i: (len(starts_of[i]), -i))
            if starts_of[k]:
                fx.note("G1", "the widest item (model L%d, %s) covers %d base paragraph starts; a gauge, not a verdict"
                        % (items[k]["line"], items[k]["kind"], len(starts_of[k])))
    if n_invisible > 12:
        fx.note("Z1", "... and %d more such lines" % (n_invisible - 12))

    fx.lines.append("model_check: %d rules; %d evidence ids (%d holding, %d needs, proposals, contested or listed, %d sent to "
                    "the keeper); %d organization quotes; %d rule references; %d honest limits; %d of %d baseline paragraphs "
                    "accounted for." % (len(rules), stats["ids"], stats["strong"], stats["weak"], stats["ask"], n_quotes,
                                        len(references), n_limits, covered, len(st.starts)))
    if fx.n_red:
        fx.lines.append("In words: RED. %d problem(s) found; %d thing(s) not checked." % (fx.n_red, fx.n_nc))
        return RED, fx.lines
    if fx.n_nc or not rules:
        fx.lines.append("In words: NOT CHECKED. Nothing failed, but %d thing(s) could not be checked." % fx.n_nc)
        return NC, fx.lines
    fx.lines.append("In words: OK. Every check above looked and passed.")
    return OK, fx.lines


def quotes(text, at, org, src, fx):
    found = 0
    markers = text.count("(org-rule L")
    matched = 0
    for m in re.finditer(r"\"([^\"]+)\" \(org-rule L([0-9]+)(?:-([0-9]+))?\)", text):
        matched += 1
        found += 1
        q = norm(m.group(1))
        a = int(m.group(2))
        b = int(m.group(3)) if m.group(3) else a
        if not src.readable("org-rule"):
            fx.nc("Q1", "quote at model L%d: the org-rule source cannot be read" % at)
            continue
        if a < 1 or b < a or b > len(org):
            fx.red("Q1", "quote at model L%d cites org-rule L%d-%d, outside its %d lines" % (at, a, b, len(org)))
            continue
        span = norm(" ".join(org[a - 1:b]))
        hits = [i for i in range(len(span)) if span.startswith(q, i)]
        if not hits:
            fx.red("Q1", "quote at model L%d is not in org-rule L%d-%d word for word: \"%s\"" % (at, a, b, q[:48]))
            continue

        def alnum(c):
            return c.isascii() and c.isalnum()

        def bounded(i):
            j = i + len(q)
            left = not (alnum(q[0]) and i > 0 and alnum(span[i - 1]))
            right = not (alnum(q[-1]) and j < len(span) and alnum(span[j]))
            return left and right

        if not any(bounded(i) for i in hits):
            fx.red("Q2", "quote at model L%d is cut mid-word in org-rule L%d-%d: \"%s\"" % (at, a, b, q[:48]))
    if markers > matched:
        fx.red("Q1", "model L%d: %d org-rule marker(s) with no straight-quoted text the checker can read" % (at, markers - matched))
    if re.search(r"(forbids|requires|prefers):", text) and matched == 0:
        fx.red("Q3", "model L%d names a strength but quotes nothing: a retelling, not a quote" % at)
    return found


def check_field(number, value, fx):
    value = norm(value)
    if value.startswith("`"):
        fx.red("R3", "Rule %d: the Check begins with code; put the by-hand way first" % number)
    p = label_position(value, "RED:")
    q = value.find("NOT CHECKED:")
    if p < 0 or q < 0:
        fx.red("R4", "Rule %d: the Check does not say what makes it RED: and NOT CHECKED:" % number)
        return
    step = value[:min(p, q)]
    if p < q:
        red_cond, nc_cond = value[p + 4:q], value[q + 12:]
    else:
        nc_cond, red_cond = value[q + 12:p], value[p + 4:]
    if is_placeholder(step):
        fx.red("R4", "Rule %d: the Check has no by-hand step before its answers" % number)
    if is_placeholder(red_cond):
        fx.red("R4", "Rule %d: the Check names no condition for RED" % number)
    if is_placeholder(nc_cond):
        fx.red("R4", "Rule %d: the Check names no condition for NOT CHECKED" % number)


def evidence(number, value, src, st, stats, fx):
    if value.strip(" \t").lower().rstrip(".") == "none yet":
        fx.nc("E5", "Rule %d: evidence says \"none yet\"; this rule is not checked against evidence" % number)
        return
    strong = wanting = 0
    for raw in re.split(r"[;,]", value):
        ident = raw.strip(" \t")
        if not ident:
            continue
        stats["ids"] += 1
        if re.fullmatch(r"R2S-[0-9]{3}", ident) or re.fullmatch(r"R3S-[0-9]{3}", ident):
            name, known = ("score", st.r2s) if ident.startswith("R2S") else ("score3", st.r3s)
            if not src.readable(name):
                fx.nc("E2", "Rule %d: %s not resolved, the %s cannot be read" % (number, ident, name))
                wanting += 1
            elif ident in known:
                strong += 1
            else:
                fx.red("E2", "Rule %d: %s is not a section of the %s" % (number, ident, name))
        elif re.fullmatch(r"paper:[FSWOT][0-9]+", ident) or re.fullmatch(r"paper:sec[0-9]+[a-z]?", ident):
            key = ident[6:]
            if not src.readable("paper"):
                fx.nc("E2", "Rule %d: %s not resolved, the paper cannot be read" % (number, ident))
                wanting += 1
            elif key not in st.paper:
                fx.red("E2", "Rule %d: %s is not an item or section of the paper" % (number, ident))
            elif key[0] in "WTO" or key in st.f_not_yet:
                stats["weak"] += 1
            else:
                strong += 1
        elif re.fullmatch(r"row1:[A-Z]+-?[0-9]+", ident):
            key = ident[5:]
            if key in st.conc:
                if "ask-keeper" in st.conc[key]:
                    stats["ask"] += 1
                    fx.note("E4", "Rule %d: %s is a question both readers sent to the keeper; not counted as evidence that the rule holds" % (number, ident))
                else:
                    strong += 1
            elif key in st.contested or key in st.ideas:
                stats["weak"] += 1
            elif not (src.readable("row1-conclusive") and src.readable("row1-contested") and src.readable("new-ideas")):
                fx.nc("E2", "Rule %d: %s not resolved, a row1 table cannot be read" % (number, ident))
                wanting += 1
            else:
                fx.red("E2", "Rule %d: %s is in none of the row1 tables" % (number, ident))
        else:
            fx.red("E1", "Rule %d: evidence id \"%s\" has no known form" % (number, ident[:40]))
    stats["strong"] += strong
    if strong == 0:
        if wanting:
            fx.nc("E3", "Rule %d: no holding evidence could be confirmed (sources unreadable)" % number)
        else:
            fx.red("E3", "Rule %d rests only on needs, proposals, contested, listed or open (ask-keeper) evidence" % number)


def read_pins(path):
    pins = {}
    for ln in read_lines(path):
        c = ln.split("\t")
        if len(c) >= 2 and c[0]:
            pins[c[0]] = c[1].strip()
    return pins


# ------------------------------------------------------------------------------------------------ prove-red

FIXTURE_SOURCES = {
    "score": ("s.md", "# score\n\n### R2S-004: four\nbody\n\n### R2S-017: seventeen\n"),
    "score3": ("s3.md", "# score 3\n\n### R3S-009: nine\nbody\n"),
    "paper": ("p.md", "# paper\n\n| # | x | proof | Status |\n|---|---|---|---|\n| F9 | **nine** | run | SHOWN at home |\n"
                      "| F4 | **four** | none | NOT YET SHOWN |\n\n**W4 \u00b7 a weakness**\n\n**T2 \u00b7 a threat**\n\n"
                      "**O7 \u00b7 an opening**\n\n## 3a. More\n"),
    "row1-conclusive": ("c.tsv", "id\twarp\tverdict(both)\tnote_A\tnote_B\nKB-04\tS1\tadd\tx\ty\nKB-09\tS5\task-keeper\tx\ty\n"),
    "row1-contested": ("d.tsv", "id\twarp\tverdict_A\tverdict_B\tnote_A\tnote_B\nKB-17\tS1\tkeep\tchange\tx\ty\n"),
    "new-ideas": ("n.tsv", "id\tidea (plain words)\twarp\tact1_receipts\nN17\tidea\tS2\tr\n"),
    "org-rule": ("o.txt", "Contributors must say when a tool wrote\nthe change, and we prefer short patches.\n"),
    "base": ("b.md", "# Base\n\nFirst part, line one.\nline two.\n\n- a list item\n\nLast part.\n"),
}
CODE_FILE = ("helper.py", "#!/usr/bin/env python3\n# SPDX-License-Identifier: GPL-3.0-or-later\npass\n")


def fixture_model(shas):
    rows = "".join("| %s | %s | %s |\n" % (n, FIXTURE_SOURCES[n][0], shas[n]) for n in FIXTURE_SOURCES)
    return (
        "<!-- SPDX-License-Identifier: CC-BY-4.0 -->\n# Fixture\n\n"
        "- **Owner:** fixture owner\n- **Licence:** prose CC BY 4.0, code (`helper.py`) GPL-3.0-or-later\n\n"
        "## The model\n\nThese are 2 rules, and Rules 1 and 2 are both here.\n\n"
        "### Rule 1 \u00b7 One\n\nThe first, in Arabic too: \u0642\u0627\u0639\u062f\u0629\u200f.\n\n"
        "- **Owner:** tester \u00b7 since 2026-09-30 \u00b7 source: new\n"
        "- **Check:** read it by hand. RED: the rule is broken. NOT CHECKED: nobody read it.\n\n"
        "### Rule 2 \u00b7 Two\n\nThe second.\n\n"
        "- **Owner:** tester \u00b7 since 2026-09-30 \u00b7 source: new\n"
        "- **Check:** count by hand.\n  RED: the count is off. NOT CHECKED: nothing to count.\n\n"
        "### Choices\n\n| Where | Default | Other | Change it if |\n|---|---|---|---|\n| Rule 2 | count | guess | a person says so |\n\n"
        "### Example\n\n- It requires: \"say when a tool wrote the change\" (org-rule L1-2).\n\n"
        "### The lists\n\n    HEAD  owner \u00b7 licence \u00b7 stop\n    RULES  rule \u00b7 owner \u00b7 source\n"
        "    HELD  date \u00b7 kind \u00b7 pointer\n    HANDS  item \u00b7 AI \u00b7 reviewer\n"
        "    MEETINGS  words \u00b7 strength \u00b7 decided by\n\n"
        "## Why each rule is here\n\n### Why Rule 1 \u00b7 One\n\nBecause.\n\n"
        "- **Evidence:** R2S-004; paper:W4; row1:KB-04\n- **Baseline:** BASE L3-4\n- **Drop it if:** it never helps.\n\n"
        "### Why Rule 2 \u00b7 Two\n\nBecause.\n\n"
        "- **Evidence:** R3S-009; paper:F9; paper:sec3a; paper:T2; paper:O7; paper:F4; row1:KB-09; row1:KB-17; row1:N17\n"
        "- **Baseline:** BASE L6\n- **Drop it if:** counting never helps.\n\n"
        "## Why each other part is here\n\n| Part | Why | Drop it if |\n|---|---|---|\n| The lists | a record | nobody keeps them |\n\n"
        "## Honest limits\n\n1. **Thin.** One fixture. *Shown wrong if:* a second fixture agrees.\n"
        "2. **Small.** Two rules. *Shown\n   wrong if:* a third rule changes nothing.\n\n"
        "## From the baseline\n\n### Kept\n\n"
        "- BASE L3-4 \u00b7 first part \u00b7 in: Rule 1\n"
        "- BASE L6 \u00b7 the item \u00b7 in: Rule 2\n\n"
        "### Left out, and why\n\n- BASE L8 \u00b7 last part \u00b7 why: not needed here\n\n"
        "## Sources\n\n| name | path | sha256 |\n|---|---|---|\n" + rows +
        "\n---\n\nAssisted-by: none.\n\n*\u00a9 2026 fixture owner. Licensed CC BY 4.0.*\n"
    )


def prove_red():
    work = tempfile.mkdtemp(prefix="model_check_pr.")
    print("prove-red: these plants are the author's own; under Rule 5 they do not show this check able to fail.")
    try:
        clean = os.path.join(work, "clean")
        os.mkdir(clean)
        shas = {}
        for name, (fname, body) in FIXTURE_SOURCES.items():
            p = os.path.join(clean, fname)
            with open(p, "w", encoding="utf-8", newline="") as fh:
                fh.write(body)
            shas[name] = sha256_of(p)
        with open(os.path.join(clean, CODE_FILE[0]), "w", encoding="utf-8", newline="") as fh:
            fh.write(CODE_FILE[1])
        model_text = fixture_model(shas)
        pins = dict(shas)

        def run(text, mutate_dir=None):
            m = os.path.join(work, "m")
            shutil.rmtree(m, ignore_errors=True)
            shutil.copytree(clean, m)
            if mutate_dir:
                text = mutate_dir(m, text)
            path = os.path.join(m, "model.md")
            if text is not None:
                with open(path, "w", encoding="utf-8", newline="") as fh:
                    fh.write(text)
            return check(path, pins)

        rc, out = run(model_text)
        if rc != OK or not any(l.startswith("NOTE") and " E4 " in l for l in out) or not any(l.startswith("NOTE") and " Z1 " in l for l in out):
            print("prove-red: the clean fixture did not check OK with its E4 and Z1 notes (exit %d)" % rc)
            for l in out:
                print("           | " + l)
            return RED
        print("prove-red: control clean fixture (with a right-to-left word)  exit 0, with the E4 and Z1 notes")

        def sub(old, new, count=1):
            def f(t):
                if old not in t:
                    raise LookupError(old)
                return t.replace(old, new, count)
            return f

        def forge(m, t):
            body = FIXTURE_SOURCES["org-rule"][1].replace("say when a tool", "never say when a tool")
            with open(os.path.join(m, "forged.txt"), "w", encoding="utf-8", newline="") as fh:
                fh.write(body)
            fs = sha256_of(os.path.join(m, "forged.txt"))
            t = t.replace("| org-rule | o.txt | %s |" % shas["org-rule"], "| org-rule | forged.txt | %s |" % fs)
            return t.replace("\"say when a tool wrote the change\"", "\"never say when a tool wrote the change\"")

        def edit_file(fname, fn):
            def f(m, t):
                p = os.path.join(m, fname)
                with open(p, encoding="utf-8") as fh:
                    body = fh.read()
                with open(p, "w", encoding="utf-8", newline="") as fh:
                    fh.write(fn(body))
                return t
            return f

        def remove(fname):
            def f(m, t):
                os.remove(os.path.join(m, fname))
                return t
            return f

        def no_model(m, t):
            return None

        no_rules = re.sub(r"### Rule 1 .*?(?=### Choices)", "", model_text, flags=re.S)
        no_rules = re.sub(r"## Why each rule is here.*?(?=## Why each other part)", "", no_rules, flags=re.S)
        no_rules = no_rules.replace("These are 2 rules, and Rules 1 and 2 are both here.\n\n", "")
        no_rules = no_rules.replace("| Rule 2 | count", "| nothing | count")
        no_rules = no_rules.replace("in: Rule 1", "in: form").replace("in: Rule 2", "in: form")
        no_limits = re.sub(r"## Honest limits.*?(?=## From the baseline)", "", model_text, flags=re.S)

        # (label, expected exit, expected code, or "NOTE:<code>", or None; text transform; directory action)
        plants = [
            ("F1 control: CRLF copy reads OK", OK, None, lambda t: t.replace("\n", "\r\n"), None),
            ("Z1 control: hidden override stays OK", OK, "NOTE:Z1", sub("The second.", "The \u200b\u202esecond\u202c."), None),
            ("H5 control: code file absent is a NOTE", OK, "NOTE:H5", None, remove(CODE_FILE[0])),
            ("R4 control: label wrapped mid-label", OK, None, sub("count by hand.\n  RED: the count is off. NOT CHECKED:", "count by hand.\n  RED: the count is off. NOT\n  CHECKED:"), None),
            ("K1 control: prose line starting HEAD", OK, None, sub("The second.", "The second, whose\nHEAD line comes first."), None),
            ("F0 model empty", NC, "F0", lambda t: "", None),
            ("F0 model missing", NC, "F0", None, no_model),
            ("H1 head owner removed", RED, "H1", sub("- **Owner:** fixture owner\n", ""), None),
            ("H1 two head owners", RED, "H1", sub("- **Owner:** fixture owner\n", "- **Owner:** ?\n- **Owner:** fixture owner\n"), None),
            ("H1 owner a placeholder", RED, "H1", sub("- **Owner:** fixture owner\n", "- **Owner:** Unknown.\n"), None),
            ("H2 licence without GPL", RED, "H2", sub(" GPL-3.0-or-later", ""), None),
            ("H3 SPDX line removed", RED, "H3", sub("<!-- SPDX-License-Identifier: CC-BY-4.0 -->\n", ""), None),
            ("H4 foot credit removed", RED, "H4", sub("*\u00a9 2026 fixture owner. Licensed CC BY 4.0.*\n", ""), None),
            ("H5 code file without SPDX", RED, "H5", None, edit_file(CODE_FILE[0], lambda b: b.replace("# SPDX-License-Identifier: GPL-3.0-or-later\n", ""))),
            ("C1 id in the core", RED, "C1", sub("The second.", "The second (row1:KB-04)."), None),
            ("C1 core heading renamed", RED, "C1", sub("## The model\n", "## Rules\n"), None),
            ("R0 no rules", NC, "R0", lambda t: no_rules, None),
            ("R1 rule number twice", RED, "R1", sub("### Rule 2 ", "### Rule 1 "), None),
            ("R2 Check removed", RED, "R2", sub("- **Check:** read it by hand. RED: the rule is broken. NOT CHECKED: nobody read it.\n", ""), None),
            ("R3 Check begins with code", RED, "R3", sub("- **Check:** read it", "- **Check:** `cat` read it"), None),
            ("R4 no labels", RED, "R4", sub("RED: the rule is broken. NOT CHECKED: nobody read it.", "fine."), None),
            ("R4 placeholder RED", RED, "R4", sub("RED: the rule is broken.", "RED: never."), None),
            ("R4 placeholder NOT CHECKED", RED, "R4", sub("NOT CHECKED: nothing to count.", "NOT CHECKED: TBD"), None),
            ("R4 no by-hand step", RED, "R4", sub("- **Check:** count by hand.\n  RED:", "- **Check:** RED:"), None),
            ("R5 unreadable rule heading", RED, "R5", sub("### Rule 2 \u00b7", "### Rule II \u00b7"), None),
            ("R6 rule without text", RED, "R6", sub("### Rule 2 \u00b7 Two\n\nThe second.\n\n", "### Rule 2 \u00b7 Two\n\n"), None),
            ("R7 rule outside the core", RED, "R7", sub("## From the baseline\n", "### Rule 3 \u00b7 Stray\n\nText.\n\n- **Owner:** x \u00b7 source: new\n- **Check:** look. RED: bad. NOT CHECKED: none.\n\n## From the baseline\n"), None),
            ("O1 owner without source", RED, "O1", sub("- **Owner:** tester \u00b7 since 2026-09-30 \u00b7 source: new\n- **Check:** read", "- **Owner:** tester \u00b7 since 2026-09-30\n- **Check:** read"), None),
            ("W1 Why block missing", RED, "W1", lambda t: re.sub(r"### Why Rule 2 .*?(?=## Why each other part)", "", t, flags=re.S), None),
            ("W1 Why for no rule", RED, "W1", sub("### Why Rule 2 ", "### Why Rule 6 "), None),
            ("W1 Drop it if placeholder", RED, "W1", sub("- **Drop it if:** it never helps.", "- **Drop it if:** TODO"), None),
            ("W1 Baseline neither", RED, "W1", sub("- **Baseline:** BASE L6\n", "- **Baseline:** above\n"), None),
            ("X1 missing rule referenced", RED, "X1", sub("Rules 1 and 2 are", "Rules 1 and 5 are"), None),
            ("X1 missing rule in a list", RED, "X1", sub("Rules 1 and 2 are", "Rules 1, 7 and 2 are"), None),
            ("X2 count wrong", RED, "X2", sub("These are 2 rules", "These are 3 rules"), None),
            ("D1 choices cell empty", RED, "D1", sub("| guess | a person says so |", "| guess | n/a |"), None),
            ("K1 list missing", RED, "K1", sub("    HANDS  item \u00b7 AI \u00b7 reviewer\n", ""), None),
            ("K1 list too short", RED, "K1", sub("    HELD  date \u00b7 kind \u00b7 pointer\n", "    HELD  date\n"), None),
            ("L1 limit without falsifier", RED, "L1", sub(" *Shown wrong if:* a second fixture agrees.", ""), None),
            ("L1 no limits section", NC, "L1", lambda t: no_limits, None),
            ("P1 part with empty Drop it if", RED, "P1", sub("| a record | nobody keeps them |", "| a record | - |"), None),
            ("E1 unknown id form", RED, "E1", sub("paper:W4", "paper:Q4"), None),
            ("E1 row-3 id malformed", RED, "E1", sub("R3S-009", "R3S-9"), None),
            ("E2 score id not there", RED, "E2", sub("R2S-004", "R2S-005"), None),
            ("E2 row-3 id not there", RED, "E2", sub("R3S-009", "R3S-010"), None),
            ("E2 paper section not there", RED, "E2", sub("paper:sec3a", "paper:sec4"), None),
            ("E2 row1 id not there", RED, "E2", sub("row1:KB-04", "row1:KB-40"), None),
            ("E3 only needs and proposals", RED, "E3", sub("R2S-004; paper:W4; row1:KB-04", "paper:W4; paper:T2; paper:O7; paper:F4"), None),
            ("E3 only ask-keeper", RED, "E3", sub("R2S-004; paper:W4; row1:KB-04", "row1:KB-09"), None),
            ("E5 none yet", NC, "E5", sub("R2S-004; paper:W4; row1:KB-04", "None yet."), None),
            ("S1 base missing", NC, "S1", None, remove("b.md")),
            ("S2 source edited after citing", RED, "S2", None, edit_file("s.md", lambda b: b + "late\n")),
            ("S3 forged org copy", RED, "S3", None, forge),
            ("Q1 retold quote", RED, "Q1", sub("\"say when a tool wrote the change\"", "\"say when an AI wrote the change\""), None),
            ("Q1 lines out of range", RED, "Q1", sub("(org-rule L1-2)", "(org-rule L1-5)"), None),
            ("Q1 curly quotes", RED, "Q1", sub("\"say when a tool wrote the change\"", "\u201csay when a tool wrote the change\u201d"), None),
            ("Q2 cut mid-word", RED, "Q2", sub("\"say when a tool wrote the change\"", "\"ay when a tool wrote the chan\""), None),
            ("Q3 strength retold", RED, "Q3", sub("- It requires: \"say when a tool wrote the change\" (org-rule L1-2).", "- It requires: a tool line on every patch."), None),
            ("B1 item removed", RED, "B1", sub("- BASE L8 \u00b7 last part \u00b7 why: not needed here\n", ""), None),
            ("B2 no why", RED, "B2", sub(" why: not needed here", ""), None),
            ("B3 range past the end", RED, "B3", sub("- BASE L8 \u00b7", "- BASE L8-80 \u00b7"), None),
            ("B4 Kept names missing rule", RED, "B4", sub("in: Rule 2", "in: Rule 6"), None),
            ("B5 range crosses a heading", RED, "B5", sub("- BASE L3-4 \u00b7", "- BASE L1-4 \u00b7"), None),
            ("B6 Kept range not in its rule", RED, "B6", sub("- BASE L3-4 \u00b7 first part", "- BASE L3-6 \u00b7 first part"), None),
        ]

        caught = total = setup = 0
        for label, want_rc, want_code, transform, action in plants:
            try:
                text = transform(model_text) if transform else model_text
            except LookupError:
                print("prove-red: SETUP   %-44s the plant changed nothing; not counted" % label)
                setup += 1
                continue
            if transform and text == model_text:
                print("prove-red: SETUP   %-44s the plant changed nothing; not counted" % label)
                setup += 1
                continue
            rc, out = run(text, action)
            total += 1
            codes = {l.split()[2] if l.startswith("NOT CHECKED") else l.split()[1]
                     for l in out if l.startswith("RED") or l.startswith("NOT CHECKED")}
            notes = {l.split()[1] for l in out if l.startswith("NOTE")}
            if want_code and want_code.startswith("NOTE:"):
                hit = want_code[5:] in notes
            else:
                hit = want_code is None or want_code in codes
            if rc == want_rc and hit:
                caught += 1
                print("prove-red: caught  %-44s exit %d, %s" % (label, rc, want_code or "-"))
            else:
                print("prove-red: MISSED  %-44s exit %d (wanted %d, %s)" % (label, rc, want_rc, want_code))
                for l in out:
                    print("           | " + l)
        print("prove-red: caught %d of %d (the author's own plants and controls); %d plant%s did not apply."
              % (caught, total, setup, "" if setup == 1 else "s"))
        return OK if caught == total and setup == 0 else RED
    finally:
        shutil.rmtree(work, ignore_errors=True)


USAGE = """usage: model_check.py [--pins FILE] [check] MODEL.md
       model_check.py --prove-red
       model_check.py --help
exit:  0 OK · 1 RED · 77 NOT CHECKED (nothing to check, or something it needed could not be read)"""


def main(argv):
    pins = dict(PINS_BUILTIN)
    args = list(argv)
    if args[:1] == ["--pins"]:
        if len(args) < 2 or not os.access(args[1], os.R_OK):
            print(USAGE)
            print("NOT CHECKED  usage: --pins needs a readable file")
            return NC
        pins = read_pins(args[1])
        args = args[2:]
    if args[:1] == ["--prove-red"]:
        return prove_red()
    if args[:1] in (["--help"], ["-h"]):
        print(USAGE)
        return OK
    if args[:1] == ["check"]:
        args = args[1:]
    if len(args) != 1:
        print(USAGE)
        print("NOT CHECKED  usage: no model file given" if not args else "NOT CHECKED  usage")
        return NC
    rc, out = check(args[0], pins)
    for l in out:
        print(l)
    return rc


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
