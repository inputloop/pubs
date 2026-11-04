#!/bin/sh
# c4qa -- repeatable C4 introspection analysis over q/C4/ (C4QA), selected by C4QS.
#              v0 of his spec (verbatim: q/C4/c4qa-selector): selects q/C4/<NAME-or-INDEX>
#              by the effective i/s pair, C4_I defaulting '' and scalar defaulting ALL.
#              ALL is virtualized circular v0: the union of INDEXED and STRING entries,
#              unusual names (prefixed/suffixed/dotted) TOLERATED, seen to exist, then
#              used. Constraint guards (run-level -> indexed-only; named -> string-only;
#              dual register invocations -> both) are STUBBED BY NAME below, minted when
#              a guard first arrives. Born 2026-08-08.
#
# Copyright 2026 Corwin Brust <corwin@bru.st> -- GPLv3-or-later. Staged toward bin/.
#   MUST     selection resolves only to entries that exist (seen, then used); a missing
#            selector is CANT-SEE and exit 1, never an invented path.
#   JOURNEY  mode set (list|cat|templates|apply), the v0 i-filter approximation, and the
#            delegate seam (h/c4qa.d/<ext>.delegate, graduating to register space at ON).
#            Mine; rule to change.
#
# usage: [C4QS=NAME-or-INDEX|ALL] [C4_I=idx] [C4QA_Q=dir] sh h/c4qa.sh [MODE] [-- CMD..]
#        MODE: list (paths+class) | cat (default) | templates | apply -- CMD (per entry)

set -eu
R=$(cd "$(dirname "$0")/.." && pwd)
cd "$R"
Q="${C4QA_Q:-$R/q/C4}"
S="${C4QS:-${C4_S:-ALL}}"
I="${C4_I:-}"
MODE="${1:-cat}"
test -d "$Q" || { printf 'CANT-SEE\t%s\n' "$Q" >&2; exit 1; }

# --- selection -----------------------------------------------------------------
# TODO(guards, stubbed by name): RUNL-GUARD -> indexed-only · NAME-GUARD -> string-only
# · DUAL-GUARD (two of the nine less-changing registers) -> both. v0 = no guard = both.
entries() {
	for e in "$Q"/* "$Q"/.[!.]*; do
		test -e "$e" || continue	# tolerate-and-verify: unmatched globs drop here
		printf '%s\n' "$e"
	done | sort
}

class() {	# INDEXED when the basename leads with digits, else STRING
	case "$(basename "$1")" in
		[0-9]*)	printf 'INDEXED' ;;
		*)	printf 'STRING' ;;
	esac
}

base_select() {
	if test "ALL" = "$S"; then
		entries
	elif test -e "$Q/$S"; then
		printf '%s\n' "$Q/$S"
	else
		# prefix/suffix tolerance: unusual-looking names are real names
		m=$(entries | while read -r e; do
			case "$(basename "$e")" in *"$S"*) printf '%s\n' "$e";; esac
		done)
		test -n "$m" || { printf 'CANT-SEE\t%s in %s\n' "$S" "$Q" >&2; return 1; }
		printf '%s\n' "$m" | while read -r e; do
			test -n "$e" || continue
			printf 'RESOLVED\t%s\t%s\n' "$S" "$e" >&2; printf '%s\n' "$e"
		done
	fi
}

selected() {	# capture first so a CANT-SEE truly fails the run (no exit-in-pipe leak)
	raw=$(base_select) || return 1
	printf '%s\n' "$raw" | while read -r e; do	# v0 i-filter: leading-index match
		test -n "$e" || continue
		if test -z "$I"; then printf '%s\n' "$e"; else
			case "$(basename "$e")" in "$I"*) printf '%s\n' "$e";; *) ;; esac
		fi
	done
}

# --- extraction: delegate by register, Emacs when the case is org and Emacs is here ---
emit() {	# cat one entry, org going through the delegate seam
	f=$1
	case "$f" in
	*.org)
		if test -x "h/c4qa.d/org.delegate"; then
			"h/c4qa.d/org.delegate" "$f"
		elif command -v emacs >/dev/null 2>&1; then
			emacs --batch -Q "$f" --eval \
			  "(progn (require 'org)(org-mode)(princ (buffer-substring-no-properties (point-min)(point-max))))" \
			  2>/dev/null || cat "$f"
		else
			cat "$f"
		fi ;;
	*)	cat "$f" ;;
	esac
}

templates() {	# headline + properties drawer kept; body becomes one prompt line
	awk '
	/^\*+ /		{ if (open) print "…"; print; open=0; next }
	/^:PROPERTIES:/	{ print; drawer=1; next }
	/^:END:/	{ print; drawer=0; open=1; next }
	drawer		{ print; next }
	/^#/		{ if (!open) print; next }
			{ next }
	END		{ if (open) print "…" }
	' "$1"
}

SEL=$(selected) || exit 1

case "$MODE" in
list)	printf '%s\n' "$SEL" | while read -r e; do
		test -n "$e" || continue
		printf '%s\t%s\n' "$(class "$e")" "$e"
	done ;;
cat)	printf '%s\n' "$SEL" | while read -r e; do
		test -n "$e" || continue
		printf '=== %s (%s) ===\n' "$(basename "$e")" "$(class "$e")"
		emit "$e"
	done ;;
templates)
	printf '%s\n' "$SEL" | while read -r e; do
		test -n "$e" || continue
		case "$e" in
		*.org)	templates "$e" ;;
		*)	sed -n '/^#/p' "$e"; printf '…\n' ;;
		esac
	done ;;
apply)	shift; test "${1:-}" = "--" && shift
	test $# -gt 0 || { printf 'USAGE\tapply -- CMD\n' >&2; exit 2; }
	printf '%s\n' "$SEL" | while read -r e; do
		test -n "$e" || continue
		"$@" "$e"
	done ;;
*)	printf 'USAGE\tlist|cat|templates|apply -- CMD\n' >&2; exit 2 ;;
esac
