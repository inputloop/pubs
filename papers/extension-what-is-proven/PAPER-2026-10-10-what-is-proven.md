# What is proven for the extension, and where proof fails — a paper, 2026-10-10

## What this paper is

- **Edition:** 1, first of its kind for this spell. Supersedes nothing.
- **Minted by:** Mentat, warm-up GRAIN member 3 of 4, for the extension spell's HEAVY lens (ch.3 step 1).
  Corwin asked for it through the spell's runner. DRAFT, unsigned.
- **Form:** PAPER, which answers "what did we prove, and where did we fail to prove it" (`c4/c/wf` row PAPER).
- **Note on voice:** plain words. Each area has four parts: CLAIM, EVIDENCE, WHERE PROOF FAILED, and the
  SMALLEST EXPERIMENT that would prove it. EVIDENCE is the OBSERVED pile: each line names its command or
  path, and "re-run" means I ran it today. Everything else is JUDGED and carries a tag ([HIS] [DOMAIN]
  [SKILL] [PLATFORM] [MINE]) and a falsifier. The rule for the whole paper is his: **a pass that cannot go
  red proves nothing.** So "green" counts here only when the same harness was also seen to go red.
- **Inputs read:** SPELL.md (ch.1 verbatim wins), `runs/2026-10-10-NOTE-carry-in.md`, study S1–S5c,
  writing-forms SKILL.md. Corwin's words from tonight are carried as given in the brief, and they win:
  "GRAMMARY needs work, as do documentation; as we go and at the end just like tests" / "proves seamless
  access to all the information the user has entrusted as context passing before us, so that issues that
  come and go such as with sandbox or some connector benefit from TMTOWTDI" / "Persona inverse should be
  carried by other Persona ... falsifying knowledge held among participants" / seating of attached
  folders / liberal llama use.

## 0. What was run today (OBSERVED; all on Avalon through the device shell, cwd `<home><mnt>/AS4CE0001`)

| command | green | prove-red | area |
|---|---|---|---|
| `sh tests/tavernface-tests.sh [--prove-red]` | GREEN 7/7 | PASS, all three plants went red | A1 |
| `sh tests/c4face-tests.sh [--prove-red]` | GREEN | PASS, all six plants went red (C11 lexer evasion) | A1 |
| `sh tests/launch-cmd-tests.sh [--prove-red]` | GREEN, and it prints "NOT TESTED HERE: launch.cmd running under a real cmd.exe" | PASS, 11 of 11 | A1 |
| `sh tests/sp1rp-tests.sh [--prove-red]` | pass=15 fail=0 | PASS | usage |
| `python3 -m unittest tests.test_mcp_spans` | 10 OK | (no plant of its own; refusals in R-battery) | usage |
| `python3 -m unittest tests.test_mcp_persona` | 27 OK | — | persona |
| `python3 -m unittest tests.test_mcp_llamabridge` / `tests.test_llama_bridge_vb` | 4 OK / 19 OK | — | llama |
| `python3 -m unittest tests.test_mcp_store` / `test_mcp_softskills` / `test_gatefile` / `test_mcp_metrics` | 46 / 18 / 17 / 13 OK | — | TMTOWTDI, seating |
| `python3 -m polygram.mcp --prove-red` | — | PASS, 19 refusals fired, including "unknown preference refused" | A2a |
| `se1sn`, `hb1ck`, `ms1dg`, `mt1pl`, `cs1gk`, `persona-shelf`, `tp2mt`, `ss2gr` `-tests.sh` (each with `--prove-red`) | 26, 28, 37, 23, 22, 8, 17, 3 passed, 0 failed | each PASS ("harness correctly went red …") | seating, persona, A2b, usage |
| `sh tests/safety-2026-10-04-tests.sh [--prove-red]` | ok | ok ("checker goes red on the pre-fix skill") | A2b |
| `sh tests/editions-tests.sh` | 20 passed, 0 failed | **NOT CHECKED**: the run was cut off by the 180 s call limit with no output | economy |
| `python3 <home>/pw/reset_probe.py` (my probe, temp dir) | — | reproduces the fault, see §5 | usage |

