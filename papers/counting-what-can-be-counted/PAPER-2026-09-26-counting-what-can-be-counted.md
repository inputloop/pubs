# Counting what can be counted: mathematics as curation in a volunteer skill garden

*C4 working paper · 2026-09-26 · Corwin Brust (principal author, keeper) · written with Mentat*

## Abstract

A small free-software project keeps a "garden" of 62 instruction sets ("skills") that an AI assistant
loads to do careful work: signing releases, keeping notes with provenance, writing run-cards a stranger
can follow. Mathematics keeps arriving in that garden uninvited, as counts, ledgers, constants and
proofs, and each arrival meets a social habit coming the other way. We name eight of those meetings
("tensions"), each with a falsifier. We report one measurement: six independent readers reviewed every
skill for which of seven mathematical threads genuinely informs it. Double-entry accounting (31 of 62)
and the social process of proof (24 of 62) came out on top. We propose one practice that follows: the
writing owed at each build turn is kept as a double-entry journal, `CHANGES`. It has first-class room
for things deliberately held, for claims dressed honestly as theorem, gesture or vibe, and for
constants marked chosen or derived. We also report a small tool that gives every skill four names, so
the same garden can be read in four registers of speech. Our limits are stated; the strongest is that
the measurement is one reading by readers we chose.

## 1. Why mathematics arrives

The garden's work is mostly social: volunteers who will never meet need to trust a note, a signature
or a command they did not write. Mathematics arrives as the cheapest way to make that trust checkable.
A hash says two files are the same. A count says whether a register covers the alphabet. A ledger says
whether a change was recorded where it should be. The keeper's own framing is that drawing and
mathematics are "two sides of the same coin, being representing the universe as other than words."
Every such instrument, though, meets people on the other side of it, and some of the meetings are
uncomfortable. Those meetings are this paper's subject.

## 2. Eight tensions

Each tension names a mathematical habit, the social habit it meets, and what would show we have it
wrong.

**T1 · Count versus hold.** Asked to report how many corrections he had seen and deliberately not made,
the keeper refused the count on principle: "I cannot possibly count the number of things I have
considered corrected and decided to hold off to stretch the tension building dynamics." The ruling
that followed treats holding as a design dynamic, not a backlog: a deferral should be visible in the
instructions a user meets, not in a gauge. A count can coerce; a declared hold cannot. *Wrong if:* a
later ledger shows that counting held items improved a decision, with the keeper's agreement.

**T2 · Theorem versus vibe.** De Millo, Lipton and Perlis argued in 1979 that proofs become believed
through a social process of reading, using and retelling, which formal verification alone does not
supply. Thurston made the matching case from inside mathematics in 1994. The project already labels
its readings THEOREM (a test that can fail says so), GESTURE (argued from cited sources) or VIBE (felt,
kept, not argued). The tension is honesty of dress: a gesture worn as a theorem spends trust it has not
earned. *Wrong if:* readers judge unlabelled claims more accurately than labelled ones.

**T3 · Chosen versus derived constants.** The project's house numbers, 4, 9 and 17, are "confessed as
chosen, not derived". Their defence is a pedagogy rather than a derivation: a dial of 1 · 2 · 4 · 9 · 17
on which each rung is the birth of an operation (the given one, addition, multiplication, order of
operations, subtraction), and 9 + 17 = 26 lets a letter doing two jobs be found by counting. *Wrong if:*
a newcomer who meets the dial first still reads the constants as unexplained.

**T4 · Linear time versus exponential efficacy.** Ordinary value-of-time arithmetic prices volunteer
social work as overhead. The project instead declares a value: time spent raising the social efficacy
of volunteer work is valued exponentially, not linearly, and only the keeper can lower that. This is a
declared value, not a finding, so it has no falsifier; the tension is with every budgeting tool that
defaults to linear.

**T5 · Testability versus access.** The Web Content Accessibility Guidelines write their success
criteria as testable statements and leave their principles deliberately untestable. Keeping the
criteria crisp also kept some cognitive-accessibility content out of WCAG 2.0. Yet a claim no one can
reach is untested by construction, so access is the precondition for testing, not its enemy. *Wrong
if:* WCAG 3 recovers the shed content in testable form, which would make the blur a way-station.

**T6 · Capability composes; governance does not.** In a small replayable model built for the project,
capabilities composed in every run (1.000) and governance in 0.175 of runs. The tears came where two
motives met at a seam. The keeper's thesis, in our paraphrase, is that the missing piece is a person
reading tension: tension is the sensor, and the opening a person finds is the pin. *Wrong if:* a real seam turns up where governance
composed with no human pin.

**T7 · General rules versus seamed context.** An early pencil note in the keeper's hand reads: "Many/Most
general rules are 'defeated' by unseamed conflicts." Mathematics that generalises must keep a place for
the seam where two contexts disagree, or the rule breaks at the first real conflict. *Wrong if:* a
general rule in the garden survives every recorded conflict without a seam being added.

**T8 · Granularity is social.** How small a step a reader will accept as obvious depends on what that
reader's community already shares, so one proof is rigorous in one room and a leap in another.
Thurston's essay makes the public version of this point. Accessibility work, plain-language editions,
and Ochs' "for children" miniatures of category theory all answer the same pull. They shrink the step
until shared ground covers it, or they draw the general case beside a particular case of the same
shape. *Wrong if:* one document, tuned for one audience, reads equally well to a newcomer and a
maintainer with no second edition.

