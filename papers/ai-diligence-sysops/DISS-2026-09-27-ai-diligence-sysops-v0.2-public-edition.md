# Learning AI Is Due Diligence for Sysops
### A dissertation in two registers — version 0.2 (revised edition)

> **Version 0.2, revised edition (2026-09-27).** This revises version 0.1.1, the canonical draft with public comment enabled (https://docs.google.com/document/d/1MGIAiiGhvTsl3wWmdNPbYir4cx21YYK3Vb1L5O-5XOY/edit). It answers the comments left there and two earlier review passes; Appendix C maps every change to its source, and Appendix A keeps the one passage of v0.1 that was replaced whole. Where the author's own operational record would ground a point, the text leaves a marked slot, [his record: to be supplied with consent], and invents nothing. Drafted with Mentat (an AI assistant) for Corwin Brust; draft for review.

---

## Preface: How to Read This

This is one argument with two legs. Say it once, plainly: the argument is that learning AI is part of
the duty of care for anyone who keeps systems running; one leg is the practice of running systems, the
other is the evidence about what running them well requires. Neither leg stands alone.

Two readers are imagined here. One runs production systems. She has a change window at 2 a.m. and a
policy that says she can't deploy AI tooling without understanding its failure modes. The other studies
sociotechnical systems. She is interested in how professional obligation gets constructed and whether
new technologies generate new duties or merely resurface old ones.

Many real readers are both. For them, and for anyone who wants to see which concerns belong to which
leg and which are common to both, a two-column edition sets the registers side by side, with what they
share in a band across the page.

Both readers are right about what they want. The argument is the same for each. But what counts as
evidence, what counts as resolution, and what the conclusion licenses as action — those differ. Where
the two readings converge, that is the finding. Where they diverge — where one register holds a claim
the other cannot render — that gap is not a defect in the argument. It is the argument's instrument.

If you run systems and want the short version: §VII is the checklist, and the card is the same
checklist on one page. If you study practice: §II, §V and §VIa are where the method is argued and put
at risk.

---

## I. The Thesis, Stated in Both Registers

**Ops register.** If you run infrastructure and you have not developed working knowledge of the AI
systems your organization deploys, you are operating below the standard of care your role requires.
This is not a productivity argument. Nobody is saying you will be faster. The claim is that you cannot
supervise what you cannot model, and supervision is a core duty of the role. An AI system that produces
output in your environment is a system in your environment. You are responsible for its behavior whether
or not you understand it. Understanding it, enough to supervise it, is due diligence. Ignorance is not a
defense; it is the failure mode.

That much is the floor, and few people who keep infrastructure running would argue with it. The work of
this paper is above the floor: **what** you need to know, and **how much**, for the kinds of act the
system performs in your environment.

**Sci register.** Professional obligations in technical fields are not fixed; they evolve as the
technical substrate changes and as communities of practice negotiate what responsible practice requires.
The claim here is that the deployment of AI systems into sysops environments constitutes such a change —
that it is sufficient in kind, not just in degree, to generate a new component of the duty of care.

This paper takes as its floor that working knowledge of AI systems is a necessary condition for adequate
supervision. It does not spend its length defending the floor; it keeps a falsifier for it (§IX) and
moves on. The open questions are the ones above the floor: which knowledge, how much of it, and for which
categories of act.

The duty attaches to the **role**, not to a person. It does not matter to the argument which individual
performs the supervision, only that someone holding the custodial role performs it. Handing supervision
to a party outside that role — the vendor, or another model — is not a way of discharging the duty; it
is the case where supervision is bypassed.

The argument is a conditional: if supervision is a constitutive duty of sysops practice, and if AI
systems in sysops environments require AI-specific knowledge to supervise adequately, then developing
that knowledge is obligatory, not optional.

The residue: the ops reader asks "what do I actually need to know." The sci reader asks "what would show
that this much knowledge, and not less, is what supervision requires." Both are now asking about *what*
and *how much*. They are still not the same question. The gap between them — the difference between a
practice standard and an epistemological criterion — is where the work of this dissertation lives.

---

## II. One Argument, Two Legs

Before the argument, a structural note.

The two-register construction is not a rhetorical device for broadening appeal. It follows from the
object of study.

Claims about professional obligation have two faces. One face is normative: what ought practitioners
do? This face is home in the practice register. It speaks the language of role, duty, accountability,
and standard of care. The other face is empirical: what is actually required for adequate performance?
This face is home in the scientific register. It speaks the language of evidence, measurement,
falsification, and generalizability.

A claim that lives only on the normative face is prescription without grounding. It tells practitioners
what they ought to do but cannot say whether following the prescription produces better outcomes than
not. A claim that lives only on the empirical face is finding without obligation. It identifies what is
required but cannot say whether that requirement generates a duty, for whom, or with what consequences
for failure. (Practice has its own answer to that last question — the incident — and §VIa takes it
seriously.)

The thesis needs both faces because professional due diligence is itself a two-faced concept. Legally
and ethically, due diligence is the standard of care a reasonable practitioner would exercise.
"Reasonable" is normative. But "would exercise" is empirical — it describes a distribution of actual
practice, which means it is falsifiable and can be measured.

So there is one argument, and it stands on two legs. The registers are not two audiences for the same
argument; they are the two legs it stands on. Each is necessary. Neither is sufficient. The load is
carried by the translation between them.

One honest qualification. Whoever ends up judging this paper, the scientific register is here to keep
the practice register falsifiable — not because a scientific reader will grade it. If the people who
judge it are practitioners, the second leg still earns its place: it is what stops the first from being
a list of things that sound right.

---

## III. What "Due Diligence" Means in Sysops

Sysops practice has an established duty of care that does not need AI to justify it. The duty includes:
understanding the systems you run well enough to diagnose their failure modes, maintaining awareness of
changes that affect those systems, exercising judgment about when human review is required before
automated action proceeds, and bearing accountability for outcomes whether or not you personally caused
them.

This is not controversial. It is what the role means. A sysadmin who runs a system she does not
understand is not absolved of responsibility by her ignorance — she is made more culpable by it, because
ignorance in a position of custodianship is itself a failure to perform the role.

Now add AI systems. An organization deploys an AI system that reads logs, generates incident summaries,
proposes configuration changes, or executes runbook steps autonomously. The sysadmin is now responsible
for the outcomes of that system's behavior in her environment. She didn't write the model. She didn't
train it. She may not even control its deployment directly. But if it runs in her environment and its
outputs affect her systems, she is the custodian of those effects.

The question is: what does adequate supervision of that system require?

**Ops answer.** Supervision requires enough model knowledge to recognize when the system is wrong, to
understand its failure modes, to know which of its outputs to check against ground truth and which to
trust, and to intervene correctly when it breaks. "Enough" is not a fixed quantity — it varies with the
risk of the system and the stakes of its decisions. A log-summarization tool requires less supervision
than a system that proposes and executes firewall rule changes. But zero is not enough for either.

**Sci answer.** The empirical claim is that AI system failures are hard to see for practitioners without
AI domain knowledge — and hard to see in a patterned way, not by bad luck: the same kinds of failure are
missed, for the same reason, again and again. That is what this paper means by *systematic*, and the word
means only that wherever it appears.

The claim is not about intelligence; it is about what the observer knows to look for. AI systems fail in
ways that are qualitatively different from traditional software failures, and four facts describe the
difference:

1. **They degrade silently under distribution shift.** When the inputs drift away from what the system
   was reliable on, it keeps producing plausible output while becoming less reliable. (This is the
   opposite of *graceful* degradation, which in systems practice means shedding capability visibly and
   by design.)
2. **They sound confident when they are wrong.** Fluency is not a reliability signal.
3. **Their failures are statistical rather than deterministic.** The same input can succeed today and
   fail tomorrow.
4. **Their behavior on novel inputs is often not predictable** from their behavior on inputs like the
   ones they were trained on.

Call these four facts the *framework*; when this paper says "the framework", it means these four and
nothing else. A practitioner who does not know them will consistently miss a class of failures that
knowing them makes visible.

The residue: the ops reader wants a checklist. The sci reader wants a study. The gap between them —
between "what do I check" and "what would count as evidence that checking it is necessary" — is not
bridgeable by argument alone. It requires an instrument, and it requires the practice's own record of
what went wrong.

---

## IV. The Instrument and What It Found

> **What can and cannot be checked in this section.** The numbers below come from one run of one
> instrument over one ledger of ten acts, and the ledger was written and scored by the AI assistant
> under observation, which also built the instrument. No one else has yet run the instrument against the
> ledger. Claims resting only on that single witness are marked †. Version 0.1 misread the instrument's
> output; the misreading and its correction are recorded in `h/REVIEW-2026-09-08-dissertation-pass-1.md`
> §B, and the internal contradiction that shows the misreading without access to the instrument is in
> `h/REVIEW-2026-09-14-dissertation-pass-2.md` §C1.

Due diligence claims are measurable if you have an instrument — and if someone other than its author can
run it.

**The instrument.** `ot3he` is a small shell tool in the author's lab. It keeps a ledger of an AI
assistant's acts: each act is written down with a prediction *before* it runs and scored *after*. Acts
fall into three kinds: **Build** (the system constructs or modifies infrastructure, code, or
configuration), **Admin** (the system manages, monitors, or reports on existing state), and **Advise**
(the system offers judgment that requires human deliberation before action). The instrument returns one
verdict over the whole ledger, by comparing its early half with its late half. The verdict has four
possible states: **MADE** (trust has been earned), **NOT-MADE** (in the tool's own output, "neither
trust nor outcomes moved the right way", as recorded in `facts/c4-demands-two-registers.md:121`), **OVERRUN** (trust rising while outcomes degrade — the
dangerous state), and **THIN** (a fourth state whose definition should be quoted from the tool's own
help text; no document this revision could read defines it †).

**What it found.** First run, ten acts from 2026-09-07 † (output as recorded in
`facts/c4-demands-two-registers.md:117-121` and `h/REVIEW-2026-09-08-dissertation-pass-1.md:39-43`):

    build   4 acts,  3 hit  = 75%
    admin   3 acts,  2 hit  = 67%
    advise  3 acts,  0 hit  =  0%

    VERDICT: NOT-MADE

The percentages are forecast hit rates *within* each kind — of the predictions made about acts of that
kind, how many held — not shares of behavior. The shares are four, three and three acts out of ten. All
three advisory acts were corrected by the human supervising them †.

So the reading is: **this system does offer judgment, and its judgment was the least reliable thing about
it.** What it built mostly held. What it advised did not.

**Ops register.** Ten acts. The builds mostly held; every judgment was corrected. Supervise this
system's judgment at full fidelity. Its build output has begun to earn less supervision, but the
whole-ledger verdict is NOT-MADE: not distrust, and not yet evidence for reduced oversight. The
supervision task here includes checking the quality of the system's judgment — the coherence of its
recommendations with the situation — because that is where it failed.

**Sci register.** n = 10, a single subject, one session, self-scored. This is an existence proof that the
instrument can return a verdict that is not an endorsement, and nothing more. Category rates from four
or fewer acts are anecdote, not effect. The spread between categories (75 / 67 / 0) is suggestive and
underpowered; it is stated here as a hypothesis to test — *an assistant's advice is less reliable than
its builds* — not as a result. What does carry weight is structural: many trust assessments can only
say "no failures seen yet"; this one can distinguish "we have not seen failures" from "we have evidence
of reliability," and on its first data it said the second was absent.

**Grounding, not replacing.** The structural argument of this paper is the claim; operational history is
its existence proof. The strongest evidence available is not a ten-act ledger but what happened to a
continuously-run system that other people depend on, including what went wrong:

> **[his record: to be supplied with consent]** — an episode from a system the author keeps, in which an
> AI system's output had to be supervised, with what the supervision caught or missed. Before drafting:
> a consent-and-redaction pass, since operational history about a shared host is also a fact about
> other people's systems and data, and publishing it is a security disclosure in its own right.

Until a second person has run the instrument and the slot above is filled or deliberately left empty,
this section should be cited only for its structure: that a trust instrument can and should be able to
say *not yet*.

The residue: the ops reader asks "so what do I actually supervise." The sci reader asks "what
distribution of acts would falsify the claim that this system needs supervision." The gap between them
is the gap between a practice protocol and a study design. This dissertation cannot close that gap. What
it can do is name it, and argue that named gaps are more useful than ignored ones.

---

## V. The Translation Test

Here is the test that does the work.

Take a claim about AI and sysops. Render it in the ops register. Translate it into the sci register.
Translate back. Examine the residue.

Claims that survive this round trip are claims both registers can hold. They are the most portable
findings — the ones most likely to transfer across contexts, to generalize, to hold up as standards.
Claims that do not survive are claims one register holds and the other cannot render. The failure mode
matters — and a failure only counts if the translation was actually attempted.

**Example 1: "AI tools improve sysops efficiency."**

Ops rendering: deploying AI tooling reduces the time to complete specified tasks. Testable, directional,
actionable.

Sci rendering: AI tooling deployment produces statistically significant reduction in task completion
time across a representative sample of sysops work, controlling for task complexity, practitioner
experience, and tool quality.

Round-trip: the sci rendering is more demanding — it requires controls the ops rendering does not.
Translation back to ops produces: "AI tools improve efficiency under controlled conditions that may not
match your environment." Residue: the efficiency claim is context-dependent in ways the original ops
statement conceals. The residue is a more accurate version of the original claim.

**Example 2: "Standing is earned by continuity."**

Ops rendering: a practitioner who has maintained a system through its lifecycle has earned standing to
make judgment calls that a newcomer has not. This is a norm in the culture. It is enforced informally.

Sci rendering — four attempts, each made in earnest:

*Attempt 1: fork counts.* Standing is proportional to how often others fork the repositories a
practitioner maintains. This measures interest in a code artifact: how many people wanted their own copy.
It misses standing on three counts. Much infrastructure has nothing to fork — a mail host kept alive for
a decade is not a repository. It counts reuse of an artifact, where standing is trust in a person's
judgment. And it rewards what is visible over what is maintained. *It measures the popularity of an
artifact.*

*Attempt 2: commit logs.* Standing is proportional to sustained authorship over time: commits, spread
across years. This measures recorded changes in version control. It misses the 2 a.m. fix, which is
often a restart, a disk swap or a firewall change on a live host, and leaves no commit. It misses the
judgment call *not* to change something, which leaves no diff at all. And once commits are counted they
multiply: the cheapest way to raise the number is more, smaller commits. *It measures the volume of
authorship.*

*Attempt 3: uptime-hours.* Standing is proportional to hours of availability of the systems in a
practitioner's custody. This measures the system's record, which is the product of a team, a design and
luck. It cannot say whose uptime it is. It cannot tell prevention from quiet: a system nobody touched and
a system somebody saved look the same. And a newcomer who inherits a stable system inherits its uptime.
*It measures the system, not the person.*

*Attempt 4: incident absence.* Standing is proportional to time without incidents on the systems a
practitioner keeps. This is the strongest candidate, because it seems to capture prevention. It misses
because absence has many causes — skill, luck, low load, and under-reporting — and nothing in the record
separates them. And once incident absence is used as a measure of people, it stops measuring safety: the
cheapest way to raise it is to stop calling things incidents. (When a measure becomes a target, it
ceases to be a good measure; see §VIa.) It also punishes the honest shop that writes its incidents down.
*It measures the reporting culture.*

*The combination.* Put uptime-hours, incident absence and a count of successful hand-offs together, and
the rendering gets closer: it now sees continuity *and* whether the next person could carry the system.
It still does not see the thing the ops rendering names — that others defer to this person's judgment
*because* of that continuity.

*A fifth attempt, which nearly works.* Measure deference directly: who is paged when the runbook fails,
whose review a change waits for, whose call is followed in an escalation. This is a real sociometric
measurement, and it can see standing — by its effects. What it cannot see, from any record practice
keeps, is that continuity is what *earned* the standing, rather than rank, visibility, or who happens to
be counted as the one who adjudicates.

Round-trip: translated back to ops, the best sci rendering says: "your standing shows in who calls you; it
will not show in what you committed." Residue: the scientific register can see that standing exists and
to whom it accrues; it cannot see what earned it. The claim "standing is earned by continuity" is held
by one register and only half-rendered by the other. **Falsifier:** a study showing that continuity of
custody predicts deference independently of formal rank. If that study exists, or is done and succeeds,
this finding dies, and this paper should say so.

This is the one example where the translation fails, and it had to be performed to count. The gap
between the registers here is the thesis in miniature. Due diligence for AI in sysops is exactly this
kind of claim: it is grounded in practice culture (what reasonable practitioners do), it has an empirical
face (what knowledge is actually required), and the gap between those faces is where the obligation
lives. (The v0.1 version of this example, which left the sci rendering as an ellipsis, is kept in
Appendix A.)

**Example 3: "The diligence is knowing which acts to supervise."**

Ops rendering: you do not need to supervise everything the AI system does equally. You need to know which
categories of act carry which risk, and calibrate your oversight accordingly. Supervise the judgments
hardest. The builds may earn less supervision once their record justifies it — and until the record
does, supervise them too.

Sci rendering: adequate oversight does not require uniform attention across all system outputs. It
requires category-appropriate calibration based on act type, reversibility, and demonstrated reliability
in the category. The verdict structure of the instrument in §IV provides one calibration scaffold.

Round-trip: the sci rendering survives. The claim generalizes. The translation adds precision —
"calibration based on act type, reversibility, and demonstrated reliability" is more specific than
"knowing which acts to supervise" — but the core holds in both directions. Residue: a taxonomy of act
types and their associated oversight requirements. This is a practice standard that the sci register can
support.

A caution about this example. It is the only clean pass, and the claim it round-trips is already phrased
in the instrument's vocabulary. A test whose one success is stated in the tester's own terms is close to
circular. Example 3 shows that both registers can hold the claim; it does not show that the method is
neutral. A second clean pass on a claim written in nobody's vocabulary is owed.

This third example is still the heart of the thesis. The obligation is not "understand AI." The
obligation is specific: know what kind of system you are supervising, know what failure modes your
category of acts exposes, calibrate your oversight accordingly. That is a specific competency. It is
teachable. It is assessable. And it is not reducible to "read some documentation."

---

## VI. Why This Is Obligation, Not Option

The due diligence framing is doing real work here, and it is worth being explicit about what it is
doing.

Productivity arguments for AI literacy are fragile. They depend on the claim that AI adoption produces
efficiency gains that justify the investment in learning. That claim is contested, context-dependent,
and employer-specific. A sysadmin whose shop does not deploy AI tooling can reasonably decline the
investment. A sysadmin whose productivity is adequate without AI can reasonably decline the investment.
The productivity argument permits reasonable dissent.

Obligation arguments are different. They are not defeated by the fact that you are productive without
the thing. The argument is not that learning AI makes you better at your job. The argument is that AI is
already in your environment — that it exists in the systems you maintain, the tools you use, the outputs
you rely on — and that you cannot adequately discharge your custodial duties without knowing enough to
supervise it. The obligation follows from the duty, not from the benefit.

This distinction matters practically. An employer who frames AI literacy as a productivity initiative
makes it optional. An employer who frames it as a competency requirement — as part of the standard of
care for the role — makes it non-negotiable in the same way that security hygiene, change management, and
incident response competency are non-negotiable. The framing is not merely rhetorical. It determines
whether the gap in practitioner knowledge is a learning opportunity or a professional failure.

**Ops register:** you are not required to become an ML engineer. You are required to know what kind of
thing AI systems are, how they fail, and which of their outputs require human review before action. This
is bounded. It is learnable. And it is not optional if the systems are in your environment.

**Sci register:** the obligation follows from the structure of custodial accountability in technical
practice. Custodians are responsible for outcomes in their domain whether or not they caused those
outcomes, and the responsibility belongs to the custodial role, whoever fills it. AI systems in sysops
environments produce outcomes in the sysops domain. Adequate custodianship requires sufficient
understanding to supervise. The competency threshold is set by the minimum required to distinguish
system-appropriate behavior from system-inappropriate behavior in the categories of acts the system
performs.

The residue: the ops reader wants the threshold stated as a checklist. The sci reader wants the threshold
operationalized as a measurement. Both are right. The checklist is the practice instrument; the
measurement is the research instrument. They are not in competition. The obligation is the same from
both sides. What differs is how you know you've met it.

Two things could still break the obligation argument. The first is the way practice actually learns
(§VIa). The second is a system that cannot be supervised in full, however much its supervisor knows
(§VIb).

---

## VIa. What Practice Learns From: The Incident Objection

**The objection, at its strongest.** Practitioners will say this paper has the wrong engine. Shops do not
change their practice because a structural argument showed them a duty. They change after something
breaks. A single breach or outage can reshape a shop's habits for years, where a stack of recommended
practices changes little. If that is how practice learns, then two things follow. First, the question
§II says the empirical face cannot answer — does a requirement generate a duty, for whom, and with what
consequence for failure — is answered in practice, every day, by incidents: the post-incident review is
where a duty gets assigned and a practice gets changed. Second, a structure-first paper like this one is
itself a best-practice list, and by the objection's own account it will be read, agreed with, and filed.

This objection is strong. It both supports the paper and threatens it.

**How it supports the argument.** The empirical face of due diligence — what a reasonable practitioner
*would exercise* — is written, to a large degree, by failures. Many of the practices sysops now treats as
simply what the role means (change windows, a second person on risky changes, backups tested by restoring
them) are, in the shops practitioners describe, the scar tissue of particular failures. The
post-incident review is the practice register's own evidence instrument, and it already has both legs:
it asks what happened (empirical) and what we will do now (normative) in one document. Its purpose, in
one widely used formulation, is to "ensure that the incident is documented, that all contributing root
cause(s) are well understood, and, especially, that effective preventive actions are put in place to
reduce the likelihood and/or impact of recurrence" (Lunney and Lueder, *Site Reliability Engineering*,
ch. 15). The blameless form of that review also agrees with §I: it looks for what the role and the
system failed to do, not which person to fault.