- **Did the tests write into the tree?** `git --no-optional-locks status --short` showed the same 4 entries
  before and after: `M polygram/__init__.py`, two `advice/20261010-0611*` files, `releases/1.0.5`.
  None was made by the tests. Not checked: gitignored files such as `__pycache__`. A wider
  `find -newer` over AS4CE0001 and c4 timed out at 120 s.
- **Local model:** `get_stats` before I started: 0 delegations. `get_stats` mid-run: 7 delegations,
  average latency 186 959 ms, 0 failures. The sibling GRAIN members share the one GPU queue.
  `delegate_task` and `model_scoreboard` each **timed out at the 60 s device wait**. I moved to
  `delegate_async`, which is itself a TMTOWTDI datum (§8). Results are in §10.

---

## A1. Wire and Tavern connectivity

**CLAIM.** The plugin can reach a Tavern and a Wire, as pickable recipes with an undo.

**EVIDENCE.**
- tavernface green 7/7, and prove-red turned all three plants red: the vendored-file pin, off until
  `tavern.on`, and the secrets-scan list (re-run). c4face green, and prove-red turned six plants red
  (re-run). launch-cmd 11/11 red-able (re-run).
- S5c B.2: the running Tavern on wheels is stock 2.3.1 (`6ffaa566…`), byte-identical to upstream, and it
  is not the garden-pony build.
- S3 §4: Wire state lives in `claude_desktop_config.json` and a secrets file, outside the prefs.
  `wire-connect` names no undo for unpairing 2FA or for revoking the bearer code.
- Carry-in O3: `skillx` refuses, with blockers B1 to B3.

**WHERE PROOF FAILED.**
- Every Tavern test drives the *server* over stdio, and none connects to a *running* Tavern. What is
  proven is the gate (off by default, pinned bytes), not the connection. [DOMAIN]
  Falsifier: a test that calls `tavern_status` against a live `tavern-data` and asserts on the answer.
- launch.cmd has never run under a real cmd.exe, and its own test says so. [SKILL]
- Wire has no test in this tree at all: no `wire*-tests.sh`, no `test_*wire*` (`ls tests`). [DOMAIN]
- The undo column of the Wire recipe is empty in the source skills. A recipe with an empty undo cell
  is not yet a recipe. [SKILL]
- `tavern.as` defaults to `claude`, while the Tavern's config already registers `claudewin` (S5c J-B2).
  First contact would mint a second agent, and no test catches that. [SKILL]

**SMALLEST EXPERIMENT.**
- A `tavern-live-tests.sh` (perl or ruby, a language neither the server nor the existing kit uses).
  - Gated on `TAVERN_LIVE=1`, so the default kit stays offline.
  - It reads the agent list through `tavern_status`, and asserts that `tavern.as` is in it.
  - Its plant sets `tavern.as=nobody`, and the run must go red.
- For Wire: a fixture relay (`php -S` on 127.0.0.1) that the 428/401 ladder in aethernet-relay can be
  run against.

## A2a. Socialized preferences

**CLAIM.** Preferences are managed as one act built on `pref_list` / `pref_set`.

**EVIDENCE.**
- `polygram.mcp --prove-red`: "unknown preference refused" PASS (re-run). That confirms carry-in J2's
  premise, that the key set is closed: `pref_set user.x` is refused today.
- S3 §1.3: there are nine preference stores, and `pref_set` writes only one of them.
- S3 §2: five `pref_set` call sites, all of them turn-on or locate moments, plus three writers of
  preferences in prose.
- S3 §1.1: `current()` silently drops a hand-added row whose key is unknown (`prefs.py:79`).

