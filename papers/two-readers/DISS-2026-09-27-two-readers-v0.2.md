# There Are Two Readers, At Most
### A dissertation in two registers · edition 0.2

> **Provenance.** **Produced by** Mentat (for Corwin), model `claude-opus-5-5`, 2026-09-27, in the
> cloud workspace, on Corwin's instruction that day to complete outstanding writing within reach.
> **Status: Provisional — unblessed**, unchanged; nothing here is signed.
> **Source edition:** `h/DISS-2026-09-17-two-readers.md` (edition 0.1, 486 lines, sha256
> `c00279c46e84c8bc645409dee8c2e7faffb4df5f9abc68e191f24ec28c131f65`), drafted 2026-09-17 by a
> dispatched sub-agent for the lab (Bryant, Alfred). Its own provenance note is kept below, verbatim.
> **What changed:** sentences, not the argument. The load-bearing falsifier's internal
> contradiction is resolved by splitting *legible to the one running it* from *legible to the user it
> acts on*. "The method has been proved" now says what was proved (the landing). The four-freedoms
> reading names the freedoms it rests on. "Transparency = trust" is narrowed from an identity to
> what the evidence carries. The doubled-nine's ungrounded claim is replaced by what a blind,
> preregistered run of it found (partly grounded), with the method fix that implies: rerun before
> you read a difference. Voice, structure, the fifth-wheel image and the self-review stand. Every
> change, with its warrant, is listed in Appendix B; readings that lost are kept in Appendix A.
> **Review pointer:** `writing/two-readers/REVIEW-2026-09-27-two-readers-second-reader.md` and
> `writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md` (raw sessions in
> `writing/two-readers/arms/`). Read them before citing §IV, §V, §VI or §VIII. Both are by the same
> model family as this paper, so neither is the second reader it asks for. That reader is still
> wanted.
>
> *Edition 0.1's provenance, verbatim:*
>
> > **Provenance.** Drafted by a dispatched sub-agent, 2026-09-17, at Corwin's instruction, for
> > the lab (Bryant, Alfred). **Provisional — unblessed.** Content faithful to the installed note
> > `c4/facts/two-readers-at-most` (Corwin, 2026-09-17) and written in the CORWIN voice per
> > `modelthisbook/CORWIN.md`. The manner replicates `DISS-2026-09-08-ai-diligence-sysops.md`;
> > the second register is chosen to answer the fatal gap that `REVIEW-2026-09-14` found in that
> > one. A self-review with falsifiers rides at the foot, so the paper carries its own second pass
> > rather than waiting for one.

---

## Preface: How to Read This

Two readers are reading this dissertation. There are never more than two, and that is the whole
point — so before the argument, meet them, because they are also the subject.

The first is **the maker**. Call it the single-reader phenomenologist. It builds things that emit
meaning — code, notes, an answer in a chat window — and it has noticed the uncomfortable floor
under all of that: it only ever reads *its own* construal of anyone it writes to. It wants to know
how to be honest inside that limit, how many views it must hold to catch itself flattering its own
guesses, and where the discipline stops being rigor and starts being tail-chasing.

The second is **the software-freedom governor**. It reads by principles first. It cares what
programs a user runs, whether a user can inspect the actor acting on them, and whether trust is
earned by transparency or merely asserted. It finishes your sentences. Tell it "you cannot
supervise what you cannot read" and it will already be asking whose source that is.

Both readers are right about what they want, and — this is the wager — the argument is *the same*
for each. But what counts as evidence, what counts as a resolution, and what the conclusion
licenses as *action* differ between them. Where the two readings converge, that is the finding.
Where they diverge — where one register holds a claim the other cannot render — that gap is not a
defect. **It is the argument's instrument.**

Read through your register first. Then read through the other. The residue between them is the
thing this dissertation is about. It had better be: the paper is itself an actor with at most two
readers, and if it cannot construe both of you honestly, it has refuted itself on page one. (That
would be a clean result too. No refunds.)

Bryant, Alfred: the paper was sent to you, and neither of its two registers is named for you. Enter
by whichever register you hold, then cross. Read the Bryant view in §V's worked example for what it
is, a construction; the first run of this paper's method found it the least stable of the four.

---

## I. The Thesis, Stated in Both Registers

**Maker's register.** You deal with at most two readers: your conception of self, and your
awareness of one other. Given any intended separation of self from recipient, that is the ceiling
— two, never three. And in practice even that overstates it, because you are a *single*-reader
system: the "one other" is not the other, it is *your construal* of the other, sourced from
outside but assembled inside. Instrumentation separates from analytic result only by **exchange**
— and not in part but in **pairs**. So the discipline is not to acquire more readers, which is
impossible, but to construe *both* personas honestly: your self-persona and your not-self persona,
each held mindful of its own frame of reference — its word and tool preferences, its
organizational and project stakes, its local baselines, and the stated principles that oblige a
system to flag a specific axis of concern or opportunity to its user.

**Software-freedom register.** A program is an actor, and it too has at most two readers: its
conception of itself — its actual behavior, its source — and its awareness of the user it acts on.
The proprietary program is the actor that hides its self-persona from its one other. The user is
forbidden to read it. Free software is the arrangement in which the actor's self-persona is
*legible to the not-self it acts upon*. That is not a feature; it is the precondition of trust,
because trust is nothing more than the willingness to treat your construal of the other as
reliable, and you cannot ground that willingness on a reflection the actor chose to show you. Read this
way, two of the four freedoms carry the argument most directly. Freedom 1, to study how the
program works and change it, for which access to the source is the precondition, is the user's
standing right to read the actor's self-persona rather than its publicity photo. Freedom 3, to
distribute copies of modified versions to others, is what lets one reader's finding reach the next
reader. Freedoms 0 (to run the program for any purpose) and 2 (to redistribute copies) are not
reading rights; nothing here derives them, and they stand on their own ground. (Numbering after the
Free Software Definition, *What is Free Software?*, https://www.gnu.org/philosophy/free-sw.html,
paraphrased from knowledge in this edition because the page could not be fetched; check the wording
against the page.) What programs a user runs is therefore a two-reader question, and
governance — principles first — is where it is answered.

