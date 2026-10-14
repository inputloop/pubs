# LENS 2026-09-28 — over the fence: circumspect crossings, and a fourth server that teaches

*With a second voice drafted beside it (`CHARACTER-2026-09-28-the-fixer.md`). Form: LENS (`c/wf`). The folder is `h/stile/`, named first
(`CONTEST-2026-09-28-name-this.md`); everything else in the folder came after.*

## The hypothesis, verbatim

From `q/2026-09-28-stile/PROMPT.md` (sha256 `eeccefcba3a93b9d…`, 2157 bytes), his words:

> Are there more circumspect solutions we might consider related to our file-system constraints?
> Uses of MCP or perhaps the opening for our fourth server?  I think I have been itching to have an
> MCP server written in one more implementation language (from our initial group to support or
> things we have a meaningful work in already in tree but haven't been using for MCP yet, and
> something where an MCP example might be helpful, for example to someone learning MCP who already
> knows the selected language).  The goal of serving a learning audience, especially as we approach
> projects with a big technology surface that could entice someone even to getting
> interested/started learning technology, could be considered inherited from dungeon: we are close
> to dungeon so to see our transitive responsibility to people attracted by that component of it's
> mission (the elisp manual for teaching making dungeons and automating games and enhancing the
> engine is supposed to be an elisp teach-by-example contribution to the elisp learning community).
> Taking that onboard as our own helps us balance it fairly when we must choose among objectives to
> prioritize or serve at all when pushed to pick among alternatives.

**A reading, in common words (mine, beside his):** our files live on two sides of a fence (the
cloud workspace where builds run, and his computer where work belongs), and the gate between them
is narrow. Before widening anything, look for the careful ways across. One of those ways might be a
fourth MCP server, written in a language the shop already uses but has never written a server in,
and written so that someone who knows that language could learn MCP from it. Serving learners is a
duty we inherit from `dungeon` (his Emacs package, and its manual that teaches Emacs Lisp by
example), and holding it as our own gives us a fair way to choose when we cannot serve everything.

## The ask and the method

**Ask:** a careful writing-forms step, focused back to one of the early perspective groups; see
whether a persona inspired by it is ready to speak; LENS the build and packaging questions; read
the last three days' work first; write helper materials into `h/<this>`; run a name contest as one
way a new voice can show itself; bring the minions in at the end on ENHANCE and let them inform the
final swing.

**Method.** One lens: *the careful crossing* (what is the least that must move, and who learns from
watching it move). Six boards. Each keeps OBSERVED (with its source or command) apart from JUDGED
(tagged [HIS] [DOMAIN] [SKILL] [PLATFORM] [MINE]), and each concern has the check that would
dissolve it. The perspective group chosen is the **2026-09-11 wave of eight seats** in `c/p`
(`two-van-shop`, `no-standing-yet`, `first-rung-log`, `steward-of-the-record`, `nonconsenting-node`,
`care-loop-asymmetry`, `caseworker`, `scooped-or-strategic`), because between them they cover the
build and procedure side (the archivist, the caseworker), the opportunity side (the tech, the
musician), and the obligation side (the householder, the caregiver, the teacher and her student,
the career-changer). The voice it inspired, the fixer, reads each board after I do, in her own
words, marked **[the fixer]**. She was rolled, not chosen (seed 9, her sheet §1).

**Reading plan (considerate-reader).** Decisions lean on: the MCP protocol's current rules (the
server must speak them), Emacs Lisp packaging rules (where a teaching server could live), and what
already exists for Emacs (so we do not rebuild a better thing badly). Read once each: the MCP
2026-07-28 release post and four spec pages (versioning, discover, stdio, tools); the GNU ELPA
contributing page; two Emacs MCP libraries' READMEs. No page was read twice; no host answered 429.

## What the last three days already say (cited at the act)