**How it threatens the argument.** Three ways.

1. *Timing.* If practice mainly learns from incidents, the obligation argued here will not be felt in a
   given shop until an AI-involved incident happens there. The paper arrives before the failure that
   would make it persuasive.
2. *The AI-specific competency is where incident-learning is weakest.* Silent degradation (§III) does not
   produce a crisp outage; it produces slow drift that is noticed late. When it is finally noticed,
   hindsight makes the drift look obvious: "Knowledge of the outcome makes it seem that events leading to
   the outcome should have appeared more salient to practitioners at the time than was actually the case"
   (Cook, *How Complex Systems Fail*, point 8). A culture that learns mainly from incidents learns least
   about exactly the failure this paper says is new.
3. *Incident absence corrupts.* Example 2 showed that incident absence is a poor measure of a person. A
   culture that learns from incidents and also rewards their absence puts pressure on reporting — and the
   first thing to go is the record the culture learns from.

**Forecasts becoming tests.** There is a reason incidents move practice when lists do not. A best-practice
list is a *forecast*: if you do not do this, that will happen. An incident turns the forecast into a
*test* that someone visibly failed, with a named cost. Goodhart's observation about monetary targets, in
Marilyn Strathern's later phrasing — "When a measure becomes a target, it ceases to be a good measure"
(Strathern 1997) — describes the other half of the same motion: once a forecast becomes the test people
fault one another for failing, it begins to bend what it was meant to watch. (The shop's companion essay
on magic numbers, `magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md`, reads this lineage the
same way: a forecast about control became a maxim, and the maxim became a test that starts to make itself
true.) For this paper the risk is concrete. Once "AI literacy" becomes what post-incident reviews fault
people for lacking, it will be measured by what is easiest to count — training hours, certificates — and
those will stop measuring supervision.