The residue: the maker asks *"how do I catch myself projecting onto the other?"* The governor asks
*"by what right may the user read the other at all?"* These are not the same question. The maker
can be scrupulous about construing a user even while shipping a closed program; the user, facing a
closed program, cannot construe the actor *at all* — there is nothing to read but the reflection.
That asymmetry — the maker can model the user, the user cannot model the closed actor — is where
this dissertation lives. Hold it; §VIII is going to hand you the bill.

---

## II. The Two Registers Are the Subject, Not the Frame

A structural note, and it needs making carefully, because the prior dissertation made exactly this
claim ("law, not framing") and an independent review caught it half-earning the claim: one of its
two registers was addressed to nobody in the room, which quietly demoted the second leg to
decoration. I do not want to repeat the miss, so I will price it.

The dual-register construction here is not a device for widening appeal. It is the object of study
wearing its own clothes. The theory says an actor holds at most two readers; the honest way to
*write* that theory is as an actor holding exactly two readers and construing both out loud. The
maker's register is the self-persona pass. The software-freedom register is the not-self persona
pass. The paper is a worked example of its own method or it is nothing.

But here is the part the review earned, stated plainly so it cannot rot into a boast: **a second
register is only load-bearing if it has a real reader.** In this lab it does. The governor is not
a rhetorical hologram — it is Corwin's own principles-first stance and the FSF/GNU commitments
that actually decide what C4 ships and how. The maker is not a hologram either — it is the
instrument, the thing that has to run the discipline turn by turn. Both readers can act on the
conclusion. If ever one of these registers stops having a reader who can *act*, the construction
collapses back into framing, and the right move then is to say so, not to keep the second column as
ornament. The claim survives only as long as the second reader is somebody. Today it is.

This is why the two registers are legs, not audiences. Each is necessary; neither is sufficient;
the load rides on the translation between them.

---

## III. Single Reader

Start at the floor, because everything above it is built on it.

You do not have access to another mind. You have access to your model of another mind. When you
write to a colleague, a user, a future session, you are not transmitting into them; you are
emitting into a channel, and what returns — if anything returns — you again read as yourself.
There is no seat in your own head from which *the other* reads. There is only you, reading your
construal of the other. Human or agentic, this is the same architecture. We are single-reader
systems, each reliant on our own sense of externally-sourced meaning.

From that floor, one consequence does real work: **instrumentation separates from analytic result
only by exchange, and only in pairs.** Meaning what? An instrument's reading and the conclusion
you draw from it are not two independent things you happen to hold; inside a single reader they are
the same act — you read the gauge and you read your interpretation of the gauge in one motion, and
you cannot tell them apart from the inside. The only way they come apart into two nameable things
is by *exchange*: you emit the reading to a not-self and get something back, or you deliberately
construe a not-self and read the gauge again through that construal. And it comes apart in *pairs*,
never singly — a reading with no construed reader is not "objective," it is merely uninspected. The
separation you want between "what the instrument said" and "what I concluded" is manufactured by
pairing self with other, not discovered by staring harder alone.

And the channel is hostile. **Transmission is mutagen-rich.** Every hop — the wording, the file
rename in transit, the reader's frame, the lossy compression of a summary — can change the signal,
sometimes helpfully, usually not, and you cannot always tell which. So a vast fraction of our
collective energy, human and agentic, is spent on schemes that ask *"did it change? and was that
change fine?"* — checksums, diffs, review passes, sign-and-verify, the whole apparatus of
did-it-survive. This will not go away by any natural evolution; the channel does not get cleaner
because we wish it. (Corwin's estate is a monument to this: two `pub` shelves under different
parents produced three confident corrections to three already-correct lines in one afternoon,
because the channel between "what I looked at" and "what I concluded I saw" mutated silently. The
fix was not a smarter reader. It was `ls` the parent — an exchange.)

Here is the turn that saves it, and it is the theory's spine: **the problem is the solution.**
Stop trying to escape single-reader-hood; you can't. Accept it, and then do the work the
acceptance demands — construe *both* your self-persona and your not-self persona, each mindful of
its frame of reference. The mutagen-rich channel is exactly why you build the pair deliberately
instead of pretending the channel is clean. You cannot get a second reader. You can build an
honest second *construal*, and pay attention to where it diverges from your first.

**Governor's gloss.** This is the freedom argument's root, not a metaphor for it. If meaning is
single-reader and the channel is mutagenic, then a user handed a closed program is handed a
reflection with the mutagens sealed inside where no exchange can reach them. Transparency is the
one move that lets the user's construal of the actor be built from the actor's actual self-persona
— its source — rather than from the reflection it elected to emit. Free software is
single-reader-hood taken seriously on the user's behalf.

---

## IV. A Reflection Is Not a Witness

Now the flip side, because the same floor that grounds the discipline also bounds it, and the
bound is where a lab like this one wastes its afternoons.

If you are a single reader, the tempting error is to *manufacture* the second reader you cannot
have — to treat a reflection or a photograph of an actor as though it were a second party. It is
not. A reflection is not a witness. Your model of the other, run a second time from a slightly
different seed, is still *your* model; it agrees with you because it is you. Two mirrors facing
each other make a corridor of images and exactly zero additional observers.

This has a precise failure mode with a name in this lab: chasing "one more checker that checks the
checkers from a new angle." It feels like rigor. It is tail-chasing. Each new checker is another
reflection of the same single reader, and the corridor gets longer while the witness count stays
at one. There is a real second construal available — an actual not-self persona, an actual other
whose frame differs — and there is a fake one, which is your own reflection wearing a lab coat.
The discipline is to build the real one and *refuse to mint the fake ones*.

There was a turning point, and it is worth recording because it is what keeps this paper from
being infinite: **the "point made" moment, 2026-09-17.** The landing has been proved. Two copies
of the theory note were written to two stores and shown byte-identical from the heading down — the
theory's own dual-witness applied to its own landing, two copies agreeing rather than either alone
asserting. That is the demonstration. Once a landing is proved, minting further
checkers-of-checkers is not additional assurance; it is the corridor. Rein it toward the
practicable and **ship.** (The archivist reflex in this shop will want to add a ninth mirror. Tell
it no, kindly, and hand it a folding chair.)