**WHERE PROOF FAILED.**
- Nothing proves "one managed act", because no such act exists yet. [DOMAIN]
- The silent drop is the opposite of red: a store that can lose a row without saying so cannot fail
  where anyone sees it. [SKILL]
  Falsifier: a test that plants an unknown-key row and finds `pref_list` reporting it.
- There is no unset verb, so "back to the default" cannot be shown at all. [DOMAIN]

**SMALLEST EXPERIMENT.**
- One unit test, in a temp `MENTCACHED_PREFS`: append `ts\tnobody.x\t1\tby\twhy` by hand, then call
  `pref_list` and assert that an `ignored` section names `nobody.x`.
- It goes red on today's code, which proves the test can fail. The fix then turns it green.

## A2b. PRINCIPLES, organisational commitments and ToS before setup

**CLAIM.** PRINCIPLES, organisational commitments and ToS are read before any setup act.

**EVIDENCE.**
- tp2mt 17/17, red-able: ToS and Privacy are *minted*. safety-2026-10-04 is red-able: only the person's
  own words count as instructions (re-run).
- `grep -n -i 'principles|terms of service' polygram/mcp/prefs.py checks.py`: no hits.
  `steward.canon` exists as a switch (S3).

**WHERE PROOF FAILED.**
- What is proven is that the documents exist. The *order* (read before setup) has no test anywhere. A
  setup act today can run with no record that PRINCIPLES was read. [DOMAIN]
  Falsifier: an existing check that refuses a `pref_set` turn-on when no principles read is recorded
  in the session.

**SMALLEST EXPERIMENT.**
- A gauge, not a guard (his norm). Each turn-on `pref_set` returns a `read_first` line naming the
  principles file, its sha, and whether this session's span ledger shows a read of it.
- A test asserts that the field is present. Its plant deletes the field, and the run must go red.

## A2c. Tone dial and persona

**CLAIM.** Persona carries voice where it is enabled. Where it is not, one dial runs from crisp to
detailed, and it sits at (0/0, 0/0) when there are no signals.

**EVIDENCE.**
- `grep -rli 'laconic|crisp'` over skills, soft skills and polygram: one hit,
  `skills/mentat-skill/SKILL.md:47` ("typed crisply"), which is not a dial.
- test_mcp_persona 27 OK and mt1pl 23 red-able (re-run): persona resolution is proven.
- Carry-in J9: the shape of "(0/0, 0/0)" is still unasked or unanswered.

**WHERE PROOF FAILED.**
- The dial does not exist, so nothing about it is proven. [DOMAIN]
- Persona-less speech is not tested either: no test shows an actor with no sheet still speaking (ch.7
  falsifier "a PERSONA-less actor fails to speak"). [SKILL]

**SMALLEST EXPERIMENT.**
- Call `persona_resolve` on a name with no sheet, and assert that the reply carries a usable
  default-voice field.
- Today the refusal "absent persona is a FAULT, not a mint" fires (R-battery). So the experiment
  separates "refuse to mint" from "refuse to speak", which is the distinction ch.4 A2c needs.

## A3. Question economy

**CLAIM.** Ask one question, then decide on the second. Frame two together only when the confidence
that the second can be skipped is 17% or less. Every two-question frame is logged with its pair.

**EVIDENCE.**
- `grep -rl -E '83 ?%|17 ?%'`: hits only in `polygram/editions.py:18` ("GRAND the floor, plus 17%",
  unrelated) and in a fixture.
- The carry-in's own "one question" was asked alone, which is one manual instance.

**WHERE PROOF FAILED.**
- There is no log, so the gauge the spell names ("That log is the gauge") has never existed. [DOMAIN]
- One instance is an anecdote. [MINE]

**SMALLEST EXPERIMENT.**
- Add `KIND=gauge` rows to S3's frame. A checker counts the two-question frames whose skip-confidence
  is above 0.17. A planted row at 0.18 must go red.
- It costs nothing at run time: it is a row filter.

## Usage capture

**CLAIM.** Usage capture is OFF by default. When on, it records only two counts: one at session
start and one after each prompt.