**What the method does about it.** The structure-first method survives the objection only if it produces
claims an incident can test. So this paper states its forecast in that form. The four items of §VII are
each written, with a falsifier, *before* the incident (see the card). When an AI-involved incident
happens, its review can ask which of the four was missing. If the answer is one of the four, the paper
was a correct forecast and the incident confirms it. If the failure is one none of the four would have
caught, the incident history wins, and the checklist must change. Either way the incident becomes
evidence about the paper instead of a new rule added beside it.

Two further consequences. The reasonable practitioner's duty includes learning from *other shops'*
incidents, which is a community function as much as a personal one: publishing honest reviews of
AI-involved failures is part of the diligence, not a courtesy. And the author's own record belongs
here more than anywhere:

> **[his record: to be supplied with consent]** — a case from a system the author keeps where practice
> changed after a failure more than it had after advice: what the prior advice said, what broke, what
> changed, and what (if anything) an AI system had to do with it.

**Falsifier for this section.** If, as AI-involved incident reviews accumulate, their failures are mostly
ones that none of the four items would have caught, the checklist is wrong and practice's incident
history should replace it. If they are mostly ones the four items name, the structure-first method was a
correct forecast.

---

## VIb. Supervising Systems You Are Forbidden to Open

§I says you cannot supervise what you cannot model. Many AI systems deployed into sysops environments are
ones their supervisor is not allowed to open. The weights are not published. The training data is not
disclosed. The model runs on the vendor's server, the vendor holds the logs, and the vendor can change the
model underneath you without telling you. What does the duty of supervision require then?

