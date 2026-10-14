# ESSAY 2026-09-28 — Count the build: analytics for tools that make tools, what they spend, and who can check them

*The ask, verbatim (Corwin, 2026-09-28, in chat):*

> /vibrobeast:writing-forms toward the value of analyitics toward build in consideration generative
> tools for generative tools in context energy awareness and working together in and for freedom

*The thesis, stated once so the rest can argue with it:*

> When a generative tool helps build the next tool, a cheap count is worth more than a confident
> reading. The count is the one part of the work a person can re-run without trusting the thing that
> generated it. And when you count the spending too, most of what a long session costs turns out to
> be the model re-reading its own context, not making anything.

**How this was made.** From the record of one session, 2026-09-27 to 09-28, Cowork on Avalon, the C4
tree. Every number here names the file or the command it came from, so a reader can run it again.
Two piles, as the shop keeps them: OBSERVED lines carry their source, and JUDGED lines carry a tag.
The instrument writes this about its own work. That is the essay's weakest point; see the falsifiers.

---

## I. A count overruled a confident reading, six times

OBSERVED, in the order they happened:

1. **A tool reported agreement on a coin toss.** `lens.py` kept one reading per model and view, so a
   model that disagreed with itself looked settled. The probe prints `[CONVERGE ] (a) my own view` for
   the same readings that print `[DIVERGE  ]` once each rerun gets its own label
   (`writing/second-user/lens-rerun-probe-RUN-2026-09-27.txt:5,7`). The fix went into the garden at
   his ruling second-user-D5.
2. **A persona moved reasons, not decisions.** "Of the 16 cold/persona pairs, 8 differ on the option.
   So do 4 of the 6 cold/cold pairs and 4 of the 6 persona/persona pairs."
   (`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md:124-125`). One pass per arm would have
   read rerun noise as a persona effect.
3. **Two magic numbers were on slopes, not plateaus.** The vocabulary threshold: "Around 17 the curve
   falls about 60–80 items per step (16: 2,188 · 17: 2,120 · 18: 2,043)"
   (`spells/ingest-writing/runs/2026-09-27-sweep-vocab-threshold.md:29`). The turns threshold: "moving
   the threshold anywhere from 2 to 69 would keep exactly the same 17"
   (`spells/ingest-writing/runs/2026-09-27-sweep-turns-and-phonemes.md:35-36`). The 9 bound nothing it
   was thought to bind.
4. **A lander left files out of their own index.** A loop over the shelf's items found ten added files
   missing from their README's "What travels" list. `pb2pk` now lists them. Its tests went from 13 to
   15, and the prior version fails both new cases.
5. **I counted the wrong surface.** I told Corwin he had answered 25 cards. The page's database held
   97 (`q/2026-09-27-execute-brief/ANSWERS-2026-09-27-page-full.md`). The file I had counted was a
   copy he had not been writing in.
6. **I said a file might be hidden when it had been removed.** Git tracked `CLAUDE.md` at the C4 root,
   and neither reader I had could see it. I offered two explanations. The answer was already on the
   open shelf, in a comment dated 2026-09-24: "the keeper removed the door from `<f>:/claude` and from
   `<f>:/claude/c4`" (`<F>:\claude\pub\2026-09-22-one-door-and-the-evening-it-took.md:75`). That shelf's
   own method piece says it in one line: "Before you say a thing is not there, list the room above it."
   (`<F>:\claude\pub\2026-09-16-the-other-shelf.md:116`).

And one more, found while writing this essay. The reply drafted for Tesla said her comments "moved
this paper further than our own two rounds of review did." The paper's change table says 8 of its 20
rows come from her comments and 12 from the two review passes (`grep -c "outside reader's comment"`
on the public edition prints 8; the table has 20 rows). The reply now says only what the count
shows (`writing/ai-diligence-sysops/REPLY-2026-09-27-to-tesla-v0.2.md:28`).