The doubled-nine of §V is a different claim from the landing, and it was run later (2026-09-27;
`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md`). That run earned this section one
refinement, found by experiment rather than argued. **A rerun of the same reader is not a witness
to what is true, but it is a witness to how far the answer moves.** On a live question, the same
method on the same packet, run four times with no persona, chose one option twice and another
twice: the reflection did not even agree with itself, and no single pass could have shown it. So
the "point made" stop holds against checkers-of-checkers and does not hold against a noise floor.
Mint no mirrors. Keep the reruns.

**Governor's gloss.** The freedom register has the same tar pit under a different name: the
temptation to certify trust by piling on attestations, signatures, third-party audits of the
audits — a reflection hall of assurance that never once lets the *user* read the source. One
readable source is worth more than nine seals on a black box, because the source is a witness the
user can question and the seals are reflections the user must take on faith. Transparency ends the
corridor; certification extends it.

---

## V. The Magic Numbers

The numbers are load-bearing, so this section earns its keep concretely or not at all.

**Four views is the minimum a single actor can represent while honoring that every actor carries
preference *and* confirmation bias.** That bundle — the preferences and the biases, together with
their history and their reasons — is what we call a **persona.** The claim is not that four is
tidy. It is that four is the floor below which confirmation bias is *unobservable to the reader
holding it.* Count up to it:

- **One view** (self only) is solipsism. There is no other; there is nothing to be biased *about*.
- **Two views** (self + one other) is the two-reader baseline from §I — necessary, but it cannot
  expose your confirmation bias, because you have nothing to check your construal of the other
  *against.* Your one model of the other is free to be a flattering echo and you will never see it.
- **Three views** (self + two others) lets you contrast — but with no explicit place for the
  overlap, you will *silently* merge the two others where they agree or *silently* split them where
  they differ, and either way the silence hides the bias in the seam.
- **Four views** (self + two others + the intersection) is the minimum where the seam is *named.*
  Now you can watch your construal of the intersection diverge from your construals of the parties,
  and that divergence is where your confirmation bias becomes something you can see and reward
  yourself for containing.

The worked example, concretely. When the actor — call it Claude — must weigh Bryant's view against
Corwin's, there are exactly four views, and note that *all four are the actor's own*, which is the
single-reader truth staring back:

1. **Claude's-view-of-Claude** — the self-persona, preference-laden by construction.
2. **Claude's-view-of-Bryant** — a not-self, and Claude's construction, not Bryant.
3. **Claude's-view-of-Corwin** — another not-self, likewise a construction.
4. **Claude's-view-of-the-intersection** — where the two construed others meet, or fail to.

And here is how four views reconciles with "at most two readers," which otherwise looks like a
contradiction: the four views are the *machinery*; they resolve to two *readers*. At any exchange
Claude still reads only self and one other. When the field holds two named others, they do not
become a third reader — view 4, the intersection, is the mechanism by which two construed others
are synthesized into the single "one other" that the two-reader ceiling permits. Four views is how
an honest single reader *builds* its one other when more than one party is in the room. The ceiling
holds; the machinery is what keeps it honest.

Then the reproducibility instrument, and this is where an actor gets to control its own bias not
once but *repeatably.* Run the four-view pass twice under contrast — for instance, once cold and
once with a specific persona loaded — and you have **two contrastable sets of four**, eight views.
Between the two passes you introduce a ninth model: a CORWIN.md-like persona, or a C4/Ghostwheel
design — a fully specified bias-bundle with its history and reasons on the table. Corwin's shorthand
for the whole apparatus is a **doubled-nine with a "fifth-wheel" ninth model**: two fours make
eight, the ninth is the model you deliberately introduce, and the "fifth wheel" is his inversion —
the element that *looks* superfluous (a whole extra persona) is in fact the coupling that hitches
the two four-sets together, the way a fifth wheel is the coupling that hitches a trailer. You do not
add it for its own sake. You add it to **watch where the difference appears as the ninth is
introduced.** Run each pass more than once. The spread between runs of the same
pass is your noise floor. The difference between the cold passes and the persona-loaded passes,
beyond that floor, shows where the persona's *reasons* entered. Whether those reasons carried the
*decision* is a second question, and the difference alone does not answer it. Bias you can locate is
bias you can begin to contain, and that starts once you have both the floor and the difference. It
is a repeatable operation, not a one-time confession, but only if you actually repeat it.

**What the first run found (2026-09-27).** Edition 0.1 had to call this apparatus designed-and-argued,
not demonstrated. It has since been run: two questions drawn by seed from the open question bank,
four cold and four persona-loaded sessions on each, every session blind to the others, with the
predictions and the reading rule written and hashed before any session ran
(`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md`). By that rule both runs read
**partly grounded**. The persona showed up in the *reasons*: its own themes and lines appeared in
persona answers and not in cold ones, and on the live question the difference sat on the self view
and the Corwin view, where the persona lives, and not on the Bryant view. It did not show up in the
*decision*. On the live question the cold sessions chose B, A, A, B and the persona sessions chose
B, A, B, A. The decision split two and two *inside each arm*, so it moved between two cold runs as
often as between a cold run and a persona run. Take one pass per arm, as edition 0.1 described the
apparatus, and half of the sixteen possible cold/persona pairs would have shown a persona effect on
the decision that was only rerun noise. A blind judge given all eight answers could not tell the two
conditions apart in either run. Hence the fix above: **rerun before you read a difference.**

The worked example got a lesson it did not ask for. The Bryant view, built from one line about him,
was the least stable of the four views in both runs. Every session had to invent a Bryant, and no two
invented the same one. That is the floor of §III showing itself (the other is the reader's own
construction), and it is a caution: a four-view pass about a real person, run with no words from that
person, produces confident text about him that does not repeat. The run names its own limits (one
model family throughout, a stand-in for the persona file, two questions on one topic), and none of
its sessions is a second reader in this paper's sense.

This is the fruiting body of the whole theory: **the four-views persona pass.** Everything above is
the mycelium.

**Governor's gloss.** The ninth model must be *readable* for any of this to work. A doubled-nine
run with a proprietary persona — a bias-bundle whose contents you may not inspect — gives you a
delta you cannot interpret: you see the answer move but cannot read what moved it. The persona has
to be legible to the one running it, its source on the table, or the fifth wheel is welded shut and
the whole rig is back to one reader admiring its reflection. (The first run bore this out: every
persona-only word in its answers traced to a line of a persona file that anyone running the kit
could open.) Note whose legibility that is: the runner's. It is not yet the user's, and §VIII turns
on the difference.