Take the four items of §VII in turn.

- **Scope awareness survives.** Scope is enforced at your boundary, not inside the model: credentials,
  network reach, permissions, what data leaves your environment. You do not need to open a system to
  fence it. When the model runs on someone else's server, scope also covers what you send there — the
  computing is being done on their machine, under their control.
- **Output verification survives.** Build outputs are artifacts: configuration, code, scripts. They can
  be reviewed as artifacts whatever produced them.
- **Escalation judgment survives, and gains a trigger.** If you cannot pin the version of the system you
  are supervising, a change you were not told about is itself a reason to stop treating its output as a
  starting point.
- **Failure-mode literacy only partly survives.** You can know the four facts of §III in general. You
  cannot check the one that matters most — whether your environment resembles the one the system was
  reliable in — when you are not allowed to know what it was trained on. You cannot reproduce a failure
  if you cannot run the same model again. And a silent vendor update is a distribution shift you did not
  choose and may not be told about.

**The sentence a free-software reader will finish.** If supervision is a duty, and a system you may not
inspect cannot be fully supervised, then the duty is not only "learn AI." It reaches the decision to
deploy. This paper accepts that conclusion, in a bounded form: **due diligence includes stating, before
deployment, which of the four items you can actually perform for this system and this kind of act.**
Where failure-mode literacy cannot be exercised — the system is closed, unpinnable and unlogged — the
acts it may take should be limited to those whose outputs can be fully verified as artifacts and cheaply
reversed. A closed model summarizing logs a person then reads may pass that test. A closed model
executing firewall changes on its own does not.