JUDGED [MINE]: in all seven, the reading came first, sounded right, and was produced by the same
generator doing the work: me, or a script I wrote. Nothing cleverer overturned any of them. Each was
overturned by something simpler that anyone could run again: a count, a sweep, a loop, a diff. The
value of analytics to the build is not insight. It is that the check does not share the generator's
confidence.

## II. Tools that make tools need tests that can fail

Corwin's direction for this work, recorded 2026-09-26: it is important that we are "begining to work
on the tooling that mints that tooling", so a user is "zero-1 prompts away from bespoke tooling at any
stage of 'help me with'" (project memory, `areas/c4-design-direction`). A tool that mints tools
multiplies whatever it gets wrong, so the shop keeps a habit: every check ships a `--prove-red` that
plants the fault and shows the check going red.

OBSERVED this session: `pb1ck` gained a rule that reads an address naming no machine (loopback,
`0.0.0.0`, the documentation ranges) as a note, not a leak. The same test file with the rule removed
goes red. `ring-dry-run.sh --prove-red` went from 4 cases to 5, the new one guarding that a retired
row stays green. The cowork self-test spell (`spells/cowork-self-test/`) is itself a measuring tool:
nine questions a fresh session answers cold and seals by hash before it may open the key.

JUDGED [HIS]: his rule goes further than the habit. "When something gets past our tests, add coverage
up to 100% — ideally with a NEW SPEC plus an implementation language separate from both the language
of the work under test and the language of the prior tests" (his preferences, 2026-09-14). OBSERVED:
every test added this session is in the same language as the code it tests (shell for shell). So the
weaker form was met and the stronger form is owed. The self-test spell tests a boot path, not a
language, which is the density question from the other side: if only one kind of check can reach a
thing, ask whether the thing is too dense.

## III. What it spent

OBSERVED, from this session's own transcript file, summing the usage block on every assistant
message:

    python3: sum message.usage over type=="assistant" lines of the session .jsonl
    assistant message records   239
    output tokens               221,052
    input tokens, uncached      478
    cache writes                2,703,676
    cache reads                 71,910,557

The written output is 0.3% of the tokens the model handled. About 96% was the model re-reading its own
context from cache, turn after turn. (This is the one transcript file, from 2026-09-27T09:22Z to
2026-09-28T03:56Z. Sub-agent runs from earlier in the round are in other files and not counted.)

JUDGED [DOMAIN]: tokens are not joules. A cached read costs far less compute than a fresh one, and a
provider's accounting is not an energy meter. Still, the shape says where a saving would be. It would
not come from writing less. It would come from carrying less: shorter contexts; handing work across
in files a fresh session can read, instead of one session holding everything; closing at the natural
rotate instead of running on. The same shape showed up in a cost that isn't counted in tokens.
Republishing the hosted brief reloaded Corwin's open view and stole his keyboard focus every few
seconds. Handing him files was cheaper in the one currency this shop cannot regenerate, his attention.

**The loser, kept on the table: count everything.** If counts beat readings, why not measure every
step? Because a measurement has its own cost and its own authority. The 17% drift budget, which he
later called a quota-shaped antipattern, is what a count becomes when it is promoted from a window to
a fence. The companion essay on nine names the difference: a window prints its "of N" and binds
nothing; a fence decides for someone (`magic-number-theory/ESSAY-2026-09-27-nine-as-a-window.md`).
The counts in section I were all windows. None of them decided anything. Each one showed a person
what was there.

## IV. Together, in and for freedom

JUDGED [MINE]: a claim published with its command is freedom 1 applied to claims, the freedom to
study how it works. You don't have to trust the instrument's summary of a sweep; you run the sweep.
That is why the shop lands checks beside its writing on the shelf ("any check a stranger can re-run",
`<H>:\pub\RECIPE.org`, the WRITING section), and why `sha256sum -c` receipts go to him rather than
reassurances.