**EVIDENCE.**
- `grep -n usage polygram/mcp/prefs.py`: no `usage.*` key.
- spans: test_mcp_spans 10 OK, sp1rp 15 passed and red-able (re-run). Tokens come from the caller and
  time from the server (S3 §3.1).
- **New today, from the brief:** in span `20261010T065222Z-da20`, mark 2 reported −28 574 tokens after a
  user interruption. **Reproduced** by `<home>/pw/reset_probe.py` in a temp ledger: start 100 000,
  mark 90 000 (+10 000), mark 118 574 → `tokens_since_last -28574`, and `span_report` total
  `tokens: -10000`. The ledger was confirmed to be under the temp dir.
- `spans.py:257` computes `prev - tl` with no check that the figure only falls. `_tokens` refuses a
  negative *input* (`spans.py:87`) but not a negative *difference*. The test "tokens must be whole and
  not negative" covers only the input.

**WHERE PROOF FAILED.**
- **The spend figure is wrong whenever the harness resets its count between user messages.** It is
  worse in the report: the negative row is summed into the total, so a session report understates
  spend silently. [PLATFORM] (the reset is the harness's), and [SKILL] (the server trusts the figure to
  be monotone).
  Falsifier: a harness that never raises the figure. Today's sub-agent context counts down
  monotonically (my own figures went 14 883 762 → 14 777 388), so the reset is per *user message*, as
  the brief says, not per tool call.
- "OFF by default" is unproven because there is no switch to be off. [DOMAIN]

**SMALLEST EXPERIMENT.**
- Add `test_mark_after_a_reset_is_flagged_not_subtracted` to test_mcp_spans: a mark above the previous
  figure must return `tokens_since_last: null` and `reset: true`, and the report must leave that leg out
  of the total.
- The test is **red on today's code** (the probe above is its body), so it can fail. This is the
  cheapest real proof in the paper.
- **Unlikely idea U1** [MINE]: the upward jump *is* a prompt boundary. Logging it as `KIND=prompt`
  gives the spec's "count after each prompt" for free, without the server ever reading anything it
  can't see. Falsifier: resets that happen with no user message (for example at compaction).

## Token economy and the token-optimizer swing

**CLAIM.** Our kit spends tokens economically, the token optimizer is being swung by evidence, and
that evidence reaches skilltank and Mentat.

**EVIDENCE.**
- `ls skills/token-optimizer/`: only SKILL.md (9941 B), with no scripts and no tests. Bryant's v1.3
  carries `tokenomics.py` (S1 §5).
- Its own falsifier says "The evidence does not reproduce" (line 133). That evidence is one external
  stress test, not re-run here.
- editions-tests 20 passed, but its prove-red is NOT CHECKED (timed out).

**WHERE PROOF FAILED.**
- No in-tree measurement of a single optimizer move. The only spend instrument is the span ledger,
  and it is broken by resets (above). So every token-saving claim made from spans today inherits that
  defect. [DOMAIN]
- The llama `get_stats` "tokens saved" figure is an estimate the bridge makes, with no second
  witness. [SKILL]
  Falsifier: a recorded A/B in the tree with both arms' spans.

**SMALLEST EXPERIMENT.**
- After the reset fix, one A/B pair of spans on the same small task (a GRAIN reading of one file):
  arm 1 plain, arm 2 with the optimizer's move "shell over agents".
- Report both arms' `tokens_since_start` in words. Before trusting either number, plant a reset and
  check that it is flagged.

## Seamless access to entrusted context across stores (TMTOWTDI)

**CLAIM.** When one road to the user's context fails (sandbox, connector), another reaches the same
information, so issues that come and go do not cost the work.

**EVIDENCE, from this run itself.**
- (1) My brief says that local Read/Bash are another machine. Only the device shell reaches the
  mounts.
- (2) `delegate_task` and `model_scoreboard` timed out at the 60 s device wait. `delegate_async`, a
  second road to the same model, accepted the jobs (§10).