- **The gate's shape, as found by earlier sessions.** A re-commit to the same path can land old
  bytes under a new time (`claude/HANDBACK-2026-09-26-magic-number-theory.md`, Seams: "re-landed
  stale bytes three times; always compare sha256"), and that fingerprint was built into the
  sandboxer skill's `scripts/landing.sh` (blessed 2026-09-27). The host's `Filesystem__*` tools
  "fail with a JSON-schema dialect error" (same handback). On the c4 mount the shell can create and
  truncate but not remove (memory `mount-truncate-not-rm`).
- **The door images** (`writing/door-images/`, 2026-09-27): two bootable images minted in the cloud
  workspace (1,610,698,752 and 927,281,152 bytes) that could not come home, because one carry is
  20 MB. Both images carry Emacs.
- **Gates as switches someone owns** (`h/LENS-2026-09-26-freedom-is-the-product.md`, finding 1: "a
  stop you cannot get past is a mark; a reason on the record is a price"), and **one guard, many
  doors** (`h/NOTE-2026-09-26-one-guard-many-doors.md`): call the checks the shop has; do not write
  a new one at every door.
- **A parallel session is working now** on the default skill set and the always-on hold
  (`h/DESIGN-2026-09-28-default-skill-set.md`, `h/LENS-2026-09-28-always-on-hold-user-freedom.md`).
  Nothing here edits its files.
- **Four languages as the contract** (`h/JOURNAL-2026-09-14-driving-the-two-columns.md:247`: "four
  languages, none needing a library beyond a sha256 each already ships"), and the agreed case
  "POSIX plus up to four languages" (`h/DESIGN-2026-09-10-git-indifference.md:54`).

---

## Board 1 — the fence itself (build, technical)

- **SENSE.** What exactly is narrow, in which direction?
- **CANON (OBSERVED)** — from the tool descriptions this session runs under:
  - toward his disk: at most 50 files, 20 MB each, 100 MB per call (`device_commit_files`);
  - toward the workspace: at most 50 files, 400 MB each, 500 MB per call (`device_stage_files`);
  - his shell (`device_bash`) runs in a Linux VM on his machine, with the connected folders mounted,
    a short time limit per call, and network only as the organization allows.
- **READING (JUDGED).** The gate is **five times wider inbound than outbound per call, and twenty
  times wider per file.** [PLATFORM] So the circumspect order is:
  1. **Carry the recipe, not the bytes.** The door images are a few kilobytes of recipe and
     gigabytes of output. Rebuild on the far side and compare checksums; if two machines agree,
     nothing big ever crossed. This is also the onward walk's own test ("two machines agreeing is
     the test"). Guix, pinned to v1.5.0, is built to make this work. [DOMAIN]
     *Falsifier:* rebuild the Guix door on GIZA with the same command; a different sha256 means the
     image is not bit-for-bit reproducible here, and the next option is owed.
  2. **If bytes must cross, cross them in counted pieces**: split into 20 MB parts, one manifest of
     checksums, commit five parts per call, check each part on arrival, assemble only when every
     part checks, check the whole. That is the fourth server's first job (Board 3). [MINE]
     *Falsifier:* the arithmetic. At 19,000,000-byte parts (under the cap whichever way a
     megabyte is counted, [PLATFORM]), 1,610,698,752 bytes is 85 parts, 17 calls of five: heavy
     but finite (17 here is derived, not a house number). If his disk or patience says no, option 1
     wins.
  3. **Ask for a third place both sides can reach.** A host both the workspace and his machine can
     reach over HTTPS (one of the three transport hosts, if the organization allows it) would carry
     images in one piece. That is his to set up; it is written as a fork (F3), not assumed.
- **[the fixer]:** "Why carry it at all, if the recipe is on both sides? Rebuild it. If it comes
  out the same, you are done. If it doesn't, you have learned something more important than the
  disc."

## Board 2 — which language, with parity (build, procedural)

- **SENSE.** Which language is *in the tree, meaningfully, not yet used for an MCP server*, and
  best for someone learning MCP who already knows it?
- **CANON (OBSERVED).** Servers today: `mcp/c4-mcp.js` (node), `bin/wire_mcp-v1.8.3.py` (Python),
  and the plugin's three (`mentcached`, `persona`, `skillx`, all Python, `polygram/mcp/`). Perl is in
  the plugin as a second *reader* (`servers/bin/mentcached.pl`, "the archive-only note store's READ
  PATH, implementation B"), not as a server. Files in the tree, outside `Z/` and `archive/`, by
  `find … -name '*.ext'`: sh 215, py 139, js 44, el 13, pl 3, awk 3, tcl 1, scm 1, go 1 (Bryant's).

| | Emacs Lisp | Perl | POSIX sh + awk | Guile Scheme | Go |
|---|---|---|---|---|---|
| in the tree, meaningfully | yes: `emacs/` (model, diagram, surface, their tests) | yes, as second readers | yes, the most | one file (mine, yesterday) | one drop (Bryant's) |
| used for MCP yet | no | as a reader only | no | no | no |
| JSON in the standard kit | yes (Emacs 30: `json-parse-string`, `json-serialize`) | yes (`JSON::PP`, core) | no | no (guile-json is separate) | yes |
| sha256 in the standard kit | yes (`secure-hash`) | yes (`Digest::SHA`, core) | tool-dependent | no | yes |
| on both door images | **yes** (Emacs is on both) | on the Arch one | yes | on the Guix one | no |
| learners it would serve | Emacs users; `dungeon`'s readers | sysadmins | shell learners | Guix users | Go programmers (already well served) |
| the density test ("feasible only in one language?") | passes: small | passes | **fails**: a JSON reader in awk is the dense part | passes, with a dependency | passes |

- **READING (JUDGED).** **Emacs Lisp.** It is the only candidate that is in the tree, not yet a
  server, carries its own JSON and sha256, runs on both door images with nothing added, and serves
  the exact audience he names: `dungeon` teaches Emacs Lisp by example, and this would be one more
  example, of a different thing. [HIS] + [DOMAIN] **Perl is the honest runner-up** and would make a
  good fifth. POSIX sh + awk fails the density test on the JSON reader; that is a finding, not a
  failing of the shell. [SKILL: the density test is his, 2026-09-14]
- **What already exists** (OBSERVED, READMEs read once): `mcp-server-lib.el` (MELPA, GPLv3, Emacs
  27.1+) reaches Emacs "via emacsclient wrapper script" and "requires a running Emacs daemon";
  `mcp-server.el` (utsahi) is another library; `mcp.el` is a client. **Ours differs in one teaching
  way:** a single file run as `emacs --batch`, no daemon, no wrapper, no package, reading and
  writing one JSON line at a time, so the whole protocol is visible on one screen. [MINE]
  *Falsifier:* if a learner finds `mcp-server-lib`'s examples teach the protocol as plainly, ours is
  a duplicate and should point there instead.
- **[the fixer]:** "Emacs is already on the stick. A server that needs nothing else is a server I
  can show someone at the table. The spec says MUST in forty places; write it so each one is a line
  I can point at."

## Board 3 — what the fourth server does (build, the careful crossing)

- **SENSE.** Small enough to learn from; useful enough to be kept.
- **The job:** the careful crossing of Board 1, option 2. Three tools, nothing else:
  `stile_hash` (the sha256 and size of one file), `stile_check` (read a manifest; say for each piece
  OK, MISSING or MISMATCH), `stile_assemble` (only when every piece checks: join them into the target,
  never over a different file, then say what was checked and what was not).
- **The fences it keeps** (each one a lesson): it works only under one folder it is given at
  launch; it refuses absolute paths and `..`; it never deletes; it never overwrites a file whose
  contents differ; it writes to a temporary name and renames; it opens no network connection.
- **The protocol it speaks:** both eras. The MCP specification of 2026-07-28 removed the
  `initialize` handshake ("Every request carries its protocol version, and the server accepts or
  rejects each request independently"), and a server that supports older clients "MAY implement
  both behaviors". Ours does, on purpose, because the change itself is worth teaching and because
  we do not know which era his desktop speaks. [PLATFORM] *Falsifier:* register it and read which
  method arrives first; if the desktop never sends `initialize`, the legacy half is teaching only.
- **[the fixer]:** "Count the pieces. Check each one. Put them together only when they all check.
  Say what you didn't check. That is the whole job, and it's the whole lesson too."

## Board 4 — where it lives and how it is packed (procedural, packaging)

- **CANON (OBSERVED).** GNU ELPA: "all contributors to the package are required to sign the FSF
  copyright assignment"; NonGNU ELPA has no such requirement; "If possible, we always prefer if
  packages are submitted to GNU ELPA" (elpa.gnu.org/contributing). The plugin's three servers launch
  through `servers/launch.py`; three servers "have reported `not_started / could_not_prepare` on the
  keeper's desktop since 2026-09-16" (`launch.py`'s own docstring).
- **READING (JUDGED).**
  - Home in this tree: `h/stile/` now (helper materials, his word), with `mcp/` beside
    `c4-mcp.js` as the natural home once he says so. [MINE]
  - As the plugin's fourth server: **electable, not default.** A plugin entry that runs `emacs`
    on a machine without Emacs is one more `not_started`. The honest shape is a documented entry
    he or a learner adds, not a line in the default `.mcp.json`. [PLATFORM] *Falsifier:* if the
    desktop can mark a server optional without a start failure, it can go in the default set.
  - Toward the Emacs community: as an example in a manual (the `dungeon` way), or a package on
    GNU ELPA (needs every contributor's assignment) or NonGNU ELPA (does not). Which is his (F2).
- **[the fixer]:** "If it only works on the machine it was written on, it isn't packed yet."

## Board 5 — the opportunity (social)

- **READING (JUDGED).**
  - The door images put Emacs in front of people who did not ask for it. A server that runs in
    that Emacs, with its source one keystroke away, is a first program a curious person can read,
    change and run. That is the enticement his prompt names. [HIS]
  - The fixer's table (the Fix-It clinics and a LibreLocal evening, from yesterday's LENS) is where
    it gets taught in person: "here is how a program talks to an assistant; here is every line."
  - An Emacs Lisp example of the *2026-07-28* protocol, written the month it matters, is timely:
    every server written before July speaks only the old handshake. [DOMAIN] *Falsifier:* search
    for a dual-era Emacs Lisp server; if one exists, cite it and teach from both.

## Board 6 — the obligation (social)

- **SENSE.** What do we owe someone who learns from this?
- **READING (JUDGED), as duties, each with its check:**
  1. *It must be right.* Every MUST it claims to honour is tested. Check: the test names the rule
     it tests, and `--prove-red` shows each test can fail.
  2. *It must be safe to copy.* Learners copy examples wholesale. The fences of Board 3 are in the
     example, not in a footnote. Check: the tests include an escape attempt and an overwrite attempt.
  3. *It must be readable.* The comments are the lesson, in plain words. Check: a reader who knows
     Emacs Lisp and not MCP can say what each function does from its comment alone (Q7, by hand).
  4. *It must say what it is not.* Not a library, not the whole protocol (no resources, prompts,
     pagination, or subscriptions). Check: the header says so.
  5. *Someone must answer.* "I do not give up on people … I reach out" is one of his three standing
     attestations (`principles-attestations-pointer`). A teaching example with no one answering
     questions breaks that. Check: the header names where questions go. That is his to fill (F4).
  6. *It must not become the load.* No network at all (considerate-reader). Check: the source has
     no network call (grep).
- **[the fixer]:** "Duty five is the one people skip. I've seen a kid stuck on a thing for a week
  because the person who wrote it moved on. If nobody answers, say so on the first line."

---

## Board 7 — the build loop, pushed

The server was built, in the build loop, from `DESIGN-2026-09-28-stile-server.md` and its QA plan
(`SWING_FILE=h/stile/SWING sh bin/sw1ng state` → CLOSED, final swing kept). The receipts are in
`QA-PASSES.md`; in short:

| what | result |
|---|---|
| the server | `c4-stile-mcp.el`, one file, about 480 lines, every line within 80 columns, every function's comment naming the rule it serves |
| the test | `stile-test.sh`, POSIX sh and awk, written from the design's rules S1–S18: 37 cases |
| where it passed | Emacs 29.3 and 30.2 in the workspace, and **Emacs 30.2 on his machine** |
| can the test fail? | yes: ten faults, planted from outside by `stile-plants.el`, each turns its case red; an eleventh (Emacs lock files) bites on a folder that forbids deleting, and did |
| a real carry | a relocatable Emacs 30.2 (78,277,200 bytes, from `guix pack`) crossed to his disk as five pieces in one trip; joined by hand the first time, since there was no Emacs there yet; then that Emacs ran this server, which checked the pieces and joined them again: whole hash MATCH |
| what the loop caught | a false claim in my own comment (that `princ` would hold replies until exit; it does not), a test that could not see dot-files, and, **on his machine only**, Emacs trying to delete its lock files on a folder where nothing may be deleted |

One opening came back unasked: with an Emacs now able to run on his side of the fence, the tree's
own Emacs tests ran there for the first time (`emacs/run-tests.sh`: 26 of 26). [the minions, O1]

**[the fixer]:** "The first crossing was by hand, with `cat`. Every crossing after that, the tool
does its own. That's how it should go at the table too."

## Verdict

**It bears out, with an order.** The most careful crossing is the one where nothing big crosses:
carry recipes, rebuild, compare checksums (Board 1). When bytes must cross, count them in pieces
and check each one, and that job is small and clear enough to be the fourth server, in Emacs
Lisp: in the tree, not yet a server, present on both door images, carrying its own JSON and
sha256, and aimed at the learners `dungeon` already serves (Boards 2 and 3). It is electable, not
default, until the desktop can hold an optional server without a start failure (Board 4). What we
owe learners is written as six checks, not as a caution (Board 6).

**The new voice.** The fixer set forth: she read every board, disagreed with the folder's name,
and entered four names for herself. Whether she stays is his call (the CHARACTER rule), and so is
her name.

**Forks for Corwin** (each one line; nothing waits on them):
- **F1** the folder's name: *stile*, *carry-on*, *second-weekend*, or his own.
- **F2** where the server goes toward Emacs users: an example in a manual, GNU ELPA (assignment),
  NonGNU ELPA, or only this tree.
- **F3** a third place both sides reach over HTTPS, for carrying whole images, or none.
- **F4** where a learner's questions go (the header's first line).
- **F5** the fixer: keep her (and which name), or let her go back to the seats she came from.
