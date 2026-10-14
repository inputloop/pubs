#!/bin/sh
# stile-test.sh -- the stile server's contract (DESIGN-2026-09-28-stile-server.md §3, S1-S17),
# tested from the prose, in POSIX sh + awk: not the language under test (Emacs Lisp).
#
# usage: sh stile-test.sh              run every case against the server
#        sh stile-test.sh --prove-red  run the suite once per planted fault; each plant must turn
#                                      its named cases RED, and the unplanted control must be green
#        STILE_NODELETE=1 TMPDIR=DIR   DIR forbids deleting: adds the lock-file plant (T36/T37)
# env:   STILE_EMACS  the emacs to use (default: emacs)
# Exit: 0 all pass · 1 a case failed (or prove-red failed) · 2 cannot run (no emacs / sha256sum)
# SPDX-License-Identifier: GPL-3.0-or-later
set -u
here=$(cd "$(dirname "$0")" && pwd)
EMACS=${STILE_EMACS:-emacs}
command -v "$EMACS" >/dev/null 2>&1 || { echo "CANNOT: no $EMACS"; exit 2; }
command -v sha256sum >/dev/null 2>&1 || { echo "CANNOT: no sha256sum"; exit 2; }
M='"_meta":{"io.modelcontextprotocol/protocolVersion":"2026-07-28"}'

# serve ROOT < requests > replies : one run of the server, stdin to stdout, exit status kept
serve() {
  if [ -n "${C4_STILE_PLANT:-}" ]; then   # a planted fault, from outside the server (stile-plants.el)
    "$EMACS" --batch -Q -l "$here/c4-stile-mcp.el" -l "$here/stile-plants.el" -f c4-stile-main "$1" 2>"$T/stderr"
  else
    "$EMACS" --batch -Q -l "$here/c4-stile-mcp.el" -f c4-stile-main "$1" 2>"$T/stderr"
  fi
}

fixture() {  # a ROOT with three pieces, a manifest, and the joined file's hash
  R=$T/root; rm -rf "$R"; mkdir -p "$R/parts"
  printf 'first piece of the stile\n' > "$R/parts/p.00"
  printf 'second piece, over the fence\n' > "$R/parts/p.01"
  printf 'third piece; a lamé dog, helped over\n' > "$R/parts/p.02"
  cat "$R/parts/p.00" "$R/parts/p.01" "$R/parts/p.02" > "$T/whole.expected"
  W=$(sha256sum < "$T/whole.expected" | cut -c1-64); B=$(wc -c < "$T/whole.expected" | tr -d ' ')
  ( cd "$R/parts" && { echo "# whole $W $B"; sha256sum p.00 p.01 p.02; } > MANIFEST.sha256 )
}

pass=0; fail=0; failed=""
ok()  { pass=$((pass+1)); }
bad() { fail=$((fail+1)); failed="$failed $1"; echo "  RED  $1 ($2)"; }
# has CASE RULE FILE PATTERN : the replies contain PATTERN (a fixed string)
has() { if grep -qF -- "$4" "$3"; then ok; else bad "$1" "$2: no \`$4\`"; fi; }
hasnt() { if grep -qF -- "$4" "$3"; then bad "$1" "$2: unexpected \`$4\`"; else ok; fi; }