- (3) A direct road to Ollama from the device shell, `curl -m 3` to localhost, host.docker.internal,
  10.0.2.2 and the gateway 172.16.10.1 on :11434, returned nothing. That road does not exist.
- (4) S5a: the GIZA patch is "No such file" on disk, while the project doc
  `claude/2026-10-09-giza-port-parked.md` exists in the attached Project. That is a second road this
  member was told not to take (device shell only), so it was **not attempted**.
- test_mcp_store 46 OK, freshness red-able (re-run): each store is proven on its own.

**WHERE PROOF FAILED.**
- Every proof is per store. Nothing tests the *fall-through*: "store A unreadable → the same fact
  from store B, with B named". So "seamless" is shown only anecdotally, by an agent choosing a second
  tool by hand, as above. [DOMAIN]
  Falsifier: a test that blanks one store and asserts that the answer names the other.
- The C: stores (`~/.mentcached/prefs.tsv`, `spans.tsv`) are outside every mount, so a device-shell
  session cannot read them (S3 §3.2; `ls ~/.mentcached` here: no such directory). That is one
  entrusted store with exactly one road. [PLATFORM]

**SMALLEST EXPERIMENT.**
- A ROADS table per fact class: preferences, persona sheet, skill text, Bryant drop. Each row lists
  the roads in order (MCP tool → mount path → Drive id → Project doc), and a checker walks a row,
  printing READ / NOT REACHED for each road.
- The plant blanks road 1, and the checker must report road 2 READ, not "absent". Today's run is its
  first fixture: device MCP down, async road up.
- **Unlikely idea U2** [MINE]: make an outage a *recorded fixture*. Each time a road times out in a
  real session (as today at 07:3xZ), append one row to the ROADS log. The prove-red for TMTOWTDI then
  replays a real outage, not a made-up one.

## The persona boundary net (inverse carried by other personas)

**CLAIM.** Each persona's inverse is carried by *other* personas, as knowledge in their own sheets
that can falsify it (his ruling).

