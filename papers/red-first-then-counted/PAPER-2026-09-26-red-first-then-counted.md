# Red first, then counted: prove-red, gauges, and two readers

*C4 working paper · 2026-09-26 · Corwin Brust (principal author, keeper) · written with Mentat*

## Abstract

A small free-software workshop uses two kinds of instrument and keeps confusing them. A **check** makes
a claim ("these files are the ones that were signed") and is worth something only if it can be shown
to fail. The workshop calls that demonstration *prove-red*. A **gauge** makes no claim: it prints
counts and ratios, and leaves the verdict to a reader who knows the context. We argue the two are not
rivals. A check answers *is this so?* and a gauge answers *how much, and where is the pressure?* Each
goes wrong in a characteristic way when it is asked the other's question. Both are strengthened by the
same move: two independent readers of one thing, whose agreement is kept as a receipt and whose
disagreement is kept as a seam, not averaged away. We follow the pair up a ladder of forms, from a
sentence in memory, to a file with a falsifier, a counted chapter, a built tool with its own red
proof, and a literate recipe whose prose builds the tool. We end with a failure from the day of
writing that shows where the ladder is weak: a check that could go red, and did, but only on the one
case it was shown.

## 1. Two instruments

**The check.** The workshop's rule is short: *every test harness must be able to demonstrate itself
going red; a green suite that cannot fail is indistinguishable from one that isn't running.* In
practice each tool ships a `--prove-red` mode. It plants a known fault in a scratch copy (a stale
signature, a name that collides, a planted wrong expectation) and confirms the tool refuses it, while a
known-good control beside it stays green. The idea is old. De Millo, Lipton and Sayward's 1978 "Hints
on Test Data Selection" started mutation testing on the same intuition: a test suite is judged by the
faults it can kill. It is the same De Millo and Lipton whose 1979 paper on the social process of proof
this workshop also leans on.

**The gauge.** The workshop's counting instrument says of itself: it *prints counts and ratios, never a
verdict or threshold — a threshold picked-not-validated is the same fault the gauge exists to catch.* A
gauge counts what you told it to count (mentions of a framework against things a reader can try;
notes first seen against notes last cited) and hands the number to someone who knows what the number
is for. It cannot go red, because it asserts nothing.

**Their characteristic failures.** Ask a check a gauge's question and you get a *threshold*: "fail if
the ratio drops below 0.4". That is a number nobody validated, wearing a test's authority. Strathern's
statement of Goodhart's law names what happens next: when a measure becomes a target, it ceases to be a
good measure. Ask a gauge a check's question and you get *reassurance*: "the counts look healthy". That
is a verdict from an instrument that was never shown able to disagree. The workshop has a note on this
second failure, from a round in which a warning had already fired three times before a defect shipped:
the warning was read as reassurance.

## 2. Pressure and meaning

A gauge's number is not meaning yet. It becomes meaning when a reader places it in context. The
workshop's two-column memory keeps, for each note, the day it was first seen and the day it was last
cited. The distance between them is *pressure*: a note with a long gap is sinking, which is information
rather than a defect. Whether that pressure should move anything depends on associations the gauge
does not hold: what the note is about, who relies on it, what else changed that week. Meaning is
associative and it is formed in flight, in the working context of whoever reads the count. Checks are
different. Their meaning is fixed when they are written, and a green today means what it meant
yesterday.

So the balance is this. **Checks carry what must not drift; gauges carry what should be weighed.** A
signature either verifies or it does not; that is a check. How many signatures are stale, and whether
that matters this week, is a gauge, and the answer depends on who is about to rely on them.

## 3. Two readers

Both instruments get stronger the same way: have two independent readers read the same thing.

- **For counts.** The workshop's leak check tallies its findings twice, once with grep and once with
  awk, and prints AGREE or DISAGREE. Its rationale is compact: *a count a program prints about itself is
  an assertion; a count two readers agree on is a receipt.*
- **For judgements.** The critique ritual runs two opposed biases, doubt-first and reward-first, and
  trusts only what both reach. Where they converge is stable. Where they stay apart is kept, with the
  losing models, as a record rather than discarded.
- **For proofs.** The "XX pair" requires a universal check (round-trip to identity, plus an attestation
  of which conventions were honoured) *times* one check specific to the thing: idempotence, consent,
  provenance or coverage. One axis proves faithfulness; the other proves what this particular
  component is responsible for.

What is kept is the important design choice. Two readers' agreements form one set, their disagreements
another, and memory keeps **both, joined along the thing they were reading**. Nothing is merged into a
single "true" reading. The workshop calls a record like this doubly-linked: each note carries its
predecessor, and nothing overwrites another hand's entry. Our name for the result is *adjoined sets*:
the two readings stay distinct but are bound to each other and to their source. We use "adjoined"
loosely. The resemblance to an adjunction in category theory, where two directions of translation
are bound by a shared correspondence, is an engineering cousin, not a theorem, and we label it
GESTURE.