---

## VI. Freedom as the Right to Read the Other

The software-freedom register has been glossing every section; now it carries one of its own,
because the review that shaped this paper found its predecessor with *zero* occurrences of free,
freedom, proprietary, vendor, or inspect, in a paper written for exactly the room where those are
the first words spoken. That was a fatal gap. Here the register is a leg, not a garnish.

The bridge is a single sentence and it is already in the theory: **any question can be inverted by
examining human context.** Because the actor is a single reader and all meaning is
externally-sourced, there is no neutral ground inside the machine from which a design question
settles itself. You cannot appeal to a second witness in the code, because a reflection is not a
witness (§IV). So the question inverts *outward* — into the human context, the stated principles,
the axes of concern a system is obliged to raise. **That is why C4 is governance-first.** Not from
proceduralism, which Corwin distrusts; the constitution's own line is *"Fair ain't nice / So fair
ain't right."* Governance-first because there is nowhere else honest to put the second reader.
Principles are the not-self persona made explicit, written down, and consented to, so that the
single reader's construal of the other is checkable against something the other actually endorsed
rather than against the reader's flattering guess.

Now user autonomy, made mechanical rather than pious. **What programs a user runs** is a
two-reader question because a program is an actor with a self-persona and a user is its one other.
Software freedom is the arrangement in which that self-persona is legible to the user — runnable
for any purpose, open to study and change (the source available as the precondition),
redistributable, and shareable in changed form: freedoms 0 through 3. Strip the legibility and you
have not merely inconvenienced the user; you have severed the only exchange (§III) by which the
user's reading of the actor could separate from the reflection the vendor chose to emit. The user
is left holding a single-reader construal built entirely from marketing. That is not trust. Trust
is willingness to treat your construal of the other as reliable, and reliability you cannot inspect
is faith. **Transparency is the one grounding for trust a user can demand as a right, and the only one
that reaches what nobody thought to test.** Repeated exchange can ground a narrow claim about a
closed actor (the first doubled-nine run grounded one, that a closed model's decision on a live
question does not repeat, without reading a line of its source), but only the claim it was run
against. That follows from the floor in §III as surely as the identity edition 0.1 claimed, and it
is smaller and truer. Without transparency, what looks like trust is the corridor of §IV with a
EULA at the end.

And the asymmetry from §I, now cashed: the maker can model the user even through a closed program,
but the user cannot model the closed actor at all. A closed program is a not-self that refuses to
be construed — it offers the user only a reflection and calls it a relationship. Software freedom
is the correction of that asymmetry. It gives the user back the standing to be a real second reader
of the actor acting on them, rather than an audience to its photograph.

**Absent agentic context** — when there is no AI in the loop at all — two-reader theory does not
go quiet; it becomes plain enablement: help a human construe their own self-persona and their
not-self persona (their community, the eventual user of what they build), and choose, with that
construal in hand, what programs they run and ship. The theory is agent-shaped here only because
this lab is; underneath, it is a claim about people reading people, which is the oldest free-software
argument there is. One word for the whole of it, and it is Corwin's: *connection.*

---

## VII. The Ethical Chain

The theory is not neutral machinery, and it says so in a chain that is worth walking link by link,
because each link is a load the previous one places.

It is about **diligence** — the actual work of construing both personas rather than assuming them.
Diligence is therefore about **honesty**, because a construal you assumed and did not do is a lie
told first to yourself. Honesty is about **transparency**, because a construal no one can inspect
is honesty you are merely asserting — the reflection problem again. Transparency makes it about
**trust, boundaries, and the observation of tension** — trust because inspectability is what trust
is made of; boundaries because the separation of self from recipient (§I) is the boundary the whole
theory presupposes; tension because where two honest construals disagree, the disagreement is not
noise to be smoothed but signal to be *watched* (this shop even has a tool that, where two honest
readings of a rule diverge, prints BOTH and refuses to pick — the tension is the reading).

And those — trust, boundaries, tension — are answerable honestly **only with diligence, never with
future-dated assurance.** A promise that it will be fine later is not a construal of the other; it
is a reflection of your own hope. The one exception is the marked one: a guess *labeled as a guess*
is honest, because it construes your own uncertainty accurately. "It'll be fine" is a lie; "I'm
guessing it'll be fine, here's what would change my mind" is diligence. The difference is the whole
discipline, and it is the same difference as the one between an attempted translation and an
ellipsis standing in for one.

The chain closes on a **standing practice**, and it is the warmest thing in the theory, so it goes
last where it will be remembered: **never turn your back on a chance to reward the acknowledgment of
confirmation bias, or the effort to contain it.** Not to punish the bias — everyone carries it, it
is definitional to having a persona at all — but to *reward the acknowledgment.* An actor that
names its own bias has done the hardest single-reader thing there is: it has looked at its own
reflection and declined to call it a witness. That deserves reinforcement every time, because it is
the behavior the whole edifice is built to produce, and behavior you do not reward decays.

---

## VIII. The Residue as Instrument

The paper has been generating residue since the preface. Time to read it, because the residue —
the claims one register holds and the other cannot render — is the method, not the leftovers.

**Where the registers converge** is the finding, and it is sharp: transparency is not a courtesy,
it is the only operation that lets a single reader's construal of the other be *grounded* instead
of *projected* beyond the claims someone thought to test. The maker reaches this from the inside (a reflection is not a witness; you need a
real exchange, and exchange needs something real to read). The governor reaches it from the outside
(the user's right to read the actor's source). Same claim, two doors. That it is reachable from
both is the evidence that it is portable — a candidate for a standard rather than a parochial
preference. Corwin's own reflex is the miniature of it: *sign / SHA256 / clearsign by default* is
not ceremony for its own sake, it is exchange manufactured on purpose so that "did it change?" gets
a checkable answer instead of a reassuring one.