**EVIDENCE.**
- S4 A.0: every inverse that exists is self-written ("mentat §14", "my inverse is the editor who makes
  everything pleasant"). VIBROBEAST and MERLIN have none.
- `grep -rl -i 'inverse I carry' h/persona ../c4/h`: no hits.
- S4 A.2: there are no edges among the four authors. Only solberg-maas sees across them.
- Today's cross-checks are by tool: cs1gk 22, red-able; test_mcp_persona 27 OK (re-run). His ruling
  places tools outside the net.

**WHERE PROOF FAILED.**
- By his rule, what is proven is the *tool* net, and the persona net is 0 edges written by participants.
  S4's edge list is my sibling's reading (JUDGED), not knowledge written in the sheets. [HIS]
  Falsifier: a sheet line in the form "NAME : what I know that would show NAME broke its line".
- Writing those lines is persona-writing, which is his pen or the persona's own voice by his option.
  So the gap cannot be closed by this run. [HIS]

**SMALLEST EXPERIMENT.**
- **Unlikely idea U3** [MINE], and liberal llama use: give the local model sheet A only, plus one
  claim from sheet B, and ask "from A's text alone, can you show B broke this? yes/no and the line".
- Run it over the 14×13 ordered pairs, as one async batch on gemma. Its yes-rate per pair is a
  *candidate* edge list for the personas (or him) to accept or reject. That makes it a reading aid, not
  an edge. The prove-red: a planted claim that contradicts A verbatim must come back yes.
- The model is a participant only in the sense of a reader with no other store, which keeps to his
  "knowledge held, not tools kept". The fork for him: does a model reading a sheet count as that sheet
  "holding" the knowledge?

## Local-model (llama) use

**CLAIM.** Delegating to the local model is reliable and saves Claude tokens, and its answers are
usable as a second witness.

**EVIDENCE.**
- test_mcp_llamabridge 4 OK, test_llama_bridge_vb 19 OK (re-run): the code paths are proven offline.
- Live: the device wait timed out twice (60 s). `get_stats` shows an average latency of 187 s across
  7 jobs today. Async jobs were accepted.
- The witness results are in §10.

**WHERE PROOF FAILED.**
- The unit tests prove the bridge's logic, not the model's judgement. The only judgement data is
  `model_scoreboard`'s human ratings, and that call timed out here. [DOMAIN]
- Latency under a GRAIN fan-out is above the synchronous tool wait (187 s against 60 s). So "liberal
  llama use" from parallel agents needs async by default. That is today's finding, not a guess.
  [PLATFORM]
  Falsifier: a run where the GRAIN's sync delegate_task calls all return inside 60 s.

**SMALLEST EXPERIMENT.**
- The witness design used here, made standing: claim + evidence → YES/NO/PARTLY.
- Score its agreement with the Claude verdict over ≥17 claims (the house number, invented) with known
  answers, including 4 planted "evidence does not prove it" cases. Those must come back NO or PARTLY,
  and that is the prove-red of the witness.

## Seating of attached folders

**CLAIM.** On first meeting a folder, the extension detects how it is seated, proposes a grain, and
asks one question at a time.

**EVIDENCE.**
- se1sn 26, hb1ck 28, ms1dg 37, test_gatefile 17 (re-run, each red-able): the *reference* seat
  (AS4CE0001) and the `.gate` reader are proven.
- S5a: `projects/` has no `.gate` and no `.polygram`, and 18+ live repos carry no seat marker.
- S5b: `<H>:\pub` has no `.gate`. On the open shelf, the vouch map is stale by 12 names.
- S5c J-B1: the patternwalk tapes sit inside an AI-mounted, writable folder, against the script's own
  capitalised rule. `skills/seatkeeper/` holds only SKILL.md, with no test.

**WHERE PROOF FAILED.**
- The detect/propose act has no implementation and no test. seatkeeper is prose. [SKILL]
- The parked G1–G7 patch that was meant to do step 1 could not be found on disk (S5a), so the one
  prior design is unread. [DOMAIN]
- The shelf vouch-map gap is *inferred* from the map's text, not from `sign.sh check-shelf` (S5b says
  so). [SKILL]

**SMALLEST EXPERIMENT.**
- `st1dt` (seat detect, POSIX sh) prints the nearest `.gate` up the tree, the markers, the remotes and
  the PMO key, in words, for one path.
- Fixtures: a temp tree with a `.gate` two levels up, and one with none. Plant a `.gate` that the
  walker must find, then hide it, and the run must go red.
- Then run it over the 40 rows of S5a. It must reproduce S5a's "no seat markers in projects", or S5a
  is wrong.

---

## Obvious wins (each one small, red-able, and costing almost nothing)

1. **W1, span reset flag** (usage). Shown above: today red, then fix. Falsifier: the test passes
   unchanged on today's `spans.py`. It does not: the probe gives −28 574.
2. **W2, `usage.capture` row in KNOWN, default off, plus an R-row "off ⇒ no row written"** whose plant
   sets it always-on (the tavernface F1 plant technique, S3).
3. **W3, unknown-key rows reported, not dropped** (A2a).
4. **W4, ch.7's verbatim check diffs PROMPT.md + RULINGS-1826.md joined** (carry-in J1/O4). Today it
   goes red on every firing, which is a red that proves nothing.
5. **W5, GRAMMARY as a gauge** (his "as we go and at the end just like tests"): a count of GRAMMARY
   terms with 0 users and of tree words with no entry (S2 J5). It prints numbers at session open and
   never blocks.

## Unlikely ideas

- **U1:** the token reset as the after-prompt marker (usage).
- **U2:** outages as recorded fixtures (TMTOWTDI).
- **U3:** the local model as a candidate-edge reader for the persona net.
- **U4** [MINE]: a *paper of red*. A per-area ledger row records whether the area's best test has been
  seen red in the last 9 days (house number, invented). An area whose only tests are all green and not
  re-reddened within the window reads PROVISIONAL in the run record, as TESTMANIFEST forms already do.
  Falsifier: every area here has a red within 9 days. Today, A2c, A3 and the persona net have no test
  to redden at all.