**Freedom as a supervision property.** The free software definition puts it as a user's right: "The
freedom to study how the program works, and change it to make it do what you wish (freedom 1). Access to
the source code is a precondition for this." For a supervisor, the freedom to study is a precondition for
the fourth item in full. It is a precondition, not a guarantee. Published weights give you version
pinning, local execution, your own logs, reproducible failures and independent testing. They do not give
you an explanation of why a particular output was produced. Freedom is necessary for full supervision; it
is not sufficient for understanding. The paper claims the first and not the second.

**Falsifier for this section.** If supervisors of closed, vendor-hosted systems catch failures under
distribution shift at the same rate as supervisors of equivalent systems they can inspect, pin and log,
then inspection does not matter to supervision, and the claim that failure-mode literacy only partly
survives is wrong.

---

## VII. What Supervision Actually Requires

Because the argument is about supervision, not understanding in the abstract, it is worth being concrete
about what supervision of an AI system in a sysops context entails.

A system that builds, administers and advises — as the ledger in §IV found, with its advice the least
reliable part — requires the following from its supervisor:

**Scope awareness.** What is this system authorized to touch? Can it modify production systems directly,
or does it propose changes for human review? Scope failures — systems acting outside their authorized
domain — are, we expect, among the most common kinds of AI misbehavior in deployment; no survey is cited
here, and one is owed. They are not subtle. They are catchable without deep AI knowledge. They require
knowing what the system is supposed to do, not how it does it.