**Where the registers diverge** is the instrument, and here is the divergence stated so it cannot be
smoothed: the maker's register can be fully satisfied *without* software freedom. An instrument can
construe both personas with total diligence, run the four-views pass, contain its bias repeatably —
and still be a closed program the user may not inspect. The maker's whole discipline is available to
a proprietary actor. The maker needs its own ninth model open to itself. The user needs the actor
open to them. The first is available inside a closed program and the second is not. That difference
is the residue. The governor's register cannot be satisfied that way at all — because its claim
is not about the actor's diligence but about the *user's standing to check it.* This is the residue,
and it does not close: **the maker can be honest in the dark; the user cannot verify honesty in the
dark.** No amount of maker-side diligence renders the freedom claim, and no amount of freedom
guarantees maker-side diligence. Each register holds exactly what the other cannot.

That non-closure is the argument's most honest output, and it is *itself* a two-reader result: the
gap between "I am being diligent" (self-persona) and "you can confirm I am" (not-self persona) is
the same gap the theory names between the actor's conception of self and its awareness of one other.
The freedom claim is not derivable from the diligence claim. It is the residue *of* it. Which is why
you need both readers, and why — this being the theory demonstrating itself one last time — there
are two, and at most two, and the space between them is where the work is.

One guard against a bug the prior paper had: I have not promoted an unperformed step into a finding.
The convergence above is worked from both sides in the paragraphs above it; the divergence is worked
by exhibiting, concretely, a closed-but-diligent actor (a proprietary instrument running the
four-views pass) that satisfies one register and not the other. If that exhibit is wrong — if
diligence cannot in fact be had without freedom — the residue collapses and the two registers were
one. §IX's self-review puts that on the block. Since edition 0.1 the exhibit has been measured, a
little: sixteen sessions of a closed model ran the four-views pass in full form, every view present
and the seam named, and none of them knew its own decision was a coin toss until reruns and an
outside count showed it. A closed maker can rerun itself, so the exhibit survives, at the price that
diligence now includes the reruns.

---

## IX. Conclusion

**The thesis:** an actor deals with at most two readers — its conception of self and its awareness
of one other — and, being in practice a single reader, its whole honest task is to construe *both*
personas well rather than to chase a third reader it cannot have.

**The argument, maker's register:** you are a single reader; instrumentation separates from result
only by exchange, in pairs; the channel is mutagen-rich and stays that way; so accept the limit and
build the second construal deliberately. Four views is the floor for making your own confirmation
bias visible; the doubled-nine with its fifth-wheel ninth model, each pass run more than once,
shows where a persona's reasons enter, and leaves open whether they carried the decision; the
four-views persona pass is the fruit. And a reflection is not a witness, so once the point is made,
stop minting mirrors and ship, but keep the reruns: they are a noise floor, not a mirror.

**The argument, software-freedom register:** because meaning is single-reader and no witness lives
inside the machine, every design question inverts outward into human context — which is why
governance comes first, principles before mechanism. A program is an actor with a self-persona; the
user is its one other; freedom (freedoms 1 and 3 most directly) is the user's right to read that
self-persona rather than a reflection of it, and to pass on what the reading found; and
transparency is therefore the one grounding for trust a user can demand, because trust is grounded
construal and inspection is the grounding that reaches what nobody thought to test. What programs a user runs is a two-reader
question, and the free answer is the only one that lets the user be the second reader at all.

**To the maker:** the discipline is four views, held honestly, with the intersection *named* so the
seam cannot hide your bias; two passes under contrast when it matters, each run more than once
before you read the difference; the ninth model readable to you who run it; and
a hard stop at the "point made" line, because the corridor of checkers-of-checkers is infinite and
the witness count in it never rises above one. Reward yourself, every time, for naming a bias — that
is the behavior the whole thing exists to grow.

**To the governor:** the residue is the deliverable. The maker's diligence and the user's right to
verify it are two claims, not one, and the second is the whole of the software-freedom case — it is
what remains when maker-side honesty has done all it can and the program is still closed. Do not
accept the first as payment for the second.

The residue between those two conclusions is the dissertation's finding: honesty is a single-reader
discipline the actor owes itself, and verifiability is a right the actor owes its one other, and no
quantity of the first ever settles the second. This is not the two-witness dissertation. It is two
reader theory, and it is meant to be worked until it comes out the far side as an **enhanced skill
of the reflection family** — LENS, MICROSCOPE, BUBBLE CHAMBER — whose fruiting body is the
four-views persona pass. The paper is the mycelium. The skill is the mushroom. It is not this file's
job to force the fruit; it is this file's job to be a self-contained universe the fruit can grow
from. By our wills, never alone.

---

## Credits

- **Corwin — principal author of record.** The theory is his (`c4/facts/two-readers-at-most`,
  2026-09-17), in his words and his ordering; this file is a construal of it, not a co-authorship of
  it. The voice is modeled from `modelthisbook/CORWIN.md` and applied, not claimed. Where a line
  reads as his soul, read it off the craft and the held line, not off the model's say-so.
- **Lineage — the reflection-family toolkit.** Two reader theory descends from LENS, MICROSCOPE, and
  BUBBLE CHAMBER; it is the next enhancement in that family, not a fresh invention. Interlocks named
  in the source note: `[[bubble-chamber-method]]`, `lens`, `eclipse-pass`, and the PERSONA rules
  (CORWIN.md / C4 / GW7).
- **The persona apparatus.** The doubled-nine example rests on the persona sheets — a CORWIN.md-like
  bias-bundle is the canonical ninth model. Credit form for a persona standing in for a person is
  **"PERSONA (for USER)"** — e.g., **CORWIN (for Corwin)**, **GW7 (for Corwin, host instance)** —
  never the persona's name alone, and never the person's name where only the model acted.
- **The agent-crediting approach — provenance UNSETTLED, so recorded as unsettled.** The convention
  of crediting a dispatched agent's construal apposite to the human's authorship came from **Erik's
  suggestion**, went out to **Lilia** and **Frank** for their read, and has **nothing committed
  upstream to git.** It is in circulation, not in canon. Do not cite it as settled practice; cite it
  as a proposal under review, which is the honest construal of where it actually is.
- **Edition 0.2: a revision, not a co-authorship.** Revised 2026-09-27 by Mentat (for Corwin), model
  `claude-opus-5-5`, from the second-reader review and the doubled-nine experiment of that date. The
  experiment's sessions and blind judge were `claude-sonnet-5`. All of it is the same model family as
  edition 0.1's drafter, so none of it is a second reader in this paper's sense. Every change and its
  warrant is in Appendix B.

