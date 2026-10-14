# RAD — 2026-09-22 — which vessel carries the build loop · S4, written 2026-09-27

*This file completes `analysis/build-loop/RAD-2026-09-22-which-vessel.md`. That RAD left S4 open at
lines 71-73: "## S4 · Normalized findings" / "*Written after the decision, per the format. Open for
his ruling.*". This file is an ADD placed beside the RAD, and the RAD itself is unchanged. The form
comes from the `c/wf` RAD row: "S4 normalized findings (written only after the ruling)". Two piles
throughout: OBSERVED lines cite a file and line, and JUDGED lines carry a tag and a falsifier.*

## S1 (carried) · the question, with the ruling on the same rows

**Which vessel should carry the build loop, both to strangers and to his own other projects?** (RAD:12)

| | A · c4 only | B · CLAUDE.md paste-in | C · SKILL.md, prose only | D · SKILL.md + `scripts/sw1ng` + paste-in asset |
|---|---|---|---|---|
| ruled | — | kept, as a *rendered* carrier (see below) | — | **chosen** |
| reaches outside c4, 2026-09-27 | — | the paste-in text reached four hosted models (QA-2) | — | yes, as a soft skill served by `mentcached`. It is not in the plugin build. |
| counts, 2026-09-27 | — | no | — | yes: `sw1ng: all held, all fired.` |
| homes to keep in step: RAD predicted → observed | 3 → — | +1 per paste → 1 mirrored part, gauged | +1 → — | **1 → at least 8** (see Cost) |

## S4 · Normalized findings

### The ruling (the top part: what the meeting hears)

OBSERVED. `h/HANDBACK-2026-09-22-fabel-integrated-domains.md:114` heads Addendum 2 with *"make the
decisions"*. Lines 143-147 then rule:

> **`build-loop/RAD-which-vessel` chose D (skill + `scripts/sw1ng` + paste-in asset).** I agree, and I
> add a carrier it marked ✗: B "every paste drifts" is true of pastes and false of renders. Part
> `63-project-build-loop` now MIRRORS the skill's `assets/BUILD-LOOP.md` byte-for-byte into every rendered
> project floor, and `sh bin/door mirrors` reads OK/DRIFT. Tension kept on purpose: two homes (asset,
> part), held in step by a gauge, not merged. Falsifier: `door mirrors` DRIFT nobody notices.

