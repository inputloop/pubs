#!/bin/sh
# model-check.sh --- check the form of a "Plain Rules for AI Help" model file.  Version 3.
#
# Copyright (C) 2026 Corwin Brust
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Version 1 by an AI assistant (Claude, claude-opus-5-5), run G1CC1; version 2 by a second reader, run G1CC2;
# version 3 by the consolidation run (same model), 2026-09-30, to SPEC-model-check.md v3, for the consolidated
# form: owner and check in each rule, reasons and evidence in Why blocks at the back, the five lists, the
# choices table, and a falsifier on every part and limit.  The twin is model_check.py beside this file.
# Reviewed by: no person yet.  POSIX sh and awk only; no bash, no gawk extensions, no regex intervals.
#
# usage:
#   model-check.sh [--pins FILE] [check] MODEL.md   check one model file
#   model-check.sh --prove-red                       the author's own plants (they do not prove the check; Rule 5)
#   model-check.sh --help
# exit: 0 OK · 1 RED · 77 NOT CHECKED.  It never answers OK over nothing.
#
# Codes (SPEC v3): F0 F1 · H1 one owner, not a placeholder · H2 licence · H3 SPDX · H4 foot credit · H5 code SPDX
#   C1 a core, with no ids in it · R0-R5 as v2 (R2 now Owner and Check) · R6 rule text · R7 no rule outside the core
#   O1 owner names a source · W1 one Why block per rule, with Evidence, Baseline, Drop it if · X1 X2 references
#   D1 choices rows · K1 the five lists · L1 Shown wrong if · P1 Drop it if for each part
#   E1-E5 evidence (E3: holding ids only) · S1-S3 sources and pins · Q1-Q3 quotes · B1-B6 baseline · G1 Z1 notes

set -u
LC_ALL=C; export LC_ALL
TAB=$(printf '\t')
DOT=$(printf '\302\267')    # the middle dot
COPY=$(printf '\302\251')   # the copyright sign
CR=$(printf '\r')
# Z1: invisible or direction-changing characters, as UTF-8 bytes (shown as a NOTE, never RED)
INVIS=$(printf '\342\200[\213-\217\250-\256]|\342\201[\240-\244\246-\251]|\357\273\277|\302\255')
PINS_FILE=

PINS_BUILTIN="score${TAB}49969c6936c84d54faa42706dc5557df956f6bc15dacb739dedff4e80a05210d
score3${TAB}95dd05bda313de98060d6d382219a8df39e55c83649fe483da24d6640ca938fe
paper${TAB}034f8694b13f1fe4dfde62d82b52833bf5d9ca8d7394c7bf72b5556f9ccf8028
row1-conclusive${TAB}0ddc250fd2f386e71d2647c284d9da0ce900c29141365c7a3969f5292e2116fb
row1-contested${TAB}789d435f02f473414c876ee0bdbe600fb099b360e6c60a1daf8d01cf9ca6b965
new-ideas${TAB}c02902dd2ae16c8464072d68b0a603b4199f197ee123da3a4d38542677a14794
org-rule${TAB}8f42a69a689ba1c4138471815ebcb995820698bec2d025e90f09464fef18b7b5
base${TAB}3c8db5aa2e9ead287632b0bf3ef5bad67d90d984088fe8492cda238330095235"

usage() {
	cat <<'EOF'
usage: model-check.sh [--pins FILE] [check] MODEL.md
       model-check.sh --prove-red
       model-check.sh --help
exit:  0 OK · 1 RED · 77 NOT CHECKED (nothing to check, or something it needed could not be read)
EOF
}

sha_of() {
	if command -v sha256sum >/dev/null 2>&1; then sha256sum < "$1" | awk '{print $1}'; return 0; fi
	if command -v shasum >/dev/null 2>&1; then shasum -a 256 < "$1" | awk '{print $1}'; return 0; fi
	if command -v openssl >/dev/null 2>&1; then openssl dgst -sha256 < "$1" | awk '{print $NF}'; return 0; fi
	return 0
}

mkd() {
	d=$(mktemp -d 2>/dev/null) && { printf '%s\n' "$d"; return 0; }
	d=${TMPDIR:-/tmp}/model-check.$$.$(date +%s 2>/dev/null || echo 0)
	mkdir -m 700 "$d" && printf '%s\n' "$d"
}

# ------------------------------------------------------------------------------------------------ check
CHECK_AWK='
function red(code, msg)  { printf "RED          %s  %s\n", code, msg; nred++ }
function nc(code, msg)   { printf "NOT CHECKED  %s  %s\n", code, msg; nnc++ }
function note(code, msg) { printf "NOTE         %s  %s\n", code, msg }
function trim(s) { sub(/^[ \t]+/, "", s); sub(/[ \t]+$/, "", s); return s }
function norm(s) { gsub(/[ \t\r\n]+/, " ", s); return trim(s) }
function readable(n) { return (n in sread) && sread[n] == 1 }
function isalnum(c) { return c ~ /^[A-Za-z0-9]$/ }
function getl(fn,   r) { r = (getline gl < fn); if (r > 0) sub(/\r$/, "", gl); return r }