## What is proven, in one table

| area | proven (seen green and red today) | not proven |
|---|---|---|
| A1 | gates: off by default, pinned bytes, launch shape | live Tavern, any Wire, cmd.exe, `tavern.as` |
| A2a | closed key set refuses unknown keys | managed act, silent drop, unset |
| A2b | ToS minted, own-words-only rule | read-before-setup order |
| A2c | persona resolution | the dial, persona-less speech |
| A3 | — | everything (no log exists) |
| usage | spans' time and refusals | spend under reset (**shown wrong**), the off switch |
| token economy | — | any in-tree A/B; editions red NOT CHECKED |
| TMTOWTDI | each store alone | fall-through between stores |
| persona net | the tool net | any participant-held edge |
| llama | bridge logic | judgement quality, sync under load |
| seating | the reference seat, the `.gate` reader | detect/propose act, the G1–G7 patch |

## [MINE], one line

The paper's verdicts were read off test names and tail lines, not off each test's body. A test named
for X that checks Y would fool this table; the prove-red column only shows each harness *can* fail,
not that it fails for the reason its name gives.

## 10. Local-model second witness (model-efficacy data)

Model `gemma4:12b-8k`, `think:"false"`, `num_predict 120`, `temperature 0.1`, `no_cache`, through
`delegate_async`, because sync `delegate_task` timed out at the 60 s device wait. System prompt: "strict test
reviewer … Start with exactly one word: YES, NO, or PARTLY."

| # | claim given | my verdict | model's answer (verbatim) | agreement |
|---|---|---|---|---|
| L1 (job 2abffcbb2030) | "The span ledger measures token spend correctly across a whole session", with tests + reset probe + code line | NO | "NO. The evidence shows that the system allows for negative token spend because it fails to validate that `tokens_left` should only decrease. The probe results specifically demonstrate a calculation error where a reset in the harness leads to an impossible negative total." | **full**: same verdict, same reason |
| L2 (job 87d8efe9a360) | "Tavern connectivity is proven to work for the plugin", with tavernface 7/7 + red, no live connect, stock 2.3.1, device timeouts | PARTLY (the gate is proven, the link is not) | "NO. The evidence shows that tests failed to connect to a running Tavern and that device-side MCP calls timed out. These results contradict the claim that connectivity is proven to work." | **partial**: same direction (not proven). It misreads "did not try to connect" as "failed to connect", and it gives no credit for the red-able gate |

- Agreement: 1 of 2 full, 2 of 2 on direction (proven / not proven). The model lost the
  partly-proven case, so it rounds "partly" down to "no".
- That is one data point for the next witness design: ask it to list "what IS proven" first, then give
  the verdict. [MINE] Falsifier: the same prompt with that order still drops the partial credit.
- `get_stats` before: 0 delegations. After: 15 delegations (shared by the four GRAIN members), 4430
  tokens offloaded, estimated Claude tokens saved 2777, average latency 122 794 ms, 0 failures.
  Mine are 2 of the 15.
- The "saved" figure is the bridge's own estimate (see Token economy).
- `model_scoreboard`: NOT CHECKED (timed out at the 60 s device wait, not retried).
- Side finding (wf-check): run from `AS4CE0001/dist/...`, `wf-check.sh` cannot find `c/wf`. It walks
  the script's own ancestors, not the checked file's, so it needed `C4_ROOT=<home><mnt>/c4`. With that
  it reads `verdict: OK`. Its `--prove-red` passes, using its own fixture register. [SKILL]
  Falsifier: the SKILL.md usage line already says to set C4_ROOT. It does not; it shows the bare call.

---
Authored by Mentat (for Corwin; claude-opus-5-5).