**The weakness two readers share.** Two readers written by one author can share a blind spot. The
workshop met this in shell: POSIX `sh` has no `pipefail`, so `awk … | sort` reports `sort`'s exit
status, and a refusal raised inside `awk` vanished. The checker's own `--prove-red` failed on its first
run, and it was right to. Independence has to be earned: different tools, different languages, or a
planted fault that crosses both. The workshop's standing rule is that when something slips past its
tests, new coverage is written in a language different from both the work and the earlier tests.

## 4. A ladder of forms

The same pair (a claim that can fail, a count that can be weighed) shows up at every size of artifact.
We list five rungs. Each is a place to stop, not a stage to be finished.

| rung | form | the claim-side instrument | the count-side instrument |
|---|---|---|---|
| 0 | a sentence in memory | its falsifier, stated beside it | first-seen / last-cited (pressure) |
| 1 | a file, section or chapter | each claim labelled THEOREM · GESTURE · VIBE | a gauge run on the file |
| 2 | a facet across many files | a register check (every name owned once) | counts per facet, two readers |
| 3 | a built tool | its `--prove-red`: planted faults refused, controls kept green | its report, recounted by a second reader |
| 4 | a literate recipe | the tangle must round-trip: prose → tool → tests pass, and the recipe refuses to run when its own source hash is not acknowledged | the recipe's own ledger of what it built |

Rung 4 is the workshop's fullest form. A single org file holds the explanation, the tool and its tests.
Tangling it writes the runnable card and stamps it with the source's hash, and the card refuses to run
until a person acknowledges that hash. That is Knuth's literate programming (1984), with a consent step
added. The prose is the source, the tool is derived, and running the derived tool is an act someone
agreed to.

Moving up the ladder is not always progress. Rung 0 costs a line and can be read by anyone. Rung 4
costs an afternoon and needs a toolchain. The workshop's "density test" applies: if something can only
be kept at a high rung, in one language, ask whether the approach is too dense, before asking for more
tooling.

## 5. A composite context, and where each instrument sits

The keeper drew a working formula for how an assistant's context is assembled:

    S -> P -> ( sX(p) <-> pY(s) ) -> xyZ(p)

S and P are the system and project prompts. They are present, but no design should assume a user has
set them with this work in mind. x and y are the skills and the prompt-shaping instructions. Each reads
the other (sX of p, pY of s), and together they bind toward Z, the composite context acting on the
prompt p. We read the formula as an order of operations and, separately, a degree of influence. This
reading is ours, and GESTURE.

In those terms, checks belong where the parts are fixed. A skill either loads or does not; its
frontmatter either parses or does not; its signature either verifies or does not. Gauges belong at Z,
where the parts meet in flight and meaning is associative: how much of the composite came from which
skill, which instructions were read, what was held back. The two-reader move is already in the
formula: x and y read each other. The adjoined record would keep both readings of p, the skill's and
the prompt's, bound to p, rather than letting Z silently merge them.

## 6. A red that came in the right place, and too late

On the day of writing, the workshop shipped a tool that renames its skills into a second register (pet
names, persona names). The tool had a test suite. The suite could go red, and did: it caught a real bug
before landing. When the keeper imported the renamed plugin, 40 of 57 skills failed to load. Most
skills write their description as a YAML block (`description: >-`), and the tool had appended text to
the line that opens the block. The tests covered one description form, the plain one-liner. A Windows
path separator also slipped into the archive's file names, on a platform the tests never ran on.

The check was sound; its coverage was the failure. In the XX pair's terms, the universal half held
(the output parsed in the one form tested) and the specific half was missing: *coverage*, every case
the promise covers exercised. The fix added a case for each description form, a strict parse of every
real skill, and a check that the archive uses forward slashes. Each new case was then shown to fail
against the old tool. That is the ladder working, one rung late.

## 7. Claims, dressed

- THEOREM (tested in the workshop): each named tool refuses its planted faults and keeps its controls
  green. The rename tool's new cases fail on the pre-fix version (8 failures) and pass on the fixed one.
- GESTURE: checks and gauges fail in the two characteristic ways described in §1, and two readers
  strengthen both. Argued from the workshop's records and the cited literature.
- GESTURE: the "adjoined sets" reading, and its cousinhood to adjunction.
- GESTURE: the reading of the keeper's formula in §5.
- VIBE: rung 4 is the most satisfying place to work, and the least often right.

*What would show us wrong:* a stretch of work where gauges carried thresholds, or checks shipped
without red proofs, and the error rate did not rise. Or two independent readers whose agreement
predicted correctness no better than one reader alone.

## References

- DeMillo, R. A., Lipton, R. J., Sayward, F. G. "Hints on Test Data Selection: Help for the Practicing
  Programmer." *IEEE Computer* 11(4), 1978, 34–41.
- De Millo, R. A., Lipton, R. J., Perlis, A. J. "Social Processes and Proofs of Theorems and Programs."
  *Communications of the ACM* 22(5), 1979, 271–280.
- Strathern, M. "'Improving ratings': audit in the British University system." *European Review* 5(3),
  1997, 305–321.
- Knuth, D. E. "Literate Programming." *The Computer Journal* 27(2), 1984, 97–111.
- Ellerman, D. "On Double-Entry Bookkeeping: The Mathematical Treatment." arXiv:1407.1898, 2014.