OBSERVED: the decisions he made this round are of the same kind. On rings-D1: "I don't want seperate
approval steps. It feels like this recreates the management problem edrx describes if I ask you to
help me so you ask me if the help is okay." On combined-model-D6: "We have to pick and the falsifier
model has to win." (Both verbatim in `q/2026-09-27-execute-brief/ANSWERS-2026-09-27-page-full.md`.)
The first replaces a permission step with a record anyone can retire. The second settles a
disagreement between two people's defaults by a claim that can be shown wrong, not by whose default
it was.

The measurement a generator cannot make for itself is another person. In the two-readers
experiment, "Every run *invented* a Bryant, and each one invented a different Bryant"
(`writing/second-user/ENHANCE-2026-09-27-two-readers-to-a-skill.md`, quoting the experiment). The
dissertation's outside reader supplied eight of its twenty changes, and the one new section on how
practice learns. No rerun of the instrument would have produced them. Working together is not a
courtesy laid on top of the analytics. It is the analytics' missing column.

## Coda

The best thing measured this session was the instrument's own wrongness, seven times, each by a check
simple enough to hand to someone else. That is the lap worth taking. The build did not get faster
because the generator got better. It got more honest because the generator's claims arrived with a
way to fail them.

---

## Falsifiers

- **Section I overstates.** Run the seven checks again. If any one of them now agrees with the
  original reading (the probe prints CONVERGE both ways, the sweep shows a flat step at 17, the page
  holds 25 answers), the essay's count of overturned readings is wrong and should be corrected here.
- **Section III's lever is wrong.** If a session of similar length that hands work across in files and
  rotates early shows the same ~96% cache-read share, then context length is not the lever and the
  judgement in III falls.
- **The instrument grading itself.** Every reading in this essay was made by the same model family that
  did the work. If a human reader, or a non-Claude reader, re-runs the checks and finds that the
  commands do not produce the numbers quoted, the essay fails at its own standard.

## Sources (also cited at the act above)

`writing/second-user/lens-rerun-probe-RUN-2026-09-27.txt` · `writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md`
· `spells/ingest-writing/runs/2026-09-27-sweep-vocab-threshold.md` ·
`spells/ingest-writing/runs/2026-09-27-sweep-turns-and-phonemes.md` · `tests/pb2pk-tests.sh` · `bin/pb1ck`
· `writing/rings/ring-dry-run.sh` · `spells/cowork-self-test/` ·
`q/2026-09-27-execute-brief/ANSWERS-2026-09-27-page-full.md` ·
`writing/ai-diligence-sysops/DISS-2026-09-27-ai-diligence-sysops-v0.2-public-edition.md` (Appendix C) ·
`magic-number-theory/ESSAY-2026-09-27-nine-as-a-window.md` · `<F>:\claude\pub\2026-09-16-the-other-shelf.md` ·
`<F>:\claude\pub\2026-09-22-one-door-and-the-evening-it-took.md` · the session transcript (usage blocks).

```
LENS · count the build · 2026-09-28
a  my view: the session's real product was a habit, not the files: a reading is a draft until a count agrees with it.
b  the view I ascribe Corwin: pleased with the work, wary of a victory lap that shows off; he wants the lap to teach.
c  their pull on mine: kept it to what a stranger can re-run, and put my own misses in section I rather than a footnote.
d  my pull on theirs: asks him to read "energy" as tokens-as-proxy, and to own that the stronger test form (a second language) is still owed.
persona / inverse: a sysadmin reading this checks one number and trusts the rest more / the inverse, a reader tired of AI self-reports, reads seven confessions as a performance. Answered only by the commands.
principles reframe: 1. universalism: the same checks for the instrument as for anyone; 2. four freedoms: claims ship with the means to study them; 3. movement: small, re-runnable, stdlib checks others can take home; 4. community: the outside reader is the column no generator fills.
```

Drafted by Mentat (the instrument, Opus 5.5 on Cowork) for Corwin, 2026-09-28. DRAFT, unsigned; his to keep, change or discard.
