#!/bin/sh
# ring-dry-run.sh -- DRY RUN of "every rule carries its ring" over the door parts.
# Reads d/door/*.part (headers untouched) and a sidecar door-rings.tsv (ID, RING, SPLIT, EVIDENCE).
# Never writes a part. Needs only POSIX sh, awk, grep, sed. Mentat for Corwin, 2026-09-27, DRAFT.
#
#   sh ring-dry-run.sh check    [DOOR_DIR] [SIDECAR]   every part has one legal ring; evidence is really in the part
#   sh ring-dry-run.sh count    [DOOR_DIR] [SIDECAR]   how many parts each ring would see in full, and as offers
#   sh ring-dry-run.sh plan RING [DOOR_DIR] [SIDECAR]  what a door rendered for RING would carry (full / offer)
#   sh ring-dry-run.sh crosstab [DOOR_DIR] [SIDECAR]   place (existing `scope` header) against ring
#   sh ring-dry-run.sh suspects [DOOR_DIR] [SIDECAR]   parts with floor-shaped words but no floor split declared
#   sh ring-dry-run.sh --prove-red [DOOR_DIR] [SIDECAR] the check goes red on a missing row and on false evidence
#
# Rings: one (a single operator's own wires) | team (more operators, audience = the room) |
#        org (performs for people outside the room) | wiring (points or routes; binds nobody).
# A part missing from the sidecar is UNDECLARED: it renders as `one` (the narrowest ring: it stays where it
# was written) and `check` exits 1 so the builder is nagged. Undeclared never widens a rule.
# SPLIT names a floor clause; after the split it becomes its own part that renders in every ring.