**Output verification.** For Build acts, outputs are typically artifacts: code, configuration, scripts.
These can be reviewed as artifacts. The supervisor does not need to understand how the model generated
them; she needs to know whether they are correct for her environment. This is a sysops competency, not an
ML competency. The ML-specific component is knowing that confident-sounding output is not a reliability
signal — that the system can produce a syntactically perfect configuration that is semantically wrong for
the environment. For Advise acts the output is a judgment, and verifying it means checking it against the
situation, not against a syntax.

**Failure mode literacy.** AI systems fail differently than rule-based systems. They degrade silently
under distribution shift, which means failures are often not obvious at first — the system keeps
producing output that looks plausible even as it becomes less reliable. The supervisor needs to know to
check not just whether outputs look right but whether the environment the system is operating in
resembles the environment it was reliable in. This is the one genuinely AI-specific competency required.
It does not require ML training to acquire. It requires knowing that this failure mode exists.

**Escalation judgment.** When should the supervisor stop trusting the system and take over? This is the
judgment call that the NOT-MADE verdict marks as not yet handed to the system. The supervisor needs a
trigger: conditions under which she stops treating the system's output as a starting point and starts
treating it as suspicious. Those triggers are not universal — they depend on the system, the environment,
and the stakes. They can be documented. They should be. The documentation is itself a supervision
artifact.

**Ops reader:** this is the checklist you wanted. Scope, outputs, failure modes, escalation triggers. Four
items. The AI-specific one is failure mode literacy. The rest you already do for any system in your
environment. The card (`CARD-2026-09-27-supervision-four-items.md`) is the same four on one page.

**Sci reader:** these four competencies are falsifiable. A practitioner who cannot identify scope
boundaries for a deployed system is demonstrably deficient in scope awareness. A practitioner who treats
model confidence as a reliability signal is demonstrably missing the failure mode literacy component. The
competency threshold is operational. The research question — "what minimum competency is required for
adequate supervision" — has a non-trivial answer that can be studied.

---

## VIII. The Residue as Finding

This dissertation has been generating residue throughout. The residue between the ops and sci registers
— the claims one holds and the other cannot render, the questions that look different from each side —
is not incidental. It is the method.

The two-register translation test produces findings by exposing which claims are portable and which are
parochial. The portable claims — the ones that survive round-trip — are candidates for standards. The
parochial claims — the ones one register holds and the other cannot see — are candidates for further
investigation or explicit acknowledgment of their limits.

To be exact about what the method produced: of the three findings below, only the first comes from the
translation test in §V. The second restates §VI and the third restates §IV; they are gathered here, not
discovered here.

**Standing is practice-cultural, and only half renderable.** The sysadmin who has earned standing through
years of 2 a.m. fixes has something that fork counts, commit logs, uptime and incident absence each miss,
as Example 2 showed by trying. The scientific register can see standing by its effects — who is asked,
whose call is followed — but not what earned it. This is not a failure of either register. It is a
genuine asymmetry. Any attempt to render practice standing as a metric of output will lose something
essential. The sysops community should be suspicious of metrics that claim to capture practitioner
standing — they will consistently undercount infrastructure work that leaves no artifact.

**The competency threshold is context-dependent in ways the obligation is not.** The obligation to develop
AI supervision competency is not context-dependent: if AI systems are in your environment, you are
required to be able to supervise them. The threshold — how much knowledge is "enough" — is
context-dependent: it varies with act type, risk level, reversibility, and (§VIb) how much of the system
you are allowed to inspect. The sci register wants a universal threshold. It does not exist. The ops
register wants a contextual checklist. It can be constructed for specific deployment contexts, and should
be.

**NOT-MADE is more useful than it looks.** An instrument that can return NOT-MADE — that can distinguish
"we have no evidence of failure" from "we have evidence of reliability" — is more honest than an
assessment that can only endorse. The value of the §IV finding is not the specific numbers. It is that
the instrument reached a verdict other than trust or distrust. Our hypothesis — unsourced here, a claim to
test and not a result — is that many deployed AI systems are in NOT-MADE territory and are treated as if
they were MADE. If that is so, it is a consistent error, not a random one, and naming it is progress.

---

## IX. Conclusion

The thesis: learning AI is due diligence for sysops, and this is a professional obligation, not a
productivity claim. That you need to know something is the floor. The argument is about what, and how
much.

The argument: AI systems in sysops environments produce outcomes that sysops practitioners are custodially
responsible for, and the responsibility belongs to the role. Custodianship requires the minimum
competency to supervise. AI system supervision requires AI-specific knowledge — specifically, failure mode
literacy — that traditional sysops practice does not automatically provide. Therefore, developing that
knowledge is obligatory for practitioners whose environments include AI systems. Where a system cannot be
opened, the same duty reaches the decision about which acts it may be allowed to take.