`MEMORY.md:2668-2669` records the same decision: "which-vessel D kept + a mirrored door part (`door
mirrors`)".

In short: **the ruling was D, plus B's text carried as a rendered, gauged mirror.** The RAD had
already argued that D contains B (RAD:46-48: "D ships B's text as `assets/BUILD-LOOP.md`"). The
ruling went one step further: it placed B's text in the rendered project floors too, and it named
a gauge to hold the two copies in step.

### The RAD's own rows, normalized against what happened (D, and B-as-rendered)

| RAD row (line) | what the RAD said for D | OBSERVED since | reading [tag] |
|---|---|---|---|
| universalism: works with no Claude, no shell (31) | yes (the asset) | The paste-in ships as `d/door/63-project-build-loop.part:10-31`. A review found the design point "The paste-in must stand alone" SILENT in model.md (`onward-readiness/review-2026-09-26-onward/PUB-DESIGN-POINTS.md:66`). | **Holds in the text, but is not said in model.md.** [SKILL] *Falsifier:* a person with no AI who cannot finish a task using the paste-in alone. |
| four freedoms (32) | yes | The script, the spec and the paste-in are all plain files (`analysis/build-loop/INDEX.md:54-59`). | Holds. [DOMAIN] *Falsifier:* any of these found only in a signed or binary-only form. |
| elect-not-adopt: says how to decline (33) | "only if the text says so" | The paste-in says "Choosing it is optional; once chosen for a task, every step is required." (`63-project-build-loop.part:12-13`). The review: "gives no way to decline" (`PUB-DESIGN-POINTS.md:67`, B6 PARTLY). | **Half met.** The text says the loop is optional, but it does not tell a stranger how to decline. [HIS] *Falsifier:* a stranger who, reading the first screen, can say how to decline (the LENS falsifier, `LENS-2026-09-22-skill-in-context.md:73-74`). |
| keeper 1: reaches (39) | ✓ | The skill "never reached a session" until 2026-09-26, when it landed as `AS4CE0001/SOFT-SKILLS/build-loop`, "served live by mentcached" (`MEMORY.md:3166`). The plugin build has no `build-loop` (`PUB-DESIGN-POINTS.md:64`, B3 PARTLY). The paste-in was scored against four hosted models (`spells/build-turn/runs/2026-09-22-build-loop-v3.md:9-11`). | **Reached, four days late, and by a different road** (a soft skill rather than a plugin skill). [PLATFORM] *Falsifier:* a session outside c4 that loads `build-loop` without `mentcached`. |
| keeper 2: counts (40) | ✓ where sh exists | `sw1ng --prove-red` 24 checks, `tests/sw1ng-spec.py` 16 (`INDEX.md:56-57`). On 2026-09-26: "`sw1ng: all held, all fired.` exit 0" (`SPELLS-CONSISTENCY.md:38`). The soft skill's `sw1ng` is "byte-identical to c4/bin/sw1ng" (`MEMORY.md:3166`). | **Holds.** [DOMAIN] *Falsifier:* the PASS falsifier (`PASS-2026-09-22-build-loop-tank-verdict.md:43-44`), meaning `scripts/sw1ng --prove-red` goes red in a seat without c4. It has not been run in such a seat: the partner zip "carries `bin/c4`, so it is a slice of c4" (`PUB-DESIGN-POINTS.md:65`, B4). |
| easiest for Corwin today (41) | "medium, once" | The build turn took about two hours on 2026-09-22 (run record, line 15: "~19:14Z–21:10Z"). The landing took one more turn on 2026-09-26 (`MEMORY.md:3166`). | Paid, and paid twice (build, then land). [MINE] |
| easiest next year: one home (42) | ✓ one home | See Cost: at least eight places now carry the loop's rules or its counter. | **Did not hold as predicted.** [SKILL] *Falsifier:* a count, from `c4 names` and `door parts`, that finds the older homes retired to drawer copies. |
| best to work well for others (43) | ✓ | QA-2: "haiku 10/10, sonnet 9/10 (the miss was the quiz's own defect, fixed)" (run record:10-11). | Holds for hosted models; a local model was DASHED (run record:11). [PLATFORM] |
| most likely tried (44) | "good, and the paste-in is inside it" | `MODEL-2026-09-22-where-c4-runs.md:22` T1 BUILT: "the build-loop paste-in, scored against four models tonight". | Holds as far as anyone can observe. Nobody outside the shop has been recorded trying it. [MINE] *Falsifier:* a record of an outside reader using it. |

### What was built since (OBSERVED, by date)

- **2026-09-22.** `bin/sw1ng` v3, `tests/sw1ng-spec.py`, `tests/ai-matrix/`, and the skill in
  `skills-mint/2026-09-22/build-loop/` (SKILL.md, assets/BUILD-LOOP.md, scripts/sw1ng). Door parts
  `63-shop-build-loop-0922` and `63-project-build-loop` (a mirror). `door mirrors`. Sources:
  `analysis/build-loop/INDEX.md:54-59`, `d/door/63-project-build-loop.part:7-8`, handback:143-147.
- **2026-09-23.** Door copies were re-rendered, "mirrors OK" (`MEMORY.md:2686`).
- **2026-09-24.** Corwin "removed CLAUDE.md from `<f>:/claude` and `<f>:/claude/c4`" (`MEMORY.md:2781`),
  which took away the two main rendered copies.
- **2026-09-26.** The review: `DOOR: 0 rendering(s) CURRENT · 5 STALE/ABSENT · 0 mirror(s) drifted`
  and `c4 door mirrors`: `MIRROR-OK` ×1 (`SPELLS-CONSISTENCY.md:33`, `:37`). Later the same night the
  skill "FOUND AND LANDED" as `AS4CE0001/SOFT-SKILLS/build-loop`, with a write-to-build section,
  and was dogfooded at once on `h/SWING-2026-09-26-secrets-coverage`, "closed CLEAN on pass 1"
  (`MEMORY.md:3166`).

### What the ruling cost

OBSERVED. The places that carry the loop's rules or its counter, each named in the snapshot:
(1) spell 06, `h/spells/2026-09-17/06-the-build-loop.md` (`MEMORY.md:2546`);
(2) `bin/sw1ng`; (3) `skills-mint/2026-09-22/build-loop/` (words, paste-in, counter);
(4) `AS4CE0001/SOFT-SKILLS/build-loop` (`MEMORY.md:3166`); (5) `d/door/62-shop-build-loop.part`;
(6) `d/door/63-shop-build-loop-0922.part`; (7) `d/door/63-project-build-loop.part`;
(8) model.md's own paragraph (`model.md:212-216`). The tensions reader counted "76 files
/build.loop|sw1ng/" (`writing/execute-brief/tracks/tensions.tsv`, T09).

JUDGED:
- **The "one home" premise did not survive.** The RAD said D would leave one home, with c4's copy as
  its drawer copy (RAD:21). What happened is that every earlier home stayed, and the ruling itself
  added a mirror. Only one pair is held by a standing gauge: the paste-in asset and part 63. The
  counter's byte-identity was *observed* when it landed (`MEMORY.md:3166`), but no standing gauge
  holds it. [SKILL] *Falsifier:* a standing check (`door mirrors` or its like) that already compares
  the soft skill's `sw1ng` with `bin/sw1ng`, found somewhere this snapshot does not show.
- **Staged is not shipped, and that cost four days.** Choosing D meant a skill had to reach
  sessions, and between 09-22 and 09-26 it reached none. [PLATFORM] *Falsifier:* a 09-22 to 09-25
  session transcript that loaded the skill.
- **The trade was worth it by the RAD's own keepers.** Both keepers (reaches, counts) now hold, and
  that is what the RAD said should decide it (RAD:23). The extra homes are the price, and the house
  answer to more homes is a gauge rather than a merge (handback:146-147). [HIS]

### The falsifiers, and where each stands

| falsifier (who named it) | where | status 2026-09-27 |
|---|---|---|
| "`door mirrors` DRIFT nobody notices" (the ruling) | handback:147 | **Has not fired.** On 09-26 it read MIRROR-OK (`SPELLS-CONSISTENCY.md:37`). **But it is watching the wrong pair.** The part mirrors `skills-mint/2026-09-22/build-loop/assets/BUILD-LOOP.md` (`63-project-build-loop.part:8`), which is the mint copy that "never reached a session". The live home since 09-26 is `AS4CE0001/SOFT-SKILLS/build-loop`. So a change to the live skill's paste-in cannot show up as DRIFT. On top of that, the two main rendered copies have been ABSENT since 09-24, so the mirrored text now reaches only project floors. Whether it still reaches those could not be established from here: the review's VM saw them ABSENT, and that VM may simply not have mounted them. |
| a seat without c4 runs `scripts/sw1ng --prove-red` green (PASS) | PASS:43-44 | **Not yet tested.** The one run was from the partner zip, which carries `bin/c4` (B4). |
| a stranger can tell how to decline (LENS) | LENS:73-74 | **PARTLY** (B6). |
| "the paste-in asset dropped from the skill" (INDEX two-column note) | INDEX:44-48 | **Cannot tell.** `MEMORY.md:3166` says the mint build "carries sw1ng + a paste-in". This snapshot does not show whether the soft skill in AS4CE0001 kept `assets/BUILD-LOOP.md`. |

### Socialization (the rest of S4): does a shared view send us back around?

- **Not on the choice.** No observation argues for A, B-alone or C. [MINE] *Falsifier:* a partner
  who asks for the words without the counter and finds the skill in the way.
- **Yes, on the mirror's target.** Point `63-project-build-loop`'s `mirror` line at the live home,
  or add a second mirror row that compares the live soft skill with the mint copy. Either way the
  ruling's own falsifier can fire again. This is tool work for a session on Avalon; it needs no
  decision. [SKILL] *Falsifier:* the mint copy is declared the source and the soft skill is
  generated from it. Then the mirror is already pointed right.
- **Yes, on the decline line.** The paste-in is marked `owner HIS` (`63-project-build-loop.part:2`).
  It says choosing is optional but not how to decline. The tensions reader reconciles this with
  "Elect, then bind" (T09): the shop's "no parts are optional" (`63-shop-build-loop-0922.part:10`)
  is the shop's election, and the paste-in is for everyone else. A single decline sentence would
  close B6. Because the text is his, this goes to him as a decision (`decisions.json`,
  owed-analysis-D1).
- **An open question travels inside the paste-in.** The paste-in itself prints "Open question:
  after a redesign, is another extra round allowed? … stop and ask the author; do not pick."
  (`63-project-build-loop.part:25-27`). The 09-22 run record says "v3 by his ruling (the 09-17
  opportunity and extra round restored)" (run record:5-6). I cannot tell from the snapshot whether
  that ruling answers the after-a-redesign case. If it does, the paste-in is out of date. If it does
  not, every stranger meets his open question and is told to ask him. [HIS] *Falsifier:* a ruling
  line in the bank or MEMORY that names the after-redesign case.

**Losing reading, kept at its strongest.** *The added mirror was a mistake: it undid the one-home
premise that decided the RAD.* That reading holds if gauges go unread, because a gauge nobody runs
is just a second copy that drifts. It loses today because the gauge has been run at every
pre-flight since, and read clean (`SPELLS-CONSISTENCY.md:86`: "`c4 door mirrors` "0 DRIFT"" → "1
MIRROR-OK"). It would win the day pre-flights stop running `door mirrors`, and since the door came
down, some spells no longer have that step green (`SPELLS-CONSISTENCY.md:225`, D2).

LENS · S4 for which-vessel · 2026-09-27
a  my view: D was right by the RAD's own keepers; its promise of one home was not kept, and the gauge meant to cover that gap watches the mint copy, not the live one.
b  the view I ascribe Corwin: the loop should reach people and keep counting; more homes are fine if a gauge holds them ("a gauge, not a guard").
c  their pull on mine: I stopped reading the extra homes as failure and read them as the known price, provided a gauge covers them.
d  my pull on theirs: a gauge pointed at the draft copy is a guard over nothing; retargeting it is the whole fix, and it is small.
persona / inverse: gw7 says the counter should serve what comrades pull, so the mirror must watch what is served, not what was baked / the inverse says the mint copy is the recipe and the served copy is a derivative, so watching the recipe is right. If so, the soft skill should be generated from the mint copy, and nothing in the snapshot says that it is.
principles reframe: 1. universalism: the paste-in is the one form that reaches a person with no AI and no shell, so its decline line matters most there. 2. four freedoms: words, counter, spec and test are all readable and changeable files. 3. free software: one skill with its own proof travels better than rules scattered across doors. 4. community: an open question printed inside a shared text asks every stranger to reach the author; answering it, or saying it is still open, is a courtesy to them.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