here=$(cd "$(dirname "$0")" && pwd)
mode=${1:-check}; [ $# -gt 0 ] && shift
ring_arg=
[ "$mode" = plan ] && { ring_arg=${1:?plan needs a ring: one team org}; shift; }
dflt=$here/../../d/door; [ -d "$dflt" ] || dflt=$here/../../corpus/d/door   # c4/writing/rings on his disk; the snapshot here
door=${1:-$dflt}
# the register in force is d/door/RINGS.tsv (his ruling rings-D1, 2026-09-27); door-rings.tsv here is the dry run's record
dside=$door/RINGS.tsv; [ -f "$dside" ] || dside=$here/door-rings.tsv
side=${2:-$dside}

headers() {  # id <TAB> scope <TAB> owner <TAB> title <TAB> file, one line per part
  for f in "$door"/*.part; do
    awk -F'\t' -v f="$f" '/^---$/{exit} $1=="id"{i=$2} $1=="scope"{s=$2} $1=="owner"{o=$2} $1=="title"{t=$2}
      END{printf "%s\t%s\t%s\t%s\t%s\n", i, s, o, t, f}' "$f"
  done
}

joined() {  # headers joined to sidecar: id scope owner ring split title file
  headers | awk -F'\t' -v side="$side" 'BEGIN{OFS="\t"
      while ((getline l < side) > 0) { if (l ~ /^#/ || l == "") continue; split(l, a, "\t"); r[a[1]]=a[2]; sp[a[1]]=a[3] } }
    { ring = ($1 in r) ? r[$1] : "UNDECLARED"; print $1, $2, $3, ring, (($1 in sp) ? sp[$1] : "-"), $4, $5 }'
}

do_check() {
  bad=0
  n=$(ls "$door"/*.part | wc -l | tr -d ' ')
  joined > "${TMPDIR:-/tmp}/rdr.$$"
  while IFS='	' read -r id scope owner ring split title file; do
    case "$ring" in
      UNDECLARED) echo "UNDECLARED  $id  (renders as one: stays where it was written)"; bad=1; continue;;
      retired) echo "RETIRED     $id  (his call: renders as one, stays where it was written)"; continue;;
    esac
    for r in $(echo "$ring" | tr ',' ' '); do
      case "$r" in one|team|org|wiring) ;; *) echo "BAD-RING    $id  '$r'"; bad=1;; esac
    done
    ev=$(awk -F'\t' -v id="$id" '!/^#/ && $1==id {print $4}' "$side")
    grep -F -q -- "$ev" "$file" || { echo "NO-EVIDENCE $id  '$ev' is not in $(basename "$file")"; bad=1; }
    if [ "$split" != "-" ]; then
      grep -F -q -- "$split" "$file" || { echo "NO-SPLIT    $id  '$split' is not in $(basename "$file")"; bad=1; }
    fi
  done < "${TMPDIR:-/tmp}/rdr.$$"
  extra=$(awk -F'\t' '!/^#/ && NF{print $1}' "$side" | sort | uniq -d)
  [ -n "$extra" ] && { echo "DUPLICATE   $extra"; bad=1; }
  rm -f "${TMPDIR:-/tmp}/rdr.$$"
  [ $bad = 0 ] && echo "OK  $n parts, each with one declared ring and its evidence found in the part"
  return $bad
}

do_count() {
  joined | awk -F'\t' '
    { n++; if ($4=="wiring") { w++; next } if ($4=="UNDECLARED" || $4=="retired") $4="one"
      if ($5!="-") fl++
      k=split($4, a, ","); for (i=1;i<=k;i++) full[a[i]]++
      if (k>1) multi++ }
    END {
      printf "parts %d  (wiring %d, written for more than one ring %d, carrying a floor clause to split out %d)\n", n, w, multi, fl
      split("one team org", R, " ")
      for (i=1;i<=3;i++) { r=R[i]
        printf "%-5s sees in full %2d   as one-line offers %2d   in full after the split %2d\n", r, full[r], n-w-full[r], full[r]+fl }
      printf "one*  (another person\x27s own install: parts tagged one bind only the operator they name)\n"
      printf "      sees in full %2d   as one-line offers %2d   in full after the split %2d\n", multi, n-w-multi, multi+fl
    }'
}

do_plan() {
  echo "Door rendered for ring: $ring_arg"
  joined | awk -F'\t' -v R="$ring_arg" '
    $4=="wiring" { print "  WIRING  " $1 "  (rendered by place, as today)"; next }
    { ring=$4; if (ring=="UNDECLARED" || ring=="retired") ring="one"; hit=0; k=split(ring,a,","); for(i=1;i<=k;i++) if (a[i]==R) hit=1
      if (hit) print "  FULL    " $1 "  -- " $6
      else     print "  OFFER   " $1 "  (written for " ring "; electable here)"
      if ($5!="-") print "  FLOOR   split out of " $1 ": \"" $5 "\" (renders in every ring)" }'
}

do_crosstab() {
  joined | awk -F'\t' '{ k=split($2, s, ","); for(i=1;i<=k;i++) c[s[i] "\t" $4]++ ; rows[$4]=1; cols[s[1]]=1 }
    END { for (x in c) print x "\t" c[x] }' | sort | awk -F'\t' '{ printf "  place %-8s ring %-13s %2d\n", $1, $2, $3 }'
}

do_suspects() {  # floor-shaped words in a part with no floor split declared: a protective clause may be stuck in an inner ring
  joined | while IFS='	' read -r id scope owner ring split title file; do
    [ "$split" != "-" ] && continue
    hits=$(sed '1,/^---$/d' "$file" | grep -Eio 'consent|third-party|entrusted|other people|blast radius' | sort -u | tr '\n' ' ')
    [ -n "$hits" ] && echo "SUSPECT  $id  (ring $ring): $hits"
  done; return 0
}

prove_red() {
  t=${TMPDIR:-/tmp}/rdr-prove.$$; mkdir -p "$t"; ok=1
  sed '/^keeper-top-block	/d' "$side" > "$t/missing.tsv"
  sed 's/^cost-footnote	one	-	.*/cost-footnote	one	-	this phrase is in no part/' "$side" > "$t/false.tsv"
  sed 's/^cost-footnote	one	/cost-footnote	everyone	/' "$side" > "$t/badring.tsv"
  sed 's/^cost-footnote	one	/cost-footnote	retired	/' "$side" > "$t/retired.tsv"
  if sh "$0" check "$door" "$t/retired.tsv" >/dev/null 2>&1; then echo "GREEN retired: a retired row is his call, not a fault"
  else echo "FAIL  retired: a retired row went red"; ok=0; fi
  for case in missing false badring; do
    if sh "$0" check "$door" "$t/$case.tsv" >/dev/null 2>&1; then echo "FAIL  $case: check stayed green"; ok=0
    else echo "RED   $case: check refused, as it must"; fi
  done
  if sh "$0" check "$door" "$side" >/dev/null 2>&1; then echo "GREEN real sidecar"; else echo "FAIL  real sidecar is red"; ok=0; fi
  rm -rf "$t"; [ $ok = 1 ] && echo "PROVE-RED 5/5" || { echo "PROVE-RED failed"; return 1; }
}

case "$mode" in
  check) do_check;; count) do_count;; plan) do_plan;; crosstab) do_crosstab;;
  suspects) do_suspects;;
  --prove-red) prove_red;;
  -h|--help) sed -n '2,20p' "$0";;
  *) echo "unknown mode: $mode (check | count | plan RING | crosstab | --prove-red)" >&2; exit 2;;
esac