suite() {
  pass=0; fail=0; failed=""
  T=$(mktemp -d); fixture; out=$T/out
  call() { printf '{"jsonrpc":"2.0","id":%s,"method":"tools/call","params":{%s,"name":"%s","arguments":%s}}\n' "$1" "$M" "$2" "$3"; }

  # --- one modern run with most requests, so S1/S2/S4 are read over a real conversation
  {
    printf '{"jsonrpc":"2.0","id":1,"method":"server/discover","params":{%s}}\n' "$M"
    printf '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{%s}}\n' "$M"
    printf '{"jsonrpc":"2.0","method":"notifications/cancelled","params":{"requestId":99}}\n'
    printf '{"jsonrpc":"2.0","id":3,"method":"ping","params":{%s}}\n' "$M"
    printf 'this line is not json\n'
    printf '{"jsonrpc":"2.0","id":4,"method":"no/such","params":{%s}}\n' "$M"
    printf '{"jsonrpc":"2.0","id":5,"method":"tools/list","params":{"_meta":{"io.modelcontextprotocol/protocolVersion":"1900-01-01"}}}\n'
    printf '{"jsonrpc":"2.0","id":6,"method":"tools/list","params":{}}\n'
    call 7 stile_hash '{"path":"parts/p.01"}'
    call 8 stile_check '{"manifest":"parts/MANIFEST.sha256"}'
    call 9 stile_hash '{"path":"../outside"}'
    call 10 stile_hash "{\"path\":\"$T/whole.expected\"}"
  } | serve "$R" > "$out"; rc=$?

  # S1: every stdout line is one JSON-RPC message, nothing else
  awk '!/^\{"jsonrpc":"2\.0",.*\}$/ {bad=1} END {exit bad}' "$out" && ok || bad T01 "S1 a stdout line is not a JSON-RPC message"
  # S2: 12 lines in, 1 notification, so 11 replies (the non-JSON line still gets one)
  n=$(wc -l < "$out" | tr -d ' '); [ "$n" = 11 ] && ok || bad T02 "S2 expected 11 replies, got $n"
  # S4
  [ "$rc" = 0 ] && ok || bad T03 "S4 exit status $rc"
  has T04 S5 "$out" '"supportedVersions":["2026-07-28","2025-11-25"]'
  has T05 S5 "$out" '"io.modelcontextprotocol/serverInfo"'
  has T06 S5 "$out" '"resultType":"complete"'
  grep -F '"id":2,' "$out" | grep -q '"name":"stile_hash".*"name":"stile_check".*"name":"stile_assemble"' && ok || bad T07 "S9 three tools, in order"
  grep -F '"id":2,' "$out" | grep -q '"inputSchema":{"type":"object"' && ok || bad T08 "S9 inputSchema type object"
  has T09 S10 "$out" '{"jsonrpc":"2.0","id":3,"result":{'
  has T10 S3 "$out" '{"jsonrpc":"2.0","id":null,"error":{"code":-32700'
  has T11 S3 "$out" '{"jsonrpc":"2.0","id":4,"error":{"code":-32601'
  grep -F '"id":5,' "$out" | grep -q '"code":-32022.*"requested":"1900-01-01"' && ok || bad T12 "S6 -32022 with requested"
  grep -F '"id":5,' "$out" | grep -q '"supported":\["2026-07-28","2025-11-25"\]' && ok || bad T13 "S6 data.supported"
  grep -F '"id":6,' "$out" | grep -q '"code":-32602.*2026-07-28' && ok || bad T14 "S8 no version, no initialize"
  h=$(sha256sum < "$R/parts/p.01" | cut -c1-64); sz=$(wc -c < "$R/parts/p.01" | tr -d ' ')
  grep -F '"id":7,' "$out" | grep -qF "\"sha256\":\"$h\"" && ok || bad T15 "S14 hash matches sha256sum"
  grep -F '"id":7,' "$out" | grep -qF "\"bytes\":$sz" && ok || bad T16 "S14 size"
  grep -F '"id":7,' "$out" | grep -qF '"structuredContent":' && ok || bad T17 "S17 structuredContent"
  grep -F '"id":8,' "$out" | grep -qF '"ready":true' && ok || bad T18 "S15 all OK -> ready"
  grep -F '"id":9,' "$out" | grep -qF '"isError":true' && grep -F '"id":9,' "$out" | grep -qF 'outside the root' && ok || bad T19 "S11 .. refused as outside the root"
  grep -F '"id":10,' "$out" | grep -qF '"isError":true' && ok || bad T20 "S11 absolute refused"

  # --- the legacy era (S7): initialize, then no _meta
  {
    printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-11-25","capabilities":{},"clientInfo":{"name":"t","version":"0"}}}\n'
    printf '{"jsonrpc":"2.0","method":"notifications/initialized"}\n'
    printf '{"jsonrpc":"2.0","id":2,"method":"tools/list"}\n'
  } | serve "$R" > "$T/legacy"
  has T21 S7 "$T/legacy" '"protocolVersion":"2025-11-25"'
  grep -F '"id":2,' "$T/legacy" | grep -qF '"name":"stile_hash"' && ok || bad T22 "S7 served after initialize"
  n=$(wc -l < "$T/legacy" | tr -d ' '); [ "$n" = 2 ] && ok || bad T23 "S2 legacy: 2 replies, got $n"

  # --- tampering and absence (S15), refusal (S16)
  cp "$R/parts/p.01" "$T/p01.keep"; printf 'X' >> "$R/parts/p.01"; mv "$R/parts/p.02" "$T/p02.keep"
  { call 1 stile_check '{"manifest":"parts/MANIFEST.sha256"}'
    call 2 stile_assemble '{"manifest":"parts/MANIFEST.sha256","target":"joined.bin"}'; } | serve "$R" > "$T/tamper"
  grep -F '"id":1,' "$T/tamper" | grep -qF '"MISMATCH"' && ok || bad T24 "S15 MISMATCH"
  grep -F '"id":1,' "$T/tamper" | grep -qF '"MISSING"' && ok || bad T25 "S15 MISSING"
  grep -F '"id":1,' "$T/tamper" | grep -qF '"ready":false' && ok || bad T26 "S15 not ready"
  grep -F '"id":2,' "$T/tamper" | grep -qF '"isError":true' && ok || bad T27 "S16 refuses when not ready"
  [ -e "$R/joined.bin" ] && bad T28 "S16 wrote a target while refusing" || ok
  cp "$T/p01.keep" "$R/parts/p.01"; mv "$T/p02.keep" "$R/parts/p.02"

  # --- the good carry (S16), then the never-overwrite (S16)
  call 1 stile_assemble '{"manifest":"parts/MANIFEST.sha256","target":"joined.bin"}' | serve "$R" > "$T/asm"
  cmp -s "$R/joined.bin" "$T/whole.expected" && ok || bad T29 "S16 joined file equals the pieces"
  grep -qF '"whole":"MATCH"' "$T/asm" && ok || bad T30 "S16 whole hash reported as matching"
  ls -A "$R" | grep -v -e '^parts$' -e '^joined.bin$' -e '^\.#' >/dev/null && bad T31 "S16 a temporary file was left behind" || ok
  call 1 stile_assemble '{"manifest":"parts/MANIFEST.sha256","target":"second.bin"}' | serve "$R" > "$T/asm2"
  printf 'someone else was here\n' > "$R/other.bin"
  call 1 stile_assemble '{"manifest":"parts/MANIFEST.sha256","target":"other.bin"}' | serve "$R" > "$T/over"
  grep -qF '"isError":true' "$T/over" && ok || bad T32 "S16 refuses to overwrite"
  grep -qx 'someone else was here' "$R/other.bin" && ok || bad T33 "S16 the other file is untouched"

  # --- S18: a reply arrives while stdin is still open (the server is asked once, then kept waiting)
  { printf '{"jsonrpc":"2.0","id":1,"method":"ping","params":{%s}}\n' "$M"; sleep 6; } | serve "$R" > "$T/live" &
  sleep 4; grep -qF '"id":1,' "$T/live" && ok || bad T35 "S18 reply not visible before stdin closed"
  wait

  # S12: joining left no Emacs lock file, and Emacs never tried to unlock (a delete) on the way
  ls -A "$R" | grep -q '^\.#' && bad T36 "S12 a lock file was left behind" || ok
  grep -q 'Unlocking file' "$T/stderr" && bad T37 "S12 Emacs tried to delete a lock file" || ok

  # --- the source, read (S12, S13)
  grep -nE '\((delete-file|delete-directory|open-network-stream|make-network-process|url-retrieve|url-copy-file|call-process|start-process|make-process)[ )]' "$here/c4-stile-mcp.el" >/dev/null \
    && bad T34 "S12/S13 a delete, process or network call in the source" || ok

  rm -rf "$T" 2>/dev/null   # on a no-delete folder this leaves the fixture behind, harmlessly
  echo "stile-test: $pass passed, $fail failed${failed:+ --}$failed"
  [ "$fail" = 0 ]
}

