#!/usr/bin/awk -f
# make-card.awk -- derive the one-page card from the model: each rule's title, its first sentence, and its check
# up to "RED:". The model governs; the card is regenerated, never hand-edited.
# Copyright (C) 2026 Corwin Brust <corwin@bru.st>.  SPDX-License-Identifier: GPL-3.0-or-later
/^### Rule [0-9]+ · / { if (n) flush(); n++; title=$0; sub(/^### /, "", title); body=""; chk=""; inchk=0; next }
/^## / { if (n) flush(); n=0; next }
n && /^- \*\*Check:\*\*/ { inchk=1; chk=$0; sub(/^- \*\*Check:\*\* */, "", chk); next }
n && inchk && /^  / { line=$0; sub(/^ +/, "", line); chk=chk " " line; next }
n && inchk { inchk=0 }
n && !inchk && body=="" && /^[A-Z]/ { body=$0; next }
n && !inchk && body!="" && !done[n] && /^[a-z(]/ { body=body " " $0; next }
function flush(   s, c) {
  s=body; if (match(s, /\. /)) s=substr(s, 1, RSTART)
  c=chk; if (match(c, / RED:/)) c=substr(c, 1, RSTART-1)
  printf "**%s.** %s\n  *Check:* %s\n\n", title, s, c
  done[n]=1
}
END { if (n) flush() }
