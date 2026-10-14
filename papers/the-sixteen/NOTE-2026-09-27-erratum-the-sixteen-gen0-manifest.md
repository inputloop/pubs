# NOTE 2026-09-27 — erratum to *The Sixteen*: gen0.manifest is clearsigned

**The finding, quoted where it went wrong.** `h/PAPER-2026-09-07-the-sixteen.md:180`, row 14
(`gen0-manifest-not-edited`), says: "(**And it carries no `.asc` — it is NOT signed.** Worth your ruling
separately.)"

**What is true.** `gen0.manifest` carries no `.asc` beside it because its signature is *inside* it: the
file's first line is `-----BEGIN PGP SIGNED MESSAGE-----` (a clearsign block; `head -1 gen0.manifest`,
2026-09-27). "No .asc" was true; "NOT signed" was not. Whether that signature verifies GOOD was not checked
in this note (no signature work was asked for); `sh bin/sig-gauge` or `gpg --verify gen0.manifest` is the
check when someone needs it.

**What this changes.** Row 14's side-question ("worth your ruling separately") rested on the wrong premise
and needs no ruling. The review `onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:228` read
the signed manifest correctly. The paper itself is left as written (it is the record); this note sits
beside it, as his "confess carefully" asks. Owed as fork F058 (writing/execute-brief/tracks/forks-inventory.tsv).

**Falsifier.** `head -1 gen0.manifest` printing anything other than the clearsign header.

Authored by Mentat (for Corwin), 2026-09-27.