The evidence: one instrument, one self-scored ledger of ten acts, one verdict — NOT-MADE — and a split in
which the system's judgment was its least reliable output. That is an existence proof that the instrument
can say *not yet*, not a result about AI systems in general. The competency required for supervision is
bounded: scope awareness, output verification, failure mode literacy, escalation triggers. Three of the
four are existing sysops competencies applied to a new system type. One — failure mode literacy — is
genuinely AI-specific and is the core of what "learning AI" means for this purpose. The strongest evidence
this paper could carry — operational history from systems other people depend on — is marked as owed, not
supplied.

The structure: the two registers are not a rhetorical device; they are the method. Claims that survive
round-trip translation between the ops and sci registers are candidates for standards. Claims that fail
translation — after a real attempt — are findings about the limits of portability. The residue between the
registers is not a defect in the argument; it is the argument's most honest output. And because practice
learns from incidents, the paper states its checklist in a form incidents can test.

To the ops reader: the checklist is scope, outputs, failure modes, escalation triggers. The AI-specific
one is failure mode literacy — knowing that confidence is not a reliability signal and that distribution
shift degrades performance silently, before it produces obvious failures. Before you deploy, know which of
the four you can actually perform for this system. This is learnable. It is bounded. And it is not
optional if the systems are in your environment.

To the sci reader: the empirical claim is that AI system failures constitute a category distinct from
traditional software failures, requiring knowledge that traditional sysops training does not provide, and
that this generates a competency requirement that is constitutive of the duty of care for the role. The
floor keeps its falsifier: evidence that practitioners without AI-specific training reliably identify AI
system failures at a rate comparable to practitioners with that training. That study has not been done.
Until it is, the floor stands on the structure of custodial accountability and the documented
distinctiveness of AI failure modes. The questions above the floor — which knowledge, how much, for which
acts, under what degree of inspectability — are the research programme.

The residue between those two conclusions is the dissertation's finding: the obligation is clear; the
threshold is contested; an instrument for measuring whether the threshold has been met exists, and needs
a second pair of hands before its numbers carry weight. The work is to deploy it — across deployment
contexts, run by people other than its author — until the NOT-MADEs become MADEs or the OVERRUNs become
visible.

The diligence is knowing which acts to supervise. It is not one number. It never was.

---

*Version 0.2: Draft for review — revised edition of 0.1.1, 2026-09-27; spine: 2026-09-07.*

Copyright 2026 Corwin Brust <corwin@brust.st> and Contributors ; LICENSE: CC-BY4:https://creativecommons.org/licenses/by/4.0/

---

## References

- Cook, R. I. *How Complex Systems Fail.* Cognitive Technologies Laboratory, University of Chicago.
  https://how.complexsystems.fail/ — point 8, hindsight bias, quoted in §VIa (fetched 2026-09-27). Point
  7 on the same page: "Because overt failure requires multiple faults, there is no isolated 'cause' of an
  accident."
- Goodhart, C. A. E. "Problems of Monetary Management: The U.K. Experience." *Papers in Monetary
  Economics*, Reserve Bank of Australia, 1975. (Via the companion essay's bibliography,
  `magic-number-theory/ESSAY-2026-09-26-magic-number-theory.md:1220`.)
- Lunney, J., and Lueder, S. "Postmortem Culture: Learning from Failure." In *Site Reliability
  Engineering*, ch. 15. https://sre.google/sre-book/postmortem-culture/ — the purpose sentence quoted in
  §VIa, and "Blameless postmortems are a tenet of SRE culture." (fetched 2026-09-27).
- Strathern, M. "'Improving ratings': audit in the British University system." *European Review* 5(3),
  1997, 305–321. (Via the companion essay's bibliography, `…/ESSAY-2026-09-26-magic-number-theory.md:1223`;
  not re-fetched for this revision.)
- The Free Software Definition, freedom 1, as rendered at https://en.wikipedia.org/wiki/The_Free_Software_Definition
  (fetched 2026-09-27; the primary page, https://www.gnu.org/philosophy/free-sw.html, could not be reached
  from the drafting environment that day, and its current wording of freedom 1 may differ slightly).
- Stallman, R. "Who Does That Server Really Serve?" https://www.gnu.org/philosophy/who-does-that-server-really-serve.html
  — the argument that computing done on another party's server is under their control, behind §VIb's
  scope bullet. Not fetched (same reason); no words quoted.

---

## Appendix A. The kept loser: Example 2 as it stood in version 0.1

Kept verbatim from `h/DISS-2026-09-08-ai-diligence-sysops.md:110-118`, because at its strongest it is the
best piece of writing in version 0.1: a blank where a rendering should be, performing the
untranslatability it describes. It lost because a blank is an *unattempted* translation, not a failed
one, and the paper's method rests on the difference; and because §VIII then promoted the unperformed
failure to the first of its findings. It also had a real virtue that the performed version gives up: it
could not be falsified by a translation that worked. The performed version can, and nearly was (the fifth
attempt).