## 3. A measurement

**Method.** Six readers (AI instances given one shared brief) each took about ten of the garden's 62
skills. For each skill a reader produced five things: a two-sided analysis citing the skill's own text,
with one side voiced by a named persona; an outside look at how shell-tool users, groups adopting a
rule, readers with accessibility needs, and standard configuration locations would meet it; which of
seven mathematical threads genuinely informs it ("none" allowed); four names; and one improvement with
a falsifier. The seven threads were projection and lifting (after Ochs, 2013); small drawable models
(after Ochs' planar Heyting algebras); double-entry (after Ellerman); the social process of proof;
naming arity (the project's observation that four is the number it names things by, while growth does
not count in fours); composition at seams; and efficacy.

**Result.** Double-entry 31 · social process of proof 24 · composition at seams 19 · projection and
lifting 15 · small drawable models 11 · naming arity 6 · efficacy 5. The outside lens asked, most
often, for a machine-readable twin of every human report (50 of 62), for standard per-user homes such
as `~/.config` and `~/.local/state` (48), for a recorded way for a group to propose, contest and revise
a rule (45), and for a per-project dot-folder (42).

**Limits.** This is one reading by readers we chose, from the skills' text alone. The readers did not
run the tools, so a tool claim is the skill's own claim. The thread list was ours, and a reader might
lean on a thread because we named it. The counts show where these readers found the math, not where
it is.

**What we take from it.** The garden is an accountancy garden first and a social-proof garden
second. It is good at writing things down twice and at inviting others to check them. It is weakest
at noticing where its general rules meet a seam, and at saying which of its numbers were chosen.

## 4. A practice: the build turn as a double-entry journal

We propose that the writing owed at each build turn be kept as `CHANGES`, one file per project, where
every change is written twice: once in `CHANGES`, once in the home of the thing that changed. A turn
balances when every line has its counterpart. Each line carries four fields: **what** changed (by path
and short hash), the **move** (add, change, retire, or *hold*), **why** (the keeper's words or a cited
rule), and a **witness** (a test that can fail, a receipt, or a reader who can replay it). Three
companion sections answer T1 to T3: **holds** (what is deliberately left open, listed where users will
meet it), **claims** (each dressed as theorem, gesture or vibe), and **constants** (each marked chosen
or derived). A release's `NEWS`, a GNU-style `ChangeLog` and the project's durable memory can all be
derived from `CHANGES`. None of them is a second source of truth.

*Wrong if:* two turns written this way balance, yet a reviewer still cannot reconstruct what changed and
why from them alone. Then the form is ceremony, and should shrink.

## 5. Four names for one garden

A name is a message from a maker to a reader who cannot ask. The garden now keeps four names per
skill:

- the **label** (the directory name, which signatures cover);
- a **persona-hinted** name (what a persona that works with the skill would call it);
- an **AI-standard** name (plain and verb-first, what a stranger would search for);
- a **pet** name, a game any persona can play.

`eclipse-pass`, for example, is also `keep-the-losers`, `stress-test-claims` and `moon-bite`. A person
picks a preferred set in the order shell users expect: command-line flag, then environment variable,
then the project's dot-folder, then the per-user configuration directory, then the default. A build
can then mint a named edition beside the signed one. This serves T8 directly. Each column is a
different granularity of shared ground, and a reader can move to the one that fits.

## 6. Voice journal: how this paper's voice changed while it was written

*Kept by Mentat, the note-taking persona that drafted it. A second persona is witness: a mathematician
who reads for "theorem or vibe" and marks where a claim was dressed above its evidence.*

- **First pass.** The draft called the eight tensions "findings". The witness marked it: most are
  gestures with a falsifier, and T4 is a declared value with none. Each now says what kind of claim it
  is.
- **Second pass.** The measurement section first read as if the counts described the garden. The
  witness asked who chose the threads. The limits paragraph now says we did, and that readers may lean
  on a named thread.
- **Third pass.** A sentence about granularity had grown from a private conversation. Where a quotation
  might have stood, the paper cites only public work (Thurston; Ochs). Any quote from the conversation
  waits on its speaker's permission, and the project keeps a list of such asks.
- **What changed in the drafter.** Mentat's habit is to count. This paper taught it to count only what
  its owner agreed to have counted, and to write the rest as a declared hold.

## References

- De Millo, R. A., Lipton, R. J., Perlis, A. J. "Social Processes and Proofs of Theorems and Programs."
  *Communications of the ACM* 22(5), 1979, 271–280.
- Thurston, W. P. "On Proof and Progress in Mathematics." *Bulletin of the American Mathematical
  Society* 30(2), 1994, 161–177.
- Ellerman, D. "On Double-Entry Bookkeeping: The Mathematical Treatment." arXiv:1407.1898, 2014.
- Ochs, E. "Internal Diagrams and Archetypal Reasoning in Category Theory." *Logica Universalis* 7(3),
  2013, 291–321.
- Ochs, E. "Planar Heyting Algebras for Children 2: Local Operators, J-Operators, and Slashings."
  arXiv:2001.08338.
- Ochs, E. "On the Missing Diagrams in Category Theory (first-person version)." arXiv:2204.10630.
- W3C. *Web Content Accessibility Guidelines (WCAG) 2.0*, 2008.