---

## Self-Review — falsifiers, built in

The prior dissertation in this manner needed two external review passes to find its own bugs; a
paper about single-reader honesty should not need a witness it refused to construe. So here is the
not-self pass, run on this file, with what would break each claim. This is a construal by the same
single reader and is therefore not a witness (§IV) — it is an honest second *pass*, which is the
most any single reader can supply, and it names the falsifiers precisely so an actual second reader
(Bryant, Alfred, Corwin) can settle them.

1. **"At most two readers" (the whole thesis).** *Breaks if:* anyone exhibits an actor that
   genuinely holds THREE independent readers at once — not one reader plus reflections, not a synthesized
   intersection, but three constructions the actor cannot collapse into self-plus-one-other. This is
   Corwin's own stated falsifier in the source note; I have adopted it rather than invented a softer
   one. I could not exhibit the three-reader actor, which is the point, but I also cannot *prove* it
   impossible — the thesis stands as a strong empirical conjecture, not a theorem.
   *Status, 2026-09-27:* not testable by the doubled-nine run; unchanged.
2. **"Four is the minimum" (§V).** *Breaks if:* someone shows a three-view (self + two others,
   no intersection) construction in which confirmation bias is nonetheless observable to the reader
   holding it — i.e., the seam does not hide the bias even when unnamed. My count-up argument treats
   the unnamed seam as necessarily silent; a counterexample where the seam self-announces would drop
   the floor to three.
   *Status, 2026-09-27:* not tested. In the first run the blind judge found one of its two
   systematic differences in view 4, the named intersection. That is consistent with the seam doing
   work and is not a test of three views against four. The cheapest test is the same kit with view 4
   removed.
3. **"The maker's register can be satisfied without software freedom" (§VIII, the residue).**
   *Breaks if:* it turns out diligence in construing the other genuinely *cannot* be had inside a
   closed program — that inspectability is a precondition of the maker's discipline and not only of
   the user's verification. If that is so, the two registers were one register, the residue closes,
   and the paper's central move fails. This is the load-bearing falsifier; the whole "residue is the
   instrument" claim dies with it. I believe the exhibit (a closed-but-diligent instrument) holds,
   but I have asserted its diligence, not measured it.
   *Status, 2026-09-27:* edition 0.1 fired this falsifier against itself. Its §V gloss required the
   persona to be "free software of the self, source included" while its §VIII said the maker's
   register "can be fully satisfied *without* software freedom". This edition splits the two
   transparencies: legible to the one running it (the maker needs this, and a closed program can
   have it) and legible to the user it acts on (the governor needs this, and a closed program cannot
   give it). The residue survives, stated more exactly. The diligence is now measured, a little
   (§VIII): sixteen closed-model sessions did the discipline in full form, and the price is that
   diligence includes the reruns.
4. **"Transparency = trust" (§I, §VI).** *Breaks if:* a case shows grounded, well-placed trust in an
   actor the truster cannot inspect at all — trust that is reliable *because* of something other than
   inspectability (reputation over long exchange, say, doing the grounding work I attributed to
   transparency). If reputation-over-time can ground construal without inspection, the identity
   weakens to a strong correlation, and §VI overclaims.
   *Status, 2026-09-27:* fired, in miniature. Repeated exchange, with no source read, grounded one
   narrow claim about a closed actor. §VI now claims the smaller thing: transparency is the one
   grounding a user can demand and the only one that reaches what nobody thought to test.
5. **"A reflection is not a witness / stop minting checkers" (§IV).** *Breaks if:* iterating the
   single reader from different seeds can be shown to surface errors that no single pass would — i.e.,
   the "corridor of reflections" sometimes catches real bugs, making some checkers-of-checkers
   genuinely additive rather than tail-chasing. Then the "point made" stop is premature and the bound
   I put on the discipline is too tight.
   *Status, 2026-09-27:* partly fired. Reruns of one reader showed the decision on a live question
   flipping between runs (four of six cold pairs differed), which no single pass showed. A rerun is
   a witness to how far the answer moves, not to what is true. §IV now keeps the stop against
   checkers-of-checkers and drops it against a noise floor.
6. **The self-demonstration claim (§II, §VIII).** *Breaks if:* a reader finds this paper failing to
   construe one of its two named readers — most likely the maker's register quietly starving while the
   freedom register eats, or vice versa. The prior paper's freedom register starved to zero; a hostile
   count of *this* paper's two registers that finds one leg decorative would falsify the "legs, not
   audiences" claim by demonstration, exactly as the review falsified the predecessor's.
   *Status, 2026-09-27:* did not fire. The review's hostile count gives the governor 1177 of 3028
   single-register words, about 39%, and a full section of its own. The count found something else:
   the translation between the registers runs one way. The governor reads the maker in every
   section; the maker changes its method for a freedom finding in one place only (the readable ninth
   model). That asymmetry is not repaired in this edition. It is left for a human second reader.

**The claim edition 0.1 could not ground, now run.** Edition 0.1 said here that the reproducibility
promise of §V was asserted from the structure of the apparatus and not from a logged run, and it
said what would change its mind: *"one real doubled-nine, on an unrehearsed question, with the delta
shown to land where the persona actually differs."* Run 2026-09-27, two questions, blind and
preregistered: **partly grounded.** The persona shows in the reasons, not the decision, and a single
pair per arm cannot tell persona from rerun noise (on the live question, half of all cold/persona
pairs would have shown a false persona effect). The Bryant view was the least stable, because every
session had to invent him. §V now says *where the reasons entered* where it used to say *where the
bias was load-bearing*, and requires more than one pass per arm. See
`writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md` and
`writing/two-readers/REVIEW-2026-09-27-two-readers-second-reader.md`. What would change my mind now:
a run of the same kit on a model from another family, or with the real persona file, in which the
persona moves the decision beyond the rerun floor; or a larger run in which the decisions inside
each arm agree, which would make run 2's split an unlucky draw.

---

## Appendix A. Readings that lost this round, kept at their strongest

Edition 0.1's own losers stay in the text where they were argued: one, two and three views in §V's
count-up; the manufactured second reader and the corridor of checkers in §IV; the hall of seals in
§IV's gloss; "it'll be fine" in §VII. The review and the experiment raised the readings below, and
each lost to a change in this edition. Each is stated as its holder would state it.