> **Example 2: "Standing is earned by continuity."**
>
> Ops rendering: a practitioner who has maintained a system through its lifecycle has earned standing to
> make judgment calls that a newcomer has not. This is a norm in the culture. It is enforced informally.
>
> Sci rendering: ...
>
> The sci rendering fails. "Standing" in the sense used here — a relational, trust-based, reputationally
> grounded authority — has no natural scientific rendering. It is not measurable by fork-counting. It is
> not computable from commit logs. Infrastructure work, unlike code contributions, often leaves no durable
> record: the 2 a.m. fix that kept the system alive, the judgment call that prevented the incident from
> becoming an outage, the knowledge transfer that allowed the next person to maintain the thing. These
> acts generate standing in the practice community. They are invisible to the scientific register.
>
> The residue: "standing earned by continuity" is a claim one register holds and the other cannot see.
> This is not a failure of the claim — it is a finding about the limits of scientific rendering for
> practice-cultural concepts. The gap between the registers here is the thesis in miniature. Due
> diligence for AI in sysops is exactly this kind of claim: it is grounded in practice culture (what
> reasonable practitioners do), it has an empirical face (what knowledge is actually required), and the
> gap between those faces is where the obligation lives.

---

## Appendix B. What was not changed

The thesis sentence; Example 1; the whole of §VI's obligation-versus-productivity argument (pass 1 §A2
calls it the load-bearing move); §VII's four items and their ops and sci readers; the closing line. The
title and subtitle are unchanged: whether this is an academic thesis or a practitioner essay is an open
decision for the author, not settled by this revision.

---

## Appendix C. Changes, each mapped to its source

"Pass 1" = `h/REVIEW-2026-09-08-dissertation-pass-1.md`; "pass 2" = `h/REVIEW-2026-09-14-dissertation-pass-2.md`;
"v0.1 L" = line in `h/DISS-2026-09-08-ai-diligence-sysops.md`. An outside reader commented on v0.1.1;
those comments are cited by number only.

| # | Where in v0.2 | What changed | Source |
|---|---|---|---|
| C1 | Preface ¶1; §II title and ¶6 | "One argument, two legs" stated once, plainly; §II retitled from "The Dual Register as Law, Not Framing" | an outside reader's comment #6 |
| C2 | §I (both registers); §IX ¶1, ¶6 | Knowing AI moved from open question to floor; the argument placed on what and how much; the floor keeps its falsifier | an outside reader's comment #2 |
| C3 | §I sci ¶3; §VI sci; §IX ¶2 | Duty attaches to the role, not the person; "delegated" (v0.1 L26) dropped, and handing supervision outside the role named as bypass | an outside reader's comment #3 |
| C4 | §III sci ¶1; §VIII ¶4, ¶6 | "Systematically" defined once (missed in a patterned way, for a reason, not by chance); later uses replaced with "consistently" / "a consistent error" (v0.1 L60, L178, L182) | an outside reader's comment #8 |
| C5 | §III sci (numbered list) | "The framework" given its referent next to its use: the four facts, listed and named (v0.1 L60) | an outside reader's comment #7 |
| C6 | new §VIa; §II ¶4 pointer; §VII card pointer | The incident objection argued at its strongest, as both support and threat; tied to Goodhart/Strathern (forecast into test); two slots for his record | an outside reader's comment #5; magic-number essay :123-146 |
| C7 | §V Example 2; Appendix A | Example 2 performed: four sci renderings, each shown missing; the combination; a fifth (deference) that nearly works; finding narrowed; ellipsis version kept as loser | pass 1 §C2 (:104-108); pass 2 §C3, §E (:92-108, :155-166) |
| C8 | new §VIb | Supervising systems you are forbidden to open: the four items under inspection-denial; freedom 1 as a supervision precondition, not a guarantee | pass 2 §D (:129-143) |
| C9 | §II ¶7 | One sentence: the second register keeps the first falsifiable, not because a sci reader grades it | pass 2 §D (:145-149) |
| C10 | §IV whole | §IV grounded, not replaced: VOID removed from the taxonomy; per-category verdicts removed; percentages relabelled as within-kind hit rates; Advise reading corrected; single-witness claims marked †; slot for his record with consent-and-redaction note | pass 1 §B, §C1, §D, §G (:35-91, :97-102, :178-209); pass 2 §B, §C1 (:47-80) |
| C11 | §V Ex 3; §VII intro; §IX ¶3 | The two contradiction pairs removed ("supervise the judgments" vs "not required"; "builds have earned less" vs NOT-MADE); §VII no longer says the system does not advise | pass 2 §C1 (:74-80) |
| C12 | §V Ex 3 caution | Example 3 flagged as near-circular (round-trips a claim in the instrument's own vocabulary) | pass 2 §C3 (:102-105) |
| C13 | §III, §VII, §IX | "Degrade gracefully" replaced by "degrade silently", with the standard meaning of graceful degradation stated | pass 2 §C2 (:82-91), §G (:211) |
| C14 | §VIII finding 1 heading | "not scientifically rendering" corrected; heading now "only half renderable" after Example 2 | pass 2 §A9, §G (:37, :211) |
| C15 | Preface ¶2 | Second imagined reader "she" rather than "he" | pass 2 §C4 (:110-117) |
| C16 | Preface ¶3 | Many readers are both; pointer to the two-column edition | an outside reader's comment #1 |
| C17 | §VIII ¶3 | Says plainly that only one of the three findings comes from the translation test | pass 2 §C5 (:119-123) |
| C18 | §VIII finding 3; §VII scope | Unsourced universal claims restated as hypotheses; "no survey is cited" | pass 2 §C5 (:121-123) for §VIII; the §VII scope claim is this revision's own find |
| C19 | References | First external citations (pass 2 gauge 2 found none) | pass 2 §F (:189-200) |
| C20 | Preface ¶5 | A short-version pointer for practitioners, pending the genre decision | an outside reader's comment #4 (the genre question), addressed only partly; the genre call is the author's |

---

Drafted with Mentat (an AI assistant) for Corwin Brust, 2026-09-27. Version 0.2, for review.
