#!/bin/sh
# lens-rerun-probe.sh -- does lens.py keep a rerun, or does a second reading by the same
# model replace the first? Read-only toward the skill: works in a throwaway directory.
# Usage: sh lens-rerun-probe.sh /path/to/vibrobeast/skills/lens/scripts/lens.py
# Expected today (vibrobeast 0.8.55): case 1 prints CONVERGE although sonnet-5 disagreed
# with itself; case 2 (one label per rerun) prints DIVERGE. Exit 0 always; it reports.
# Authored by Mentat (for Corwin), 2026-09-27. DRAFT -- unsigned.
set -eu
LENS=${1:?give the path to lens.py}
W=$(mktemp -d)
trap 'rm -rf "$W"' EXIT
echo "subject text" > "$W/subj.txt"
L() { tag=$1; shift; python3 "$LENS" --subjects "$W/$tag.s" --lens "$W/$tag.l" --receipts "$W/$tag.r" "$@"; }
echo "lens.py sha256: $(sha256sum "$LENS" | cut -c1-64)"
echo "== case 1: same model label, two runs that disagree (A then B), then a second model says B"
L c1 pin "$W/subj.txt" --id S1 --title probe >/dev/null
L c1 add --subject S1 --model sonnet-5 --view a_self --stance A --claim "option A" >/dev/null
L c1 add --subject S1 --model sonnet-5 --view a_self --stance B --claim "option B" >/dev/null
L c1 add --subject S1 --model opus     --view a_self --stance B --claim "option B" >/dev/null
echo "rows kept in lens.tsv (header excluded): $(grep -vc '^#' "$W/c1.l")"
echo "receipt actions: $(grep -o 'action=[a-z]*' "$W/c1.r" | tr '\n' ' ')"
L c1 converge --subject S1 | grep '(a) my own view'
echo "== case 2: one label per rerun (sonnet-5#1, sonnet-5#2), same readings"
L c2 pin "$W/subj.txt" --id S1 --title probe >/dev/null
L c2 add --subject S1 --model 'sonnet-5#1' --view a_self --stance A --claim "option A" >/dev/null
L c2 add --subject S1 --model 'sonnet-5#2' --view a_self --stance B --claim "option B" >/dev/null
L c2 add --subject S1 --model opus         --view a_self --stance B --claim "option B" >/dev/null
L c2 converge --subject S1 | grep '(a) my own view'