function placeholder(s,   t) {
	t = tolower(s); gsub(/[ \t]+/, " ", t)
	sub(/^[ .,;:()!?*_`"-]+/, "", t); sub(/[ .,;:()!?*_`"-]+$/, "", t)
	return (t == "" || t == "n/a" || t == "na" || t == "none" || t == "nothing" || t == "never" || t == "tbd" || t == "tba" || t == "todo" || t == "unknown" || t == "to be written" || t == "to be decided")
}

function labelpos(v, lab,   off, i, c) {
	off = 0
	while ((i = index(substr(v, off + 1), lab)) > 0) {
		i += off; c = (i > 1) ? substr(v, i - 1, 1) : ""
		if (c !~ /[A-Za-z]/) return i
		off = i
	}
	return 0
}

function refs(s,   rest, tok, n, m, out) {  # "Rule <n>"; after "Rules <n>", each ", <m>", " to <m>", " and <m>"
	s = norm(s); out = ""; rest = s
	while (match(rest, /Rules? [0-9]+/)) {
		tok = substr(rest, RSTART, RLENGTH); rest = substr(rest, RSTART + RLENGTH)
		n = tok; sub(/^Rules? /, "", n); out = out " " n
		if (tok ~ /^Rules /) {
			while (match(rest, /^(,| to| and) [0-9]+/)) {
				m = substr(rest, RSTART, RLENGTH); rest = substr(rest, RSTART + RLENGTH)
				sub(/^(,| to| and) /, "", m); out = out " " m
			}
		}
	}
	return out
}

function wordnum(w,   t) {
	t = tolower(w)
	if (t ~ /^[0-9]+$/) return t + 0
	if (t == "one") return 1;  if (t == "two") return 2;  if (t == "three") return 3;  if (t == "four") return 4
	if (t == "five") return 5; if (t == "six") return 6;  if (t == "seven") return 7;  if (t == "eight") return 8
	if (t == "nine") return 9; if (t == "ten") return 10; if (t == "eleven") return 11; if (t == "twelve") return 12
	return -1
}

function cells(L, c,   n, i) {  # split a table row into trimmed cells c[1..n]
	n = split(L, c, "|")
	for (i = 1; i <= n; i++) c[i] = trim(c[i])
	return n
}

BEGIN {
	nred = 0; nnc = 0; nrules = 0; inhead = 1; inrule = 0; sec3 = ""; buf = ""; bufln = 0
	nowner = 0; ownerph = 0; headlic = 0; licline = ""; spdx = 0; nquotes = 0; nids = 0; nstrong = 0; nweak = 0; nask = 0
	nitems = 0; basen = 0; nbstart = 0; nr = 0; nx = 0; hasdash = 0; foot = ""; claimed = ""
	incore = 0; havecore = 0; pcore = 0; inwhy = 0; curwhy = ""; inchoices = 0; inlimits = 0; haslimits = 0
	inparts = 0; hasparts = 0; chrow = 0; ptrow = 0; nz = 0; nlimits = 0; nc1 = 0
	split("HEAD RULES HELD HANDS MEETINGS", lists, " ")
	while (getl(SRC) > 0) {
		split(gl, f, "\t"); n = f[1]
		spath[n] = f[2]; swant[n] = f[3]; sgot[n] = f[4]; sread[n] = f[5]; spin[n] = f[6]
		if (f[5] != 1) nc("S1", "source " n " cannot be read: " f[2])
		else if (f[4] == "") nc("S2", "no sha256 tool here; source " n " not compared")
		else if (tolower(f[4]) != tolower(f[3])) red("S2", "source " n " changed since it was cited (table " substr(f[3], 1, 12) ", file " substr(f[4], 1, 12) ")")
		if (f[6] != "" && tolower(f[3]) != tolower(f[6])) red("S3", "source " n ": the table names a copy (" substr(f[3], 1, 12) ") other than the one this checker pins (" substr(f[6], 1, 12) ")")
	}
	close(SRC)
	if (readable("score")) { p = spath["score"]; while (getl(p) > 0) if (match(gl, /^### R2S-[0-9][0-9][0-9]/)) r2s[substr(gl, 5, 7)] = 1; close(p) }
	if (readable("score3")) { p = spath["score3"]; while (getl(p) > 0) if (match(gl, /^### R3S-[0-9][0-9][0-9]/)) r3s[substr(gl, 5, 7)] = 1; close(p) }
	if (readable("paper")) {
		p = spath["paper"]
		while (getl(p) > 0) {
			if (match(gl, /^\| F[0-9]+ \|/)) {
				id = substr(gl, 3, RLENGTH - 4); pid[id] = 1
				nn = cells(gl, cc); st = ""; for (i = nn; i >= 1; i--) if (cc[i] != "") { st = cc[i]; break }
				pfnot[id] = (st ~ /^NOT YET/) ? 1 : 0
			}
			else if (match(gl, /^\*\*[SWOT][0-9]+ /)) { id = substr(gl, 3, RLENGTH - 3); pid[id] = 1 }
			else if (match(gl, /^## [0-9]+[a-z]?\./)) { id = "sec" substr(gl, 4, RLENGTH - 4); pid[id] = 1 }
		}
		close(p)
	}
	if (readable("row1-conclusive")) { p = spath["row1-conclusive"]; while (getl(p) > 0) { split(gl, f, "\t"); if (f[1] != "id" && f[1] != "") conc[f[1]] = f[3] }; close(p) }
	if (readable("row1-contested")) { p = spath["row1-contested"]; while (getl(p) > 0) { split(gl, f, "\t"); if (f[1] != "id" && f[1] != "") cont[f[1]] = 1 }; close(p) }
	if (readable("new-ideas")) { p = spath["new-ideas"]; while (getl(p) > 0) { split(gl, f, "\t"); if (f[1] != "id" && f[1] != "") nidea[f[1]] = 1 }; close(p) }
	if (readable("org-rule")) { p = spath["org-rule"]; orgn = 0; while (getl(p) > 0) org[++orgn] = gl; close(p) }
	if (readable("base")) {
		p = spath["base"]; blank = 1
		while (getl(p) > 0) {
			basen++
			if (gl ~ /^[ \t]*$/) { blank = 1; continue }
			if (gl ~ /^#/ || gl ~ /^---/) hd[basen] = 1
			if (gl ~ /^#/ || gl ~ /^---/ || gl ~ /^>/ || gl ~ /^\|/) { blank = 0; continue }
			if (blank || basen == 1 || gl ~ /^- /) bstart[++nbstart] = basen
			blank = 0
		}
		close(p)
	}
}

# --- physical lines (F1: one trailing CR removed)
{ sub(/\r$/, "") }
FNR <= 3 && index($0, "SPDX-License-Identifier: CC-BY-4.0") { spdx = 1 }
{ if ($0 == "---") { hasdash = 1; foot = "" } else foot = foot "\n" $0 }
$0 ~ INVIS { nz++; if (nz <= 12) note("Z1", "model L" FNR " holds an invisible or direction-changing character; a person should read it (never RED: a right-to-left text may need one)") }
/^## / { pcore = ($0 ~ /^## The model[ \t]*$/) }
pcore && /^[ \t]*(HEAD|RULES|HELD|HANDS|MEETINGS)[ \t]/ && index($0, " " DOTV " ") {
	t = $0; sub(/^[ \t]*/, "", t); nm = t; sub(/[ \t].*$/, "", nm)
	lcount[nm]++; lln[nm] = FNR; k = split(t, tmp, " " DOTV " "); lparts[nm] = k
}
{
	line = $0
	starts = (line ~ /^#/ || line ~ /^- / || line ~ /^\|/ || line ~ /^[0-9]+\. / || line ~ /^---/)
	if (line ~ /^[ \t]*$/) { flush(); next }
	if (starts) { flush(); buf = line; bufln = FNR; next }
	if (buf == "") { buf = line; bufln = FNR } else buf = buf " " line
}

function flush(   L) { if (buf == "") return; L = buf; buf = ""; logical(L, bufln) }

function xrefs(L, ln,   s, k, a, i) {
	s = refs(L); k = split(s, a, " ")
	for (i = 1; i <= k; i++) if (a[i] != "") { nx++; xn[nx] = a[i]; xl[nx] = ln }
}

function logical(L, ln,   t, v, rn, n, c, i) {
	if (L ~ /^### Rule [0-9]+ /) {
		inhead = 0; inrule = 1; inwhy = 0; nrules++
		rn = L; sub(/^### Rule /, "", rn); sub(/[^0-9].*$/, "", rn)
		cur = nrules; rnum[cur] = rn; rline[cur] = ln
		if (rn in seenrule) red("R1", "Rule " rn " appears twice (model L" seenrule[rn] " and L" ln ")")
		else seenrule[rn] = ln
		if (!incore) red("R7", "Rule " rn " (model L" ln ") sits outside the core (## The model)")
		return
	}
	xrefs(L, ln)
	if (incore && (L ~ /R[23]S-[0-9]/ || L ~ /paper:[A-Za-z]/ || L ~ /row1:[A-Za-z]/ || L ~ /BASE L[0-9]/)) {
		nc1++; if (nc1 <= 12) red("C1", "model L" ln ": an evidence id or baseline reference inside the core; it belongs at the back"); else nred++
	}
	if (match(L, /These are [A-Za-z0-9]+ rules/)) { claimed = substr(L, RSTART + 10, RLENGTH - 16); claimln = ln }
	if (L ~ /^## /) {
		inhead = 0; inrule = 0; inwhy = 0; sec3 = ""; inchoices = 0
		incore = (L ~ /^## The model[ \t]*$/); if (incore) havecore = 1
		inwhysec = (L ~ /^## Why each rule is here/)
		inlimits = (L ~ /^## Honest limits/); if (inlimits) haslimits = 1
		inparts = (L ~ /^## Why each other part is here/); if (inparts) { hasparts = 1; ptrow = 0 }
		quotes(L, ln); return
	}
	if (L ~ /^### Rule/) red("R5", "the heading at model L" ln " begins \"### Rule\" but has no number the checker can read")
	if (inwhysec && L ~ /^### Why Rule [0-9]+ /) {
		inrule = 0; inwhy = 1; rn = L; sub(/^### Why Rule /, "", rn); sub(/[^0-9].*$/, "", rn)
		curwhy = rn; whycount[rn]++; if (!(rn in whyln)) whyln[rn] = ln
		return
	}
	if (L ~ /^###? /) { inrule = 0; inwhy = 0; sec3 = L; inchoices = (incore && L ~ /^### Choices/); chrow = 0; return }
	if (inhead) {
		if (L ~ /^- \*\*Owner:\*\*/) { nowner++; v = L; sub(/^- \*\*Owner:\*\*/, "", v); if (placeholder(v)) ownerph = 1 }
		if (L ~ /^- \*\*Licen[cs]e[:]\*\*/) { headlic = (index(L, "CC BY 4.0") && index(L, "GPL-3.0-or-later")) ? 1 : -1; licline = L }
	}
	if (inrule) {
		if (L ~ /^- \*\*[A-Za-z ]+:\*\*/) {
			t = L; sub(/^- \*\*/, "", t); sub(/:\*\*.*$/, "", t)
			v = L; sub(/^- \*\*[A-Za-z ]+:\*\*/, "", v)
			if (!((cur, t) in fld)) { fld[cur, t] = trim(v); fldln[cur, t] = ln }
			nfields[cur]++
		} else if (!(cur in nfields)) hasbody[cur] = 1
	}
	if (inwhy && L ~ /^- \*\*[A-Za-z ]+:\*\*/) {
		t = L; sub(/^- \*\*/, "", t); sub(/:\*\*.*$/, "", t)
		v = L; sub(/^- \*\*[A-Za-z ]+:\*\*/, "", v)
		if (!((curwhy, t) in wfld)) { wfld[curwhy, t] = trim(v); wfldln[curwhy, t] = ln }
	}
	if (inchoices && L ~ /^\|/) {
		chrow++; n = cells(L, c)
		if (chrow > 2) {
			if (n < 6) red("D1", "choices row at model L" ln " has fewer than four cells")
			else if (placeholder(c[3]) || placeholder(c[4]) || placeholder(c[5])) red("D1", "choices row at model L" ln " leaves its default, other choice or change-it-if empty")
		}
	}
	if (inparts && L ~ /^\|/) {
		ptrow++; n = cells(L, c)
		if (ptrow > 2) { v = (n >= 2) ? c[n - 1] : ""; if (n < 5 || placeholder(v)) red("P1", "part row at model L" ln " says nothing under Drop it if") }
	}
	if (inlimits && L ~ /^[0-9]+\. /) {
		nlimits++; t = norm(L)
		i = index(t, "Shown wrong if:")
		if (i == 0) red("L1", "honest limit at model L" ln " has no \"Shown wrong if:\"")
		else { v = substr(t, i + 15); sub(/^[* \t]+/, "", v); if (placeholder(v)) red("L1", "honest limit at model L" ln " names no condition under Shown wrong if") }
	}
	if (L ~ /^- BASE L[0-9]/) {
		if (sec3 ~ /^### Kept/) item(L, ln, "kept")
		else if (sec3 ~ /^### Left out, and why/) item(L, ln, "left")
	}
	quotes(L, ln)
}

function item(L, ln, kind,   pre, n, i, parts, rest) {
	nitems++; ikind[nitems] = kind; iln[nitems] = ln; irefs[nitems] = ""
	match(L, /^- BASE L[0-9]+(-[0-9]+)?(, *L[0-9]+(-[0-9]+)?)*/)
	pre = substr(L, 8, RLENGTH - 7)
	n = split(pre, parts, ", *")
	for (i = 1; i <= n; i++) addrange(parts[i], ln, kind, nitems, "")
	if (kind == "left" && !match(L, /why: *[^ ]/)) red("B2", "Left-out item at model L" ln " gives no reason (why:)")
	if (kind == "kept") {
		if (!match(L, /in: *[^ ]/)) red("B2", "Kept item at model L" ln " says not where it went (in:)")
		else { rest = substr(L, RSTART); irefs[nitems] = refs(rest) }
	}
}

function addrange(tok, ln, kind, it, rule,   a, b) {
	sub(/^L/, "", tok)
	if (index(tok, "-")) { a = substr(tok, 1, index(tok, "-") - 1) + 0; b = substr(tok, index(tok, "-") + 1) + 0 }
	else { a = tok + 0; b = a }
	nr++; ra[nr] = a; rb[nr] = b; rln[nr] = ln; rk[nr] = kind; ri[nr] = it; rr[nr] = rule
}

function quotes(L, ln,   rest, q, m, a, b, span, i, x, nmark, nmatch, off, found, okb, c1, cz, lb, rc) {
	rest = L; nmark = 0; nmatch = 0
	while (i = index(rest, "(org-rule L")) { nmark++; rest = substr(rest, i + 11) }
	rest = L
	while (match(rest, /"[^"]+" \(org-rule L[0-9]+(-[0-9]+)?\)/)) {
		m = substr(rest, RSTART, RLENGTH); rest = substr(rest, RSTART + RLENGTH)
		nquotes++; nmatch++
		q = m; sub(/^"/, "", q); sub(/" \(org-rule L.*$/, "", q); q = norm(q)
		x = m; sub(/^.*\(org-rule L/, "", x); sub(/\)$/, "", x)
		if (index(x, "-")) { a = substr(x, 1, index(x, "-") - 1) + 0; b = substr(x, index(x, "-") + 1) + 0 } else { a = x + 0; b = a }
		if (!readable("org-rule")) { nc("Q1", "quote at model L" ln ": the org-rule source cannot be read"); continue }
		if (a < 1 || b < a || b > orgn) { red("Q1", "quote at model L" ln " cites org-rule L" a "-" b ", outside its " orgn " lines"); continue }
		span = ""; for (i = a; i <= b; i++) span = span " " org[i]
		span = norm(span)
		off = 0; found = 0; okb = 0; c1 = substr(q, 1, 1); cz = substr(q, length(q), 1)
		while ((i = index(substr(span, off + 1), q)) > 0) {
			i += off; found = 1
			lb = (i > 1) ? substr(span, i - 1, 1) : ""; rc = substr(span, i + length(q), 1)
			if ((!isalnum(c1) || !isalnum(lb)) && (!isalnum(cz) || !isalnum(rc))) { okb = 1; break }
			off = i
		}
		if (!found) red("Q1", "quote at model L" ln " is not in org-rule L" a "-" b " word for word: \"" substr(q, 1, 48) "\"")
		else if (!okb) red("Q2", "quote at model L" ln " is cut mid-word in org-rule L" a "-" b ": \"" substr(q, 1, 48) "\"")
	}
	if (nmark > nmatch) red("Q1", "model L" ln ": " (nmark - nmatch) " org-rule marker(s) with no straight-quoted text the checker can read")
	if (L ~ /(forbids|requires|prefers):/ && nmatch == 0) red("Q3", "model L" ln " names a strength but quotes nothing: a retelling, not a quote")
}

function evidence(r, v,   n, i, id, parts, strong, ncand, key, t) {
	t = tolower(trim(v)); sub(/\.$/, "", t)
	if (t == "none yet") { nc("E5", "Rule " r ": evidence says \"none yet\"; this rule is not checked against evidence"); return }
	strong = 0; ncand = 0
	n = split(v, parts, "[;,]")
	for (i = 1; i <= n; i++) {
		id = trim(parts[i]); if (id == "") continue
		nids++
		if (id ~ /^R2S-[0-9][0-9][0-9]$/) {
			if (!readable("score")) { nc("E2", "Rule " r ": " id " not resolved, the score cannot be read"); ncand++; continue }
			if (id in r2s) { strong++; nstrong++ } else red("E2", "Rule " r ": " id " is not a section of the score")
		} else if (id ~ /^R3S-[0-9][0-9][0-9]$/) {
			if (!readable("score3")) { nc("E2", "Rule " r ": " id " not resolved, the row-3 score cannot be read"); ncand++; continue }
			if (id in r3s) { strong++; nstrong++ } else red("E2", "Rule " r ": " id " is not a section of the row-3 score")
		} else if (id ~ /^paper:[FSWOT][0-9]+$/ || id ~ /^paper:sec[0-9]+[a-z]?$/) {
			key = substr(id, 7)
			if (!readable("paper")) { nc("E2", "Rule " r ": " id " not resolved, the paper cannot be read"); ncand++; continue }
			if (!(key in pid)) { red("E2", "Rule " r ": " id " is not an item or section of the paper"); continue }
			if (key ~ /^[WTO]/ || (key ~ /^F/ && pfnot[key])) nweak++
			else { strong++; nstrong++ }
		} else if (id ~ /^row1:[A-Z]+-?[0-9]+$/) {
			key = substr(id, 6)
			if (key in conc) {
				if (conc[key] ~ /ask-keeper/) { nask++; note("E4", "Rule " r ": " id " is a question both readers sent to the keeper; it is not counted as evidence that the rule holds") }
				else { strong++; nstrong++ }
			} else if ((key in cont) || (key in nidea)) { nweak++ }
			else if (!readable("row1-conclusive") || !readable("row1-contested") || !readable("new-ideas")) {
				nc("E2", "Rule " r ": " id " not resolved, a row1 table cannot be read"); ncand++
			} else red("E2", "Rule " r ": " id " is in none of the row1 tables")
		} else red("E1", "Rule " r ": evidence id \"" substr(id, 1, 40) "\" has no known form")
	}
	if (strong == 0) {
		if (ncand > 0) nc("E3", "Rule " r ": no holding evidence could be confirmed (sources unreadable)")
		else red("E3", "Rule " r " rests only on needs, proposals, contested, listed or open (ask-keeper) evidence")
	}
}

function checkfield(r, v,   p, q, first, step, rc, ncc) {
	v = norm(v)
	if (v ~ /^`/) red("R3", "Rule " r ": the Check begins with code; put the by-hand way first")
	p = labelpos(v, "RED:"); q = index(v, "NOT CHECKED:")
	if (p == 0 || q == 0) { red("R4", "Rule " r ": the Check does not say what makes it RED: and NOT CHECKED:"); return }
	first = (p < q) ? p : q
	step = substr(v, 1, first - 1)
	if (p < q) { rc = substr(v, p + 4, q - p - 4); ncc = substr(v, q + 12) }
	else { ncc = substr(v, q + 12, p - q - 12); rc = substr(v, p + 4) }
	if (placeholder(step)) red("R4", "Rule " r ": the Check has no by-hand step before its answers")
	if (placeholder(rc)) red("R4", "Rule " r ": the Check names no condition for RED")
	if (placeholder(ncc)) red("R4", "Rule " r ": the Check names no condition for NOT CHECKED")
}

function baselinefield(r, v, ln,   rest, tok) {
	if (v ~ /^new([ .,;]|$)/) return
	if (v !~ /BASE L[0-9]/) { red("W1", "Why Rule " r ": Baseline names no BASE lines and does not say new"); return }
	rest = v
	while (match(rest, /BASE L[0-9]+(-[0-9]+)?/)) {
		tok = substr(rest, RSTART + 5, RLENGTH - 5); rest = substr(rest, RSTART + RLENGTH)
		addrange(tok, ln, "rule", 0, r)
	}
}

END {
	flush()
	if (spdx == 0) red("H3", "no SPDX-License-Identifier: CC-BY-4.0 line in the first 3 lines")
	if (nowner == 0) red("H1", "the head has no Owner line")
	else if (nowner > 1) red("H1", "the head has " nowner " Owner lines; it must have one")
	else if (ownerph) red("H1", "the head Owner line is empty or a placeholder")
	if (headlic == 0) red("H2", "the head has no Licence line"); else if (headlic < 0) red("H2", "the head Licence line does not name both CC BY 4.0 and GPL-3.0-or-later")
	rest = licline
	while (match(rest, /`[^`]+`/)) {
		nm = substr(rest, RSTART + 1, RLENGTH - 2); rest = substr(rest, RSTART + RLENGTH)
		if (nm !~ /^[A-Za-z0-9_.-]+\.[A-Za-z0-9]+$/) continue
		fn = MDIR "/" nm; got = 0; okspdx = 0
		while (got < 10 && (getline gl < fn) > 0) { got++; if (index(gl, "SPDX-License-Identifier: GPL-3.0-or-later")) okspdx = 1 }
		close(fn)
		if (got == 0) note("H5", nm " is not beside this copy; its licence line was not looked at")
		else if (!okspdx) red("H5", nm " sits beside this file without an SPDX-License-Identifier: GPL-3.0-or-later line")
	}
	if (!hasdash) foot = ""
	if (!index(foot, COPY) || !index(foot, "CC BY 4.0")) red("H4", "the foot (after the last ---) carries no copyright and CC BY 4.0 credit line")
	if (!havecore) red("C1", "no \"## The model\" section: the core is missing")
	if (nrules == 0) nc("R0", "no \"### Rule <n> \" blocks found; nothing to check")
	for (r = 1; r <= nrules; r++) {
		n = rnum[r]
		if (!hasbody[r]) red("R6", "Rule " n " (model L" rline[r] ") has no rule text before its fields")
		if (!((r, "Owner") in fld)) red("R2", "Rule " n " (model L" rline[r] ") has no Owner line")
		else if (fld[r, "Owner"] == "") red("R2", "Rule " n " Owner line is empty")
		else { v = norm(fld[r, "Owner"]); i = index(v, "source:"); if (i == 0 || placeholder(substr(v, i + 7))) red("O1", "Rule " n ": the Owner line names no source") }
		if (!((r, "Check") in fld)) red("R2", "Rule " n " (model L" rline[r] ") has no Check line")
		else if (fld[r, "Check"] == "") red("R2", "Rule " n " Check line is empty")
		else checkfield(n, fld[r, "Check"])
		if (!(n in whycount)) { red("W1", "Rule " n " has no Why block under ## Why each rule is here"); continue }
		if (whycount[n] > 1) red("W1", "Rule " n " has " whycount[n] " Why blocks; it must have one")
		if (!((n, "Evidence") in wfld) || wfld[n, "Evidence"] == "") red("W1", "Why Rule " n " has no Evidence line")
		else evidence(n, wfld[n, "Evidence"])
		if (!((n, "Baseline") in wfld) || wfld[n, "Baseline"] == "") red("W1", "Why Rule " n " has no Baseline line")
		else baselinefield(n, wfld[n, "Baseline"], wfldln[n, "Baseline"])
		if (!((n, "Drop it if") in wfld) || placeholder(wfld[n, "Drop it if"])) red("W1", "Why Rule " n " says nothing under Drop it if")
	}
	for (n in whycount) if (!(n in seenrule)) red("W1", "a Why block (model L" whyln[n] ") names Rule " n ", which does not exist")
	for (i = 1; i <= nx; i++) if (!(xn[i] in seenrule)) red("X1", "model L" xl[i] " refers to Rule " xn[i] ", which does not exist")
	if (claimed != "") { w = wordnum(claimed); if (w != nrules) red("X2", "model L" claimln " says \"These are " claimed " rules\"; there are " nrules) }
	for (j = 1; j <= 5; j++) {
		nm = lists[j]
		if (!(nm in lcount)) red("K1", "the core does not name the " nm " list")
		else if (lcount[nm] > 1) red("K1", "the core names the " nm " list " lcount[nm] " times")
		else if (lparts[nm] < 3) red("K1", "the " nm " list (model L" lln[nm] ") has fewer than three parts")
	}
	if (!haslimits) nc("L1", "no ## Honest limits section; no falsifiers to look at")
	if (!hasparts) nc("P1", "no ## Why each other part is here section; no Drop it if to look at")
	for (k = 1; k <= nitems; k++) if (ikind[k] == "kept") { nn = split(irefs[k], a, " "); for (j = 1; j <= nn; j++) if (a[j] != "" && !(a[j] in seenrule)) red("B4", "a Kept item names Rule " a[j] ", which does not exist (model L" iln[k] ")") }
	covered = 0
	if (!readable("base")) {
		if (nitems > 0 || nr > 0) nc("B1", "the base source cannot be read; the baseline accounting is not checked")
	} else {
		for (i = 1; i <= nr; i++) {
			if (ra[i] < 1 || rb[i] < ra[i] || rb[i] > basen) { red("B3", "BASE L" ra[i] "-" rb[i] " at model L" rln[i] " is outside the base file (" basen " lines)"); continue }
			for (k = ra[i]; k <= rb[i]; k++) if (k in hd) { red("B5", "BASE L" ra[i] "-" rb[i] " at model L" rln[i] " crosses the base heading or rule at L" k); break }
		}
		shown = 0
		for (j = 1; j <= nbstart; j++) {
			s = bstart[j]; hit = 0
			for (i = 1; i <= nr; i++) if (rk[i] != "rule" && ra[i] <= s && s <= rb[i]) { hit = 1; if (!((ri[i], s) in ist)) { ist[ri[i], s] = 1; icount[ri[i]]++ } }
			if (hit) covered++
			else { if (shown < 12) red("B1", "BASE L" s " is neither kept nor left out"); else nred++; shown++ }
		}
		if (shown > 12) printf "RED          B1  ... and %d more uncovered paragraph starts\n", shown - 12
		for (k = 1; k <= nitems; k++) {
			if (ikind[k] != "kept" || irefs[k] == "") continue
			delete want; nn = split(irefs[k], a, " "); for (j = 1; j <= nn; j++) if (a[j] != "") want[a[j]] = 1
			for (j = 1; j <= nbstart; j++) {
				s = bstart[j]; if (!((k, s) in ist)) continue
				ok = 0; for (i = 1; i <= nr; i++) if (rk[i] == "rule" && (rr[i] in want) && ra[i] <= s && s <= rb[i]) { ok = 1; break }
				if (!ok) { red("B6", "Kept item at model L" iln[k] " says it went into Rule" irefs[k] ", but no Baseline line of those rules covers BASE L" s); break }
			}
		}
		wmax = 0; wk = 0; for (k = 1; k <= nitems; k++) if (icount[k] > wmax) { wmax = icount[k]; wk = k }
		if (wk > 0) note("G1", "the widest item (model L" iln[wk] ", " ikind[wk] ") covers " wmax " base paragraph starts; a gauge, not a verdict")
	}
	if (nz > 12) note("Z1", "... and " (nz - 12) " more such lines")
	printf "model-check: %d rules; %d evidence ids (%d holding, %d needs, proposals, contested or listed, %d sent to the keeper); %d organization quotes; %d rule references; %d honest limits; %d of %d baseline paragraphs accounted for.\n", nrules, nids, nstrong, nweak, nask, nquotes, nx, nlimits, covered, nbstart
	if (nred > 0) { printf "In words: RED. %d problem%s found; %d thing%s not checked.\n", nred, (nred == 1 ? "" : "s"), nnc, (nnc == 1 ? "" : "s"); exit 1 }
	if (nnc > 0 || nrules == 0) { printf "In words: NOT CHECKED. Nothing failed, but %d thing%s could not be checked.\n", nnc, (nnc == 1 ? "" : "s"); exit 77 }
	printf "In words: OK. Every check above looked and passed.\n"
	exit 0
}
'

pins_text() {
	if [ -n "$PINS_FILE" ]; then tr -d '\r' < "$PINS_FILE"; else printf '%s\n' "$PINS_BUILTIN"; fi
}

check() { # <model.md>
	model=$1
	if [ ! -f "$model" ] || [ ! -r "$model" ]; then printf 'NOT CHECKED  F0  cannot read %s\n' "$model"; return 77; fi
	if [ ! -s "$model" ]; then printf 'NOT CHECKED  F0  %s is empty\n' "$model"; return 77; fi
	mdir=$(dirname "$model")
	ck=$(mkd) || { printf 'NOT CHECKED  F0  cannot make a scratch directory\n'; return 77; }
	pins_text > "$ck/pins.tsv"
	awk -v T="$TAB" '
		{ sub(/\r$/, "") }
		/^## / { insrc = ($0 ~ /^## Sources/); next }
		/^---/ { insrc = 0 }
		insrc && /^\|/ {
			n = split($0, c, "|"); if (n < 5) next
			for (i = 2; i <= 4; i++) { gsub(/^[ \t]+|[ \t]+$/, "", c[i]) }
			if (c[2] == "name" || c[2] ~ /^-+$/) next
			printf "%s%s%s%s%s\n", c[2], T, c[3], T, c[4]
		}' "$model" > "$ck/sources.raw"
	: > "$ck/sources.tsv"
	while IFS="$TAB" read -r name path want; do
		case $path in /*) p=$path ;; *) p=$mdir/$path ;; esac
		if [ -f "$p" ] && [ -r "$p" ]; then rd=1; got=$(sha_of "$p"); else rd=0; got=; fi
		pin=$(awk -F "$TAB" -v n="$name" '$1 == n { print $2; exit }' "$ck/pins.tsv")
		printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$name" "$p" "$want" "$got" "$rd" "$pin" >> "$ck/sources.tsv"
	done < "$ck/sources.raw"
	awk -v SRC="$ck/sources.tsv" -v COPY="$COPY" -v DOTV="$DOT" -v INVIS="$INVIS" -v MDIR="$mdir" "$CHECK_AWK" "$model"
	rc=$?
	rm -rf "$ck"
	case $rc in 0|1|77) return $rc ;; *) printf 'NOT CHECKED  F0  the checker itself failed (awk exit %s)\n' "$rc"; return 77 ;; esac
}

# --------------------------------------------------------------------------------------------- prove-red
fixture() { # <dir>: a small model, its eight sources and one code file; the model must check OK
	d=$1; mkdir -p "$d"
	printf '# S\n\n### R2S-001: one\ntext\n\n### R2S-002: two\n' > "$d/score.md"
	printf '# S3\n\n### R3S-001: other hands\ntext\n' > "$d/score3.md"
	printf '# P\n\n| # | Capability | Proof | Status |\n|---|---|---|---|\n| F1 | **Three answers.** | a run | SHOWN |\n| F2 | **Second.** | none | NOT YET SHOWN |\n\n**S1 %s strength one**\n\n**W1 %s weakness one**\n\n**O1 %s opening one**\n\n## 5a. Updates\n' "$DOT" "$DOT" "$DOT" > "$d/paper.md"
	printf 'id\twarp\tverdict(both)\tnote_A\tnote_B\nBA-01\tS1\tchange\ta\tb\nBA-02\tS5\task-keeper\ta\tb\n' > "$d/conc.tsv"
	printf 'id\twarp\tverdict_A\tverdict_B\tnote_A\tnote_B\nBA-03\tS1\tchange\tkeep\ta\tb\n' > "$d/cont.tsv"
	printf 'id\tidea (plain words)\twarp\tact1_receipts\nN01\tan idea\tS1\tr\n' > "$d/new.tsv"
	printf 'When assisting the user, search and\nanalyse  instead of generating code.\nWe prefer not to receive reports.\n' > "$d/org.txt"
	printf '# Fixture base\n\n**Rule one.** First line.\nMore of rule one.\n\n**Rule two.** Second.\n- an item\n' > "$d/base.md"
	printf '#!/bin/sh\n# SPDX-License-Identifier: GPL-3.0-or-later\ntrue\n' > "$d/fx-tool.sh"
	RLM=$(printf '\342\200\217'); HEB=$(printf '\327\251\327\234\327\225\327\235')
	{
		printf '<!-- SPDX-License-Identifier: CC-BY-4.0 -->\n# Fixture model\n\n'
		printf -- '- **Owner:** the fixture keeper\n- **Licence:** prose CC BY 4.0; code (`fx-tool.sh`) GPL-3.0-or-later\n\n'
		printf '## The model\n\nThese are two rules; Rules 1 and 2 are both here.\n\n'
		printf '### Rule 1 %s First\n\nBody of rule one.\n\n' "$DOT"
		printf -- '- **Owner:** a tester %s since 2026-09-30 %s source: new\n' "$DOT" "$DOT"
		printf -- '- **Check:** look at rule one by hand. RED: it is wrong. NOT CHECKED: no one looked.\n\n'
		printf 'It says: "search and analyse instead of generating code" (org-rule L1-2).\n\n'
		printf '### Rule 2 %s Second\n\nBody of rule two, also in Hebrew: %s%s (a right-to-left word with a direction mark).\n\n' "$DOT" "$HEB" "$RLM"
		printf -- '- **Owner:** another tester %s since 2026-09-30 %s source: new\n' "$DOT" "$DOT"
		printf -- '- **Check:** look at rule two by hand. RED: it is wrong.\n  NOT CHECKED: no one looked.\n\n'
		printf '### Choices\n\n| Where | Default | Other choice | Change it if |\n|---|---|---|---|\n| Rule 1 | ask | do not ask | the owner says so |\n\n'
		printf '### Example\n\n- It prefers: "We prefer not to receive reports" (org-rule L3).\n\n'
		printf '### Record\n\n```\nHEAD      owner %s licence %s who can stop\nRULES     rule %s owner %s since\nHELD      date %s kind %s where\nHANDS     date %s item %s AI\nMEETINGS  date %s words %s strength\n```\n\n' "$DOT" "$DOT" "$DOT" "$DOT" "$DOT" "$DOT" "$DOT" "$DOT" "$DOT" "$DOT"
		printf '## Why each rule is here\n\n### Why Rule 1 %s First\n\nReason one.\n\n' "$DOT"
		printf -- '- **Evidence:** R2S-001; paper:F1; row1:BA-01\n- **Baseline:** BASE L3-4\n- **Drop it if:** rule one never matters.\n\n'
		printf '### Why Rule 2 %s Second\n\nReason two.\n\n' "$DOT"
		printf -- '- **Evidence:** R3S-001; paper:S1; paper:sec5a; paper:W1; paper:O1; paper:F2; row1:BA-02;\n  row1:BA-03; row1:N01\n'
		printf -- '- **Baseline:** new\n- **Drop it if:** rule two never matters.\n\n'
		printf '## Why each other part is here\n\n| Part | Why | Drop it if |\n|---|---|---|\n| Choices | defaults beside their other way | no one changes one |\n\n'
		printf '## Honest limits\n\n1. **A limit.** It may be wrong. *Shown wrong if:* it is never wrong.\n\n'
		printf '## From the baseline\n\n### Kept\n\n'
		printf -- '- BASE L3-4 %s rule one %s in: Rule 1\n\n' "$DOT" "$DOT"
		printf '### Left out, and why\n\n'
		printf -- '- BASE L6-7 %s rule two and its item %s why: not needed in the fixture\n\n' "$DOT" "$DOT"
		printf '## Sources\n\n| name | path | sha256 |\n|---|---|---|\n'
		for pair in score:score.md score3:score3.md paper:paper.md row1-conclusive:conc.tsv row1-contested:cont.tsv new-ideas:new.tsv org-rule:org.txt base:base.md; do
			n=${pair%%:*}; f=${pair#*:}
			printf '| %s | %s | %s |\n' "$n" "$f" "$(sha_of "$d/$f")"
		done
		printf '\n---\n\nAssisted-by: a fixture.\n\n*%s 2026 a fixture keeper. Licensed CC BY 4.0.*\n' "$COPY"
	} > "$d/model.md"
}

PR_W=; caught=0; planted=0; setup=0
judge() { # <label> <want-exit> <want-tag|-|NOTE:tag> <got-exit> <output>
	ok=1
	[ "$4" -eq "$2" ] || ok=0
	case $3 in
		-) ;;
		NOTE:*) printf '%s\n' "$5" | grep -E -q "^NOTE +${3#NOTE:} " || ok=0 ;;
		*) printf '%s\n' "$5" | grep -E -q "^(RED|NOT CHECKED) +$3 " || ok=0 ;;
	esac
	planted=$((planted + 1))
	if [ "$ok" = 1 ]; then caught=$((caught + 1)); printf 'prove-red: caught  %-44s exit %s, %s\n' "$1" "$4" "$3"
	else printf 'prove-red: MISSED  %-44s exit %s (wanted %s, %s)\n' "$1" "$4" "$2" "$3"; printf '%s\n' "$5" | sed 's/^/           | /'; fi
}
plant() { # <label> <want-exit> <want-tag> <sed-script>
	rm -rf "$PR_W/m"; cp -R "$PR_W/clean" "$PR_W/m"
	sed "$4" "$PR_W/clean/model.md" > "$PR_W/m/model.md"
	if cmp -s "$PR_W/clean/model.md" "$PR_W/m/model.md"; then
		printf 'prove-red: SETUP   %-44s the plant changed nothing; not counted\n' "$1"; setup=$((setup + 1)); return
	fi
	out=$(check "$PR_W/m/model.md" 2>&1); rc=$?
	judge "$1" "$2" "$3" "$rc" "$out"
}
plant_src() { # <label> <want-exit> <want-tag> <shell action in $PR_W/m>
	rm -rf "$PR_W/m"; cp -R "$PR_W/clean" "$PR_W/m"
	( cd "$PR_W/m" && eval "$4" ) || { printf 'prove-red: SETUP   %-44s the action failed; not counted\n' "$1"; setup=$((setup + 1)); return; }
	out=$(check "$PR_W/m/model.md" 2>&1); rc=$?
	judge "$1" "$2" "$3" "$rc" "$out"
}

prove_red() {
	if [ -z "$(sha_of "$0")" ]; then printf 'NOT CHECKED  prove-red needs a sha256 tool (sha256sum, shasum or openssl)\n'; return 77; fi
	PR_W=$(mkd) || { printf 'NOT CHECKED  cannot make a scratch directory\n'; return 77; }
	printf 'prove-red: these plants are the author'"'"'s own; under Rule 5 they do not show this check able to fail.\n'
	fixture "$PR_W/clean"
	for pair in score:score.md score3:score3.md paper:paper.md row1-conclusive:conc.tsv row1-contested:cont.tsv new-ideas:new.tsv org-rule:org.txt base:base.md; do
		printf '%s\t%s\n' "${pair%%:*}" "$(sha_of "$PR_W/clean/${pair#*:}")"
	done > "$PR_W/pins.tsv"
	PINS_FILE=$PR_W/pins.tsv
	out=$(check "$PR_W/clean/model.md" 2>&1); rc=$?
	if [ "$rc" -ne 0 ] || ! printf '%s\n' "$out" | grep -q '^NOTE  *E4 ' || ! printf '%s\n' "$out" | grep -q '^NOTE  *Z1 '; then
		printf 'prove-red: the clean fixture did not check OK with its E4 and Z1 notes (exit %s); nothing else means anything\n' "$rc"
		printf '%s\n' "$out" | sed 's/^/           | /'; rm -rf "$PR_W"; return 1
	fi
	printf 'prove-red: control clean fixture (with a right-to-left word)  exit 0, with the E4 and Z1 notes\n'
	plant_src 'F1 control: CRLF copy reads OK'            0 -        'sed "s/\$/$CR/" model.md > m.tmp && mv m.tmp model.md'
	RLO=$(printf '\342\200\256'); PDF=$(printf '\342\200\254'); ZW=$(printf '\342\200\213')
	plant 'Z1 control: override in prose is a NOTE'      0 NOTE:Z1  "s/^Body of rule one[.]\$/Body of ${ZW}${RLO}rule${PDF} one./"
	plant_src 'H5 control: code file absent is a NOTE'   0 NOTE:H5  'rm -f fx-tool.sh'
	plant 'K1 control: prose line starting HEAD'         0 -        's/^Body of rule one\.$/Body of rule one, whose\
HEAD line comes first./'
	plant 'R4/L1 control: labels wrapped mid-label'      0 -        's/^  NOT CHECKED: no one looked\.$/  NOT\
  CHECKED: no one looked./
s/ \*Shown wrong if:\* it is never wrong\.$/ *Shown\
   wrong if:* it is never wrong./'

	# --- v2 plants, carried into the v3 form
	plant 'H1 head owner removed'        1 H1 '/^- \*\*Owner:\*\* the fixture keeper$/d'
	plant 'H1 head owner empty'          1 H1 's/^- \*\*Owner:\*\* the fixture keeper$/- **Owner:**/'
	plant 'H2 licence removed'           1 H2 '/^- \*\*Licence:\*\*/d'
	plant 'H2 licence without GPL'       1 H2 's/ GPL-3.0-or-later$//'
	plant 'H3 SPDX line removed'         1 H3 '1d'
	plant 'H4 foot credit line removed'  1 H4 '/2026 a fixture keeper\. Licensed CC BY 4\.0/d'
	plant 'R1 rule number twice'         1 R1 's/^### Rule 2 /### Rule 1 /'
	plant 'R2 rule 1 Check removed'      1 R2 '/^- \*\*Check:\*\* look at rule one/d'
	plant 'R2 rule 2 Owner empty'        1 R2 's/^- \*\*Owner:\*\* another tester.*$/- **Owner:**/'
	plant 'R3 Check begins with code'    1 R3 's/^- \*\*Check:\*\* look at rule one/- **Check:** `grep one` look at rule one/'
	plant 'R4 Check without its answers' 1 R4 's/^- \*\*Check:\*\* look at rule one by hand.*$/- **Check:** n\/a/'
	plant 'R4 placeholder RED condition' 1 R4 's/by hand\. RED: it is wrong\. NOT CHECKED: no one looked\./by hand. RED: n\/a. NOT CHECKED: no one looked./'
	plant 'R4 placeholder NOT CHECKED'   1 R4 's/^  NOT CHECKED: no one looked\.$/  NOT CHECKED: none./'
	plant 'R4 no by-hand step'           1 R4 's/^- \*\*Check:\*\* look at rule one by hand\. RED:/- **Check:** RED:/'
	plant 'R5 rule heading unreadable'   1 R5 's/^### Rule 2 /### Rule Two /'
	plant 'X1 reference to a missing rule' 1 X1 's/^These are two rules; Rules 1 and 2/These are two rules; Rules 1 and 9/'
	plant 'X2 rule count wrong'          1 X2 's/^These are two rules;/These are three rules;/'
	plant 'E1 malformed id'              1 E1 's/R2S-001;/R2S-1;/'
	plant 'E1 unknown paper id form'     1 E1 's/paper:F1;/paper:Z1;/'
	plant 'E2 score id not there'        1 E2 's/R2S-001;/R2S-009;/'
	plant 'E2 row1 id not there'         1 E2 's/row1:BA-01$/row1:BA-99/'
	plant 'E2 paper item not there'      1 E2 's/paper:F1;/paper:F9;/'
	plant 'E2 paper section not there'   1 E2 's/paper:sec5a;/paper:sec6;/'
	plant 'E3 only ask-keeper evidence'  1 E3 's/^- \*\*Evidence:\*\* R2S-001; paper:F1; row1:BA-01$/- **Evidence:** row1:BA-02/'
	plant 'E5 evidence none yet'         77 E5 's/^- \*\*Evidence:\*\* R2S-001; paper:F1; row1:BA-01$/- **Evidence:** none yet/'
	plant 'Q1 quote retold'              1 Q1 's/"search and analyse instead of generating code"/"search and analyze instead of writing code"/'
	plant 'Q1 right words, wrong lines'  1 Q1 's/(org-rule L1-2)/(org-rule L3)/'
	plant 'Q1 lines outside the file'    1 Q1 's/(org-rule L1-2)/(org-rule L1-9)/'
	LQ=$(printf '\342\200\234'); RQ=$(printf '\342\200\235')
	plant 'Q1 curly-quoted retelling'    1 Q1 "s/\"search and analyse instead of generating code\"/${LQ}search and analyze instead of writing code${RQ}/"
	plant 'Q2 quote cut mid-word'        1 Q2 's/"search and analyse instead of generating code"/"earch and analyse instead of generating cod"/'
	plant 'B1 left-out item removed'     1 B1 '/^- BASE L6-7 /d'
	plant 'B2 left-out without why'      1 B2 's/ why: not needed in the fixture$//'
	plant 'B2 kept without in'           1 B2 's/ in: Rule 1$//'
	plant 'B3 kept range past the end'   1 B3 's/^- BASE L3-4 /- BASE L3-40 /'
	plant 'B3 rule Baseline past the end' 1 B3 's/^- \*\*Baseline:\*\* BASE L3-4$/- **Baseline:** BASE L3-99/'
	plant 'B4 kept names a missing rule' 1 B4 's/ in: Rule 1$/ in: Rule 9/'
	plant 'B5 one range over the base'   1 B5 's/^- BASE L3-4 /- BASE L1-7 /'
	plant 'B6 blanket range credited to a rule' 1 B6 's/^- BASE L3-4 \(.*\) in: Rule 1$/- BASE L3-7 \1 in: Rule 1/'
	plant_src 'S1 the paper missing'     77 S1 'rm -f paper.md'
	plant_src 'S1 the base missing'      77 S1 'rm -f base.md'
	plant_src 'S1 the org-rule missing'  77 S1 'rm -f org.txt'
	plant_src 'S2 a source edited after citing' 1 S2 'printf "late line\n" >> score.md'
	plant_src 'S3 forged org copy, table re-pointed' 1 S3 'sed "s/instead of generating/instead of writing/" org.txt > forged.txt && fs=$(sha_of forged.txt) && sed -e "s/^| org-rule | org.txt | .*|\$/| org-rule | forged.txt | $fs |/" -e "s/analyse instead of generating code\"/analyse instead of writing code\"/" model.md > m.tmp && mv m.tmp model.md'
	plant_src 'F0 model empty'           77 F0 ': > model.md'
	plant_src 'F0 model missing'         77 F0 'rm -f model.md'
	plant 'R0 no rules at all'           77 R0 '/^These are two rules/d
/^### Rule 1 /,/^### Choices/{
/^### Choices/!d
}
/^## Why each rule is here/,/^## Why each other part/{
/^## Why each other part/!d
}
s/^| Rule 1 | ask/| Nothing | ask/
s/ in: Rule 1$/ in: form/'

	# --- v3 plants: the consolidated form
	plant 'H1 two Owner lines'           1 H1 's/^- \*\*Owner:\*\* the fixture keeper$/- **Owner:** TBD\
- **Owner:** the fixture keeper/'
	plant 'H1 owner a placeholder'       1 H1 's/^- \*\*Owner:\*\* the fixture keeper$/- **Owner:** TBD/'
	plant_src 'H5 code file without SPDX' 1 H5 'sed "/SPDX/d" fx-tool.sh > t && mv t fx-tool.sh'
	plant 'C1 evidence id in the core'   1 C1 's/^Body of rule one\.$/Body of rule one (R2S-001)./'
	plant 'C1 baseline ref in the core'  1 C1 's/^Body of rule one\.$/Body of rule one (BASE L3-4)./'
	plant 'C1 no core heading'           1 C1 's/^## The model$/## Model/'
	plant 'R6 rule with no text'         1 R6 '/^Body of rule one\.$/d'
	plant 'R7 a rule outside the core'   1 R7 's/^### Why Rule 2 /### Rule 3 · stray\
\
Text.\
\
- **Owner:** x · source: new\
- **Check:** look. RED: bad. NOT CHECKED: none looked.\
\
### Why Rule 2 /'
	plant 'O1 owner names no source'     1 O1 's/^- \*\*Owner:\*\* a tester \(.*\) source: new$/- **Owner:** a tester \1 source: none/'
	plant 'W1 Why block removed'         1 W1 '/^### Why Rule 1 /,/^### Why Rule 2 /{
/^### Why Rule 2 /!d
}'
	plant 'W1 Why block twice'           1 W1 's/^### Why Rule 2 /### Why Rule 1 /'
	plant 'W1 Why for a missing rule'    1 W1 's/^## Why each other part is here$/### Why Rule 5 · stray\
\
Stray.\
\
- **Evidence:** R2S-001\
- **Baseline:** new\
- **Drop it if:** never needed.\
\
## Why each other part is here/'
	plant 'W1 Drop it if empty'          1 W1 's/^- \*\*Drop it if:\*\* rule one never matters\.$/- **Drop it if:** n\/a/'
	plant 'W1 Evidence removed'          1 W1 '/^- \*\*Evidence:\*\* R2S-001; paper:F1/d'
	plant 'W1 Baseline neither BASE/new' 1 W1 's/^- \*\*Baseline:\*\* new$/- **Baseline:** see above/'
	plant 'E1 row-3 id malformed'        1 E1 's/R3S-001;/R3S-01;/'
	plant 'E2 row-3 id not there'        1 E2 's/R3S-001;/R3S-004;/'
	plant 'E3 only needs and proposals'  1 E3 's/^- \*\*Evidence:\*\* R2S-001; paper:F1; row1:BA-01$/- **Evidence:** paper:W1; paper:O1; paper:F2/'
	plant 'D1 choices row emptied'       1 D1 's/^| Rule 1 | ask | do not ask | the owner says so |$/| Rule 1 | ask | | |/'
	plant 'K1 a list missing'            1 K1 '/^HELD /d'
	plant 'K1 a list twice'              1 K1 's/^HANDS /HEAD /'
	plant 'K1 a list with one part'      1 K1 's/^MEETINGS .*$/MEETINGS  date/'
	plant 'L1 limit without falsifier'   1 L1 's/ \*Shown wrong if:\* it is never wrong\.$//'
	plant 'L1 limits section removed'    77 L1 '/^## Honest limits$/,/^## From the baseline$/{
/^## From the baseline$/!d
}'
	plant 'P1 part without Drop it if'   1 P1 's/| no one changes one |$/| |/'
	plant 'Q3 strength retold, no quote' 1 Q3 's/^- It prefers: .*$/- It prefers: no bug reports from AI at all./'

	rm -rf "$PR_W"
	printf 'prove-red: caught %d of %d (the author'"'"'s own plants and controls); %d plant%s did not apply.\n' "$caught" "$planted" "$setup" "$( [ "$setup" -eq 1 ] && echo '' || echo s)"
	[ "$caught" -eq "$planted" ] && [ "$setup" -eq 0 ] && return 0
	return 1
}

# ------------------------------------------------------------------------------------------------- main
while [ $# -gt 0 ]; do
	case $1 in
		--pins) [ $# -ge 2 ] && [ -r "$2" ] || { usage; printf 'NOT CHECKED  usage: --pins needs a readable file\n'; exit 77; }
			PINS_FILE=$2; shift 2 ;;
		*) break ;;
	esac
done
case ${1:-} in
	--prove-red) prove_red; exit $? ;;
	--help|-h) usage; exit 0 ;;
	check) shift; [ $# -eq 1 ] || { usage; printf 'NOT CHECKED  usage\n'; exit 77; }; check "$1"; exit $? ;;
	'') usage; printf 'NOT CHECKED  usage: no model file given\n'; exit 77 ;;
	*) [ $# -eq 1 ] || { usage; printf 'NOT CHECKED  usage\n'; exit 77; }; check "$1"; exit $? ;;
esac
