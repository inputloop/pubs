# The QA passes of the stile-server build loop (the counter is sw1ng's: `SWING_FILE=h/stile/SWING`)

## Pass 1 — 2026-09-28 (cycle 1) — 6 issues, 1 warning; every issue corrected

| # | what the plan's checks found | how it was confirmed | the fix |
|---|---|---|---|
| 1 | Q6: "docstring wider than 80 characters" on both Emacs versions | `emacs --batch --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile` | every line of the file rewrapped to 80 columns |
| 2 | Q1: the rewrap left one `)` too many; every case went red at once | the suite: 4 passed, 31 failed; the compiler: "Invalid read syntax" at 248:59 | one paren removed; the red suite was itself a receipt that the test sees a broken server |
| 3 | Q2: the test's counters were never reset between runs, so `--prove-red` double-counted | "10 passed, 60 failed" on a 35-case suite | counters reset at the top of each run |
| 4 | Q2: the `keep-temp` plant did not turn T31 red, because `ls` hides dot-files and the temporary name starts with a dot | prove-red: "keep-temp did not turn T31 RED" | `ls -A` |
| 5 | Q2: the `buffered` plant did not turn T35 red, and the comment beside it was **false**: it said `princ` would hold replies until exit; on Emacs 29.3 and 30.2 it does not, because `read-from-minibuffer` flushes stdout before it waits | prove-red on both versions | the claim was taken out of the comment (and the comment says it was); the plant now holds every reply until exit, a real mistake the rule exists to catch |
| 6 | Q4, **on his machine**: the real carry worked (five pieces, 78,277,200 bytes, whole hash MATCH), but joining left an Emacs lock file (`.#.stile-…`) behind, and Emacs logged "Unlocking file: Operation not permitted" — it had tried to delete. S12 says nothing is ever deleted | `ls -A` of the carry folder; the server's stderr | `create-lockfiles` bound to nil while joining; T36 (no lock left) and T37 (no unlock attempt) added; a `lockfiles` plant that bites where deleting is forbidden |
| W | Q7: the helpers' comments say what each does in plain words; eleven small helpers name no rule of their own (the Part heading above them names the rules they serve) | hand read of every docstring's first line | left as a warning for the final swing |

Also found, outside the plan and not the server's: yesterday's Guix install in the cloud workspace had
left `/tmp` at mode 755, which broke `apt` there. [MINE] Fixed with `chmod 1777 /tmp`.

## Pass 2 — 2026-09-28 (cycle 1) — 0 issues, 1 warning

| Q | result | receipt |
|---|---|---|
| Q1 | OK on three Emacs builds: 29.3 (Ubuntu), 30.2 (Guix), 30.2 minimal (the relocatable pack carried to his side) — 37 of 37 each, in the workspace; 37 of 37 on his machine | `sh stile-test.sh` |
| Q2 | OK: every plant red where named, control green, on all three builds; on his machine in a folder that forbids deleting, with the lock-file plant added, 11 of 11 | `sh stile-test.sh --prove-red`; `STILE_NODELETE=1 TMPDIR=<the carry folder> …` |
| Q3 | OK: the test is POSIX sh and awk, written from DESIGN §3 | by inspection |
| Q4 | OK: **a real carry, on his machine.** A 78,277,200-byte relocatable Emacs 30.2 (`guix pack -RR emacs-minimal`, pinned to Guix v1.5.0) crossed as five pieces in one commit; `sha256sum -c` passed them; the first crossing was joined by hand (`cat`) because there was no Emacs on his side yet; that Emacs then ran this server, which checked the same pieces (READY) and joined them again (whole hash MATCH, `cf815331…`) | `c4/tmp/2026-09-28-stile-carry/` |
| Q5 | OK: no delete, process or network call in the source (T34) | `grep` |
| Q6 | OK: byte-compiles with warnings as errors on all three builds, 0 lines of output | `batch-byte-compile` |
| Q7 | WARNING stands (as pass 1) | — |

## The final swing — 2026-09-28 — informed by the minions (`ENHANCE-2026-09-28-minions-over-the-stile.md`)

Taken on the minions' R1 and R3 and the standing Q7 warning; regression first.

| change | why | receipt |
|---|---|---|
| every fault switch moved out of the server into `stile-plants.el`, planted from outside with `advice-add`; the server now reads no environment variable at all | R1: a teaching file must not carry a latent switch that turns off its own fence | `grep -c PLANT c4-stile-mcp.el` → 0; `--prove-red` still turns all ten named cases red (eleven with the lock-file fault on a no-delete folder) |
| every function's docstring names the rule it serves | Q7 | hand read, and a scan for docstrings without an `S` number → none |
| the "DRAFT · unsigned" stamps and the bylines taken out of the LENS, DESIGN and CHARACTER; the package header's Author line is the copyright holder | R3: his ruling of 2026-09-23 | `grep -l 'DRAFT · unsigned\|written by Mentat'` over the folder → only the ENHANCE, which quotes the ruling |
| the HOWTO gains "No Emacs on the far side?" | the minions' O4 | — |

The whole plan, re-run after the swing: byte-compiles clean (warnings as errors) on Emacs 29.3, 30.2
and the carried 30.2 minimal; 37 of 37 on each in the workspace and on his machine; `--prove-red`
green on all four, including the no-delete folder on his side. **0 issues, 0 warnings. Kept.**
The two machines agree on the bytes: the code's sha256 in `SHA256SUMS.code` was read the same on
both sides before each run (`a1e53c0f…` for the server at the swing's close).

## After the close — two things the landing found (2026-09-28)

1. **The leak check rewrote a line of code.** Landing on the pub shelf with `--scrub` turned the
   example `"<C>:/x"` in one docstring into `"<C>:/x"`, so the shelf's copy no longer matched
   `SHA256SUMS.code`. The example was changed at the source ("a drive letter"), the whole plan was
   run again (Emacs 29.3 and 30.2 here, 30.2 on his machine: 37 of 37, prove-red green, compile
   clean), `SHA256SUMS.code` was rewritten, and the item re-landed. The server's sha256 is now
   `44b2331f…`.
2. **Byte-compiling on his folder left lock links too.** The same Emacs behaviour as pass 1's issue
   6, this time from `batch-byte-compile` run by me in `h/stile/`. With his delete permission,
   granted for this, I removed the two lock links, the stray `.elc`, the lock link from the first
   carry and the test fixtures. Nothing else was deleted. The lesson is in the HOWTO's
   neighbour, the ENHANCE (R5): compile in scratch space, not in a folder that forbids deleting.