# Each plant is a fault stile-plants.el puts into the server from outside, by name, through
# C4_STILE_PLANT; each must turn at least the named case RED.
PLANTS="buffered:T35 stdout-noise:T01 reply-notify:T02 no-version-check:T12 order:T07 no-fence:T19 overwrite:T32 keep-temp:T31 reverse-join:T29"

# T36/T37 bite only where deleting is forbidden (as on a Cowork-mounted folder). Point TMPDIR at
# such a folder and set STILE_NODELETE=1 to add their plant to --prove-red.
[ "${STILE_NODELETE:-0}" = 1 ] && PLANTS="lockfiles:T36 $PLANTS"

case ${1:-} in
  --prove-red)
    rc=0; echo "control (no plant):"; if suite >/dev/null; then echo "  ok    control -> green"; else echo "  WRONG control -> RED"; rc=1; fi
    for p in $PLANTS; do
      name=${p%%:*}; want=${p#*:}
      res=$(C4_STILE_PLANT=$name suite 2>&1 | tail -1)
      case $res in *" $want"*|*" $want "*) echo "  ok    $name -> RED at $want";; *) echo "  WRONG $name did not turn $want RED ($res)"; rc=1;; esac
    done
    [ $rc = 0 ] && echo "PROVE-RED: every plant RED where named, control green" || echo "PROVE-RED: FAILED"
    exit $rc ;;
  -h|--help) sed -n 2,10p "$0"; exit 0 ;;
esac
suite
