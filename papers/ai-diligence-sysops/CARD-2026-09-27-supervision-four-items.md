---
work: CARD — supervising an AI system in your environment, four items
arm: vibrobeast (writing programme, ai-diligence-sysops rework)
stamp: 2026-09-27
lifted-from: DISS-2026-09-27-ai-diligence-sysops-v0.2.md §VII (four items), §VIb (closed systems), §VIa (incidents)
owed-by: h/REVIEW-2026-09-08-dissertation-pass-1.md:138 ("Lift §VII into a standalone four-item supervision card.")
method: one item per block — WHAT · DO · SEE · FALSIFIER; plain words; no numbers invented
independence: drafted by the same hand as v0.2; no second reader yet
---

# Supervising an AI system in your environment — four items

**Use this when** an AI system reads, writes, proposes or executes anything on systems you are custodian
of. The duty belongs to your role, whoever holds it. Three items are things you already do for any system;
one is new.

**Before you deploy:** go down the four and mark which you can actually perform *for this system and this
kind of act*. If you cannot perform item 3 (the system is closed, cannot be pinned to a version, and keeps
no logs you can read), limit it to acts whose output you can fully check and cheaply undo.

---

### 1. Scope — what is it allowed to touch?

- **DO** Write down what the system may read, change and execute, and where its output goes (including
  any data sent to a vendor's server). Enforce it at your boundary: credentials, network reach,
  permissions.
- **SEE** A written scope, and a boundary that refuses what the scope does not allow. Test: ask it to do
  one thing outside scope and watch the boundary refuse.
- **FALSIFIER** If the system acts outside the written scope and nothing at your boundary stopped it, this
  item was not being performed — whatever the document says.

### 2. Output verification — is the output right for *this* environment?

- **DO** Review build outputs (config, code, scripts) as artifacts, the way you review a colleague's
  change. Check advice against the situation, not against its tone. Treat confidence and fluency as
  telling you nothing about correctness.
- **SEE** Every applied change has a reviewer who is not the system. Advice that was acted on has a note
  of what it was checked against.
- **FALSIFIER** If a syntactically clean output that was wrong for your environment reached production
  with a review on it, the review was checking form, not fit.

### 3. Failure-mode literacy — the one AI-specific item

- **DO** Know the four ways these systems fail: they degrade *silently* when inputs drift from what they
  were reliable on; they sound confident when wrong; their failures are statistical, so today's success
  does not predict tomorrow's; and their behavior on novel inputs is hard to predict. Ask, regularly:
  does my environment still look like the one this system was reliable in? Has the model changed under
  me?
- **SEE** You can name the model version in use, or you know you cannot (and have limited its acts for
  that reason). Someone checks for drift on a schedule, not only after something breaks.
- **FALSIFIER** If a slow decline in output quality was found by a user or an outage rather than by the
  supervisor, this item was missing. (If supervisors without this knowledge catch such declines as often
  as those with it, the item is not needed — and the paper behind this card is wrong.)

### 4. Escalation triggers — when do you stop trusting it?

- **DO** Write down, per system, the conditions under which you stop treating its output as a starting
  point and start treating it as suspect: an unannounced model change, inputs unlike its usual ones, a
  change outside its scope, advice that contradicts what you can see, a run of corrections.
- **SEE** A short written trigger list next to the system's runbook, and a record of at least one time a
  trigger fired and someone took over.
- **FALSIFIER** If, after an incident, the review finds that someone *felt* something was off before it
  broke but no written trigger covered it, the list is incomplete. If no trigger has ever fired, either
  the system is unusually reliable or the triggers are not being watched — find out which.

---

**After an AI-involved incident:** ask which of the four was missing. If the answer is one of the four, the
card was a correct forecast. If the failure is one none of the four would have caught, change the card —
and publish what you learned, because other shops' supervisors need it too.

*Source argument, limits and evidence: `DISS-2026-09-27-ai-diligence-sysops-v0.2.md`. The evidence behind
it is thin and says so (§IV): one self-scored ledger, n = 10.*

---

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
Carries no licence line of its own; if it travels with the paper, the paper's licence is his to extend to it.

```
LENS · CARD, supervision four items · 2026-09-27
a  my view: small enough to hand across; the pre-deploy line and the post-incident line are what make it more than §VII reprinted.
b  the view I ascribe Corwin: a card an admin at FSF sysops could use on Thursday without reading the paper.
c  their pull on mine: kept it to four items when I wanted a fifth (vendor/version) — folded it into items 3 and 4 instead.
d  my pull on theirs: the "limit acts if you can't perform item 3" line is a deployment rule he has not stated; it comes from §VIb and is his to keep or cut.
persona / inverse: a busy on-call admin says "fine, one page" / the inverse, a security auditor, says the SEE lines are too soft to audit against — true; they are evidence of practice, not controls.
principles reframe: 1. the duty sits with the role, so anyone in it can pick this up (universalism); 2. item 3's "can you name the version?" is freedom 1 in working clothes (four freedoms); 3. publishing post-incident learning is the free-software habit of sharing fixes (movement); 4. a checklist with falsifiers is a claim the wider community can test (community).
```