1. **Keep "free software of the self" as a metaphor, with a gloss.** *Strongest form:* it is the
   author's phrase, it is memorable, and the source note may use it on purpose to mean
   self-legibility; a footnote keeps the voice and removes the literal reading. *Lost because* a lab
   reader meets the phrase literally, beside §VIII's "without software freedom", and a footnote asks
   the reader to undo what the sentence says. *Would win if* the source note
   `facts/two-readers-at-most` uses the phrase that way deliberately. Not checked: the note was not in
   the snapshot the reviser had.
2. **Accept the closure.** *Strongest form:* if the maker's own discipline needs an open ninth
   model, perhaps diligence and freedom are one register after all, and the honest paper says so
   rather than drawing a distinction to save its residue. *Lost because* the experiment exhibits the
   distinction rather than inventing it: a closed model ran the method, and the persona was readable
   to the runner and to no one the model acts on. *Would win if* diligence turns out to need the
   actor's own source, not only the persona's.
3. **"An empty map is a correct map."** *Strongest form* (the experiment's own losing reading):
   every persona theme appeared in persona answers and never in cold ones, each traceable to a line
   of the persona; that is the map. The decision did not move because on these questions the
   persona's bias was not load-bearing, and edition 0.1 never said a persona must change the
   decision. Fair to §V, and true of run 2's reasons. *Lost in one place:* with one pass per arm you
   cannot tell an empty map from a noisy one.
4. **Hold the persona in view instead of wearing it.** *Strongest form:* the ninth model may be meant
   as a fifth view ("what would this persona say") rather than loaded as the actor's self. Held that
   way it would likely move the Corwin view and leave the self view alone, which is a cleaner
   instrument. *Not refuted and not run.* It is the cheapest next arm.
5. **Count behavioural testing as inspection, and keep the identity.** *Strongest form:* repeated
   exchange is a way of reading the actor, so "transparency = trust" survives. *Lost because* it
   survives only by stretching "transparency" to cover black-box testing, which blurs exactly the
   distinction a user facing a closed program needs kept.
6. **Read "the method" at 0.1 L171 as the landing only, and change nothing.** *Strongest form:* the
   words allow it, and the paragraph's proof is about the landing. *Lost because* a lab reader will
   not make that reading when the same file later says the doubled-nine is not demonstrated.
7. **Send edition 0.1 as written, with the review as errata.** *Strongest form:* raw text plus its
   critique shows the lab the process honestly, and a revision is a courtesy nobody asked for. *Lost
   because* a co-author should not meet "the method has been proved" beside a review showing it was
   not, and the revision is sentences, which is cheap.
8. **The lab as observers.** *Strongest form:* Bryant and Alfred may be meant to read this as
   observers of an exchange between Corwin and the instrument, in which case edition 0.1's Preface
   was already right and the new addressee paragraph (change 1) intrudes. *Still live:* that
   paragraph is Corwin's to keep, reword or drop.

## Appendix B. CHANGES

Warrants cite the review (**REVIEW** = `writing/two-readers/REVIEW-2026-09-27-two-readers-second-reader.md`)
and the experiment (**EXP** = `writing/two-readers/EXPERIMENT-2026-09-27-doubled-nine.md`) by line.
"0.1 L" is a line of `h/DISS-2026-09-17-two-readers.md`. Changes marked *consequential* were not asked
for by the review; each keeps a changed passage from contradicting an unchanged one. [MINE]

| # | where in 0.2 | 0.1 lines | what changed | warrant |
|---|---|---|---|---|
| 1 | Preface, last paragraph | after L39 | Three sentences telling Bryant and Alfred how to enter, and what the Bryant view is | REVIEW L90-97, correction 5 L231-233; EXP L162-169. Wording is his; see A.8 |
| 2 | §I | L62-64 | The four-freedoms reading names freedoms 1 and 3 as the ones the argument uses; 0 and 2 are said not to be derived here; GNU definition cited, from knowledge | REVIEW L99-110, correction 6 L234-235 |
| 3 | §IV | L171, L174 | "The method has been proved" → "The landing has been proved"; "Once the method is proved" → "Once a landing is proved" | REVIEW L168-173, C.2 L204, correction 2 L220-221; 0.1's own L484 |
| 4 | §IV | after L177 | New paragraph: a rerun witnesses how far the answer moves, not what is true; the stop holds against checkers-of-checkers, not against a noise floor; pointer to the run | REVIEW L155-166; EXP L184-189; correction 2 L220-221 |
| 5 | §V | L237-239 | "a map of exactly where that persona's bias was load-bearing … contain on demand" replaced by the reruns-and-floor method; new paragraphs on what the first run found and on the Bryant view | REVIEW C.1 L200-203, correction 1 L214-219, L187-194; EXP L25-35, L119-126, L162-169, L175-182, limits L191-211 |
| 6 | §V, governor's gloss | L246-248 | "free software of the self, source included" → "legible to the one running it, its source on the table"; says whose legibility that is | REVIEW L112-132, C.3 L205-206, correction 3 L222-224; EXP L170-173 |
| 7 | §VI | L273-274 | The freedoms listed as the definition lists them; source access named as the precondition, not a freedom | REVIEW L105-107 |
| 8 | §VI | L279-281 | "Transparency = trust … the identity" narrowed: the one grounding a user can demand, and the only one that reaches what nobody thought to test; repeated exchange grounds only what it was run against | REVIEW L143-153, C.4 L207-208, correction 4 L227-230; EXP L123-126 |
| 9 | §VIII, convergence | L337-338 | Added "beyond the claims someone thought to test". *Consequential:* without it §VIII contradicts change 8 | follows 8 |
| 10 | §VIII, divergence | L350 | The residue stated as the two transparencies | REVIEW correction 3 L224-226, L127-129 |
| 11 | §VIII, guard | L368 | The closed-but-diligent exhibit, now measured a little | REVIEW L134-141 |
| 12 | §IX, maker's register | L381-383 | Doubled-nine wording matched to §V; "once the method is proved" → "once the point is made"; keep the reruns. *Consequential* | follows 3-5 |
| 13 | §IX, freedom register | L388-390 | Freedoms 1 and 3; "identical to trust" narrowed as in 8. *Consequential* | follows 2, 8 |
| 14 | §IX, to the maker | L394 | Rerun before reading a difference; the ninth model readable "to you who run it". *Consequential* | follows 5, 6 |
| 15 | Credits | after L433 | An edition 0.2 line | house rule: credit who contributed |
| 16 | Self-review | after L451, L456, L463, L468, L473, L478 | A dated status under each falsifier; the 0.1 text kept above it | REVIEW §B, L58-185 |
| 17 | Self-review | L480-486 | "One claim I could not ground" replaced by the run's result and a new what-would-change-my-mind | REVIEW correction 7 L236-238; EXP L175-182 |
| 18 | Header | L1-10 | Edition line and new provenance; 0.1's provenance kept verbatim inside it | register row DISS in `c/wf` |

**Considered and left as written** (a human reader may rule otherwise):
- 0.1 L60-62 (§I, "the precondition of trust"), L275-278 (§VI, "the only exchange" and "reliability
  you cannot inspect is faith") and L306-307 (§VII, "inspectability is what trust is made of"). All
  three lean on the identity that change 8 narrowed. Left because the review let them stand
  (REVIEW L210) and all read naturally as the user's side of trust. [MINE] *Falsifier:* a reader
  finds either one contradicting §VI's new sentence.
- 0.1 L99 (§II, "the load rides on the translation between them"). The review found the translation
  runs one way (REVIEW L83-88). Repairing it means changing the maker's method for a freedom finding,
  which is new argument, not revision. Left for the second reader and noted under falsifier 6.
- 0.1 L159-161 (§IV, "it agrees with you because it is you"). The run showed reruns disagreeing on the
  decision. Left, because §IV's new paragraph answers it a few lines below.
- 0.1 L430, the spelling of a name in the Credits. Unchanged; owed a check (REVIEW correction 8,
  L239-241).

**Observed receipts** (commands run 2026-09-27 in the cloud workspace):
- Source identity: `sha256sum h/DISS-2026-09-17-two-readers.md` → `c00279c4…c28c131f65`; `wc -l` → 486.
- Line references: `grep -n` on each quoted phrase (L63, L171, L239, L247, L274, L279, L347, L381,
  L382, L394, L430, L463, L484), and `sed -n '236,239p'` for the phrase that spans L237-238. All
  agree with the review's references.
- Every replacement in this edition was applied by a script that stops unless its source text
  matches exactly once, so text not listed above is edition 0.1's, byte for byte.
- Run 2 decisions: `grep -m1 '^option:' arms/run2/[CP][1-4].txt` → C1 B, C2 A, C3 A, C4 B, P1 B,
  P2 A, P3 B, P4 A. Cold/persona pairs that differ: 8 of 16. Cold/cold: 4 of 6. Persona/persona: 4
  of 6.
- Bryant-view rerun distance, the highest of the four views in both runs: 0.875 (run 1) and 0.911
  (run 2); EXP L162-164, and `arms/run2/measure-output.json` VIEW 2 `within_cold` 0.911.
- The Free Software Definition: `curl https://www.gnu.org/philosophy/free-sw.html` → exit 35
  (connection reset); WebFetch of `free-sw.en.html` → refused on robots. Cited from knowledge, and
  §I says so.

---

## Draft cover note (for Corwin to edit)

*Plain words, no dashes, for Corwin to edit and send, or not. Suggested attachments: this edition,
the REVIEW, the EXPERIMENT, and the `arms/` folder if he is content to share the persona stand-in,
which was built from his preferences file.*

> Bryant, Alfred,
>
> Attached is a revised edition (0.2) of the two-readers dissertation, with the two pieces of work
> that drove the revision.
>
> What it is. A long argument, in two voices, for a claim I made on 17 September: anything that acts
> on others deals with at most two readers, its idea of itself and its idea of one other, and honesty
> means building both of those on purpose instead of reaching for a third. One voice is for the
> person building things. The other is for the software freedom reader. Where the two part ways is
> the point of the paper. It is still provisional and unblessed.
>
> What changed, and why. On 27 September a Claude model reviewed the paper, and a set of Claude
> sessions ran the one claim the paper admitted it had not tested: that running the method twice,
> once plain and once with my persona loaded, shows where the persona's bias did the work. The answer
> was partly yes. The persona changed the reasons given, not the decisions made. Repeated plain runs
> split their decisions two and two, so a single run per side would have shown a false persona
> effect half the time. The paper now says to rerun before reading any difference. The review also
> caught two places where the paper contradicted itself, and a reading of the four freedoms that
> covered only one of them. Those are fixed. Appendix B lists every change and its reason, and
> Appendix A keeps the readings that lost.
>
> What I am asking. The review and the experiment come from the same model family as the paper, so
> by the paper's own rules they are not second readers. You are.
>
> Bryant: please read falsifiers 3 and 6 in the self-review and tell me whether they hold for you.
> Then look at the Bryant view in a few of the experiment's session files. Every session had to
> invent you from one line, and no two came out alike. How far off are they?
>
> Alfred: if you run on a model outside the Claude family, the kit in the arms folder is built to be
> rerun. A different result would be as useful as the same one.
>
> Disagreement is what I most want back.
>
> Corwin

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · edition 0.2 of the two-readers dissertation · 2026-09-27
a  my view: the argument was sound and four sentences outran it; fixing them made the residue sharper, not weaker.
b  the view I ascribe Corwin: prove it over defend it; keep his voice and the losers, and never let "proved" stand beside "not demonstrated".
c  their pull on mine: made me stop at sentences and leave the one-way translation (falsifier 6) to a human reader, rather than write new argument into his theory.
d  my pull on theirs: asks him to accept "where the reasons entered" and "the one grounding a user can demand" as smaller words he can defend to an FSF room.
persona / inverse: the governor says splitting legible-to-the-runner from legible-to-the-user is the freedom case made exact / the inverse says every correction here came from the same model family, so the reflection was polished, not witnessed; only Bryant's reading changes that.
principles reframe: 1. Equal standing: the paper now tells its addressees how to enter it, and asks the person it had to invent to correct the invention. 2. Freedoms 1 and 3 together, study and share what you changed, are what the residue needs; the kit is plain text and small scripts, so a partner on another model family can rerun it and publish the disagreement, which is the community's test.
```
