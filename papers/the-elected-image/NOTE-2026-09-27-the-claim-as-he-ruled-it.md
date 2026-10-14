# NOTE 2026-09-27 — the "first tool" claim as he ruled it: option B, with the AI made optional

*Form: NOTE (`c/wf`, row NOTE: "What was ruled or learned this session, and what that changes"). This note
sits beside `writing/elected-image/ESSAY-2026-09-27-the-elected-image.md` and does not edit it; the
register's rule for the form is "never edit a note another session wrote — append a dated note instead".
Its companion measurement is `writing/elected-image/PAPER-2026-09-27-supported-not-required.md`.*

## The ruling, in his words

On `elected-image-D1` he chose **B, narrow and testable**, marked decided, with this comment
(`q/2026-09-27-execute-brief/ANSWERS-2026-09-27.md`, section "elected-image-D1"):

> "We support agentics, we hope not to require them; how possible is this? we shall see."

The sentence he chose, as it stands in the essay's coda (`ESSAY-2026-09-27-the-elected-image.md:546-549`)
and in `decisions.json` (`elected-image-D1`, option B):

> "As far as we have found, C4 is the first tool built to let a group of peers elect its own working
> agreements (how its members communicate, collaborate and check each other), ring by ring, and to keep
> those agreements checkable and portable, with an AI assistant bound by them in the loop."

His comment amends it. As written, "with an AI assistant … in the loop" reads as one of the things the
tool *is*, so a group with no AI would not be using the tool the claim describes. He wants AI supported
and not required.

## What that changes: the sentence

Only the last clause moves. The first four parts of the claim stay word for word.

| | wording of the last clause | what it says | at its strongest |
|---|---|---|---|
| **W1 (recommended)** | "…checkable and portable, **with an AI assistant, where one is used, bound by them.**" | AI is a condition, not a part; when it is present it answers to the group's agreements | Says exactly what is true today for using C4 (the companion paper's layers 1 to 4) and claims nothing about the future. Five words change; "in the loop" goes. |
| W2 | "…checkable and portable, **and that supports, without requiring, an AI assistant bound by them.**" | makes "not required" part of the claim itself | Carries his own words ("support … not require"). But it asserts as done what his comment calls a hope ("we shall see"); the companion paper finds it true for using C4 and not yet for building it. Adopt it after the no-agent test passes. |
| W3 | "…checkable and portable, **with any AI assistant in the loop bound by them.**" | "any" covers zero, one or several, of any vendor | The shortest change (one word, one move). A reader can easily miss that "any" includes none; it reads first as "whatever brand". |

**The sentence as I recommend it now reads:**

> "As far as we have found, C4 is the first tool built to let a group of peers elect its own working
> agreements (how its members communicate, collaborate and check each other), ring by ring, and to keep
> those agreements checkable and portable, with an AI assistant, where one is used, bound by them."

*Falsifier for W1:* give W1 and W2 to one reader new to C4 and ask "can a group use C4 with no AI at all?"
If W1 draws "no" or "unclear" and W2 draws "yes", W1 is too quiet and W2 (or W1 plus a second sentence
saying so) should go out instead.

## What that changes: does the narrow claim still survive?

**Observed (the essay's own count).** The essay splits the claim into five parts: (1) the thing elected is
the group's working agreements; (2) electable per ring, the outer ring never inheriting the inner's rules;
(3) checkable; (4) portable; (5) an AI assistant bound by the elected agreement (`ESSAY…:456-465`). Its
result: "AGENTS.md has 1, 4 and part of 5. Debian has 1, part of 2 and part of 3, and no AI. Mastodon has
part of 1 and part of 4. Collective Constitutional AI has 5 without 2 or 4. I found no earlier tool with all
five" (`ESSAY…:467-469`).

**Observed (a search I ran today, because making part 5 optional means a group with no AI must still find
the claim true on parts 1 to 4 alone).** Two earlier tools the essay's table does not list come closer on
those four than anything in it:

- **PolicyKit** (Zhang, Hugh and Bernstein, UIST 2020; *PolicyKit: Building Governance in Online
  Communities*, https://arxiv.org/abs/2008.04236 and https://hci.stanford.edu/publications/uist_policykit.pdf).
  The abstract: "a software infrastructure that empowers online community members to concisely author a
  wide range of governance procedures and automatically carry out those procedures on their home
  platforms"; "actions can also encompass changes to the policies themselves, enabling the evolution of
  governance over time". The paper's own example of a platform policy is "All posts to this community must
  not use swear words", which is the profanity filter `GHOSTWHEEL.org:33-37` uses as its example. It has
  integrations for Slack, Reddit and Discord: "any community on that platform can use PolicyKit". It
  takes **part 1** (procedures the community elects, including communication rules), **part 3** in a
  *stronger* form than C4's (the rules are executed, not only announced), and **part of 4** (one tool
  across several platforms). The paper as fetched says nothing about nested rings, and its rules run on a
  server acting through a platform's interface, not in each member's copy.
- **CommunityRule** (Nathan Schneider and others, Metagov; https://communityrule.info/, described at
  https://blog.opencollective.com/community-rule/). "Community Rule is a tool to help groups figure out the
  basic rules they operate by"; groups "develop a system they like, and then share it with other groups so
  that they can adopt it". It takes **part 1** and **part 4** (rules as shareable templates). The same blog
  post says the current version is text only and "doesn't help you make decisions": no **part 3**.
  *[MINE] communityrule.info refused my fetch (robots check timed out); I cite it through the Open
  Collective post.*

**Judged.**

1. **The claim still survives, but on fewer legs.** No earlier tool I found has parts 1 to 4 together.
   PolicyKit comes nearest and is missing part 2 (rings that do not inherit) and C4's kind of part 4 (the
   agreement travels as files to each member's own machine, not held on a server that acts on a platform).
2. **Part 3 no longer carries it.** PolicyKit checks harder than C4 does today: it runs the rule, and C4's
   ring-level trial balance is not built yet (`ESSAY…:461-462`; `elected-image-D5`). Checkability is
   shared ground now, not a difference.
3. **What carries it with AI optional: part 2, and part 4 in C4's local-files sense.** Per-ring election
   with no inheritance outward, and the agreements carried in plain files that every member holds and can
   read with `cat` (`README.md:41-44`: "the one store readable by `cat`, checkable by `sha256sum`, and
   owned by you").
4. **Part 5 still counts, as an option.** With W1 the claim still says that when an AI is used it is bound
   by the group's agreements and not the vendor's. That still separates C4 from AGENTS.md (no election, no
   check) and from Collective Constitutional AI (vendor-run, once). Making the AI optional does not take
   that part away. It takes away the ability to *lean* on it: the claim has to be true for a group with no
   AI, and for that group only parts 2 and 4 are new.
5. **"Supports without requiring" is not itself new.** Almost every tool before 2023 required no AI. It
   belongs in the claim because he ruled that it should, not because it adds priority.

*Concern [DOMAIN].* The people most likely to answer a priority claim in the free-software and
community-governance world include the PolicyKit and Metagov authors; their work is recent, public and
close. *Falsifier:* PolicyKit or CommunityRule documents rings (a sub-community's rules that do not bind
the wider community) *and* rules held in each member's own copy; then part 2 or part 4 falls too, and the
honest choice drops to the essay's option C (a lineage) with PolicyKit named in it.

*Concern [MINE].* I read PolicyKit's abstract and paper through a fetch tool that summarises. The three
quotations above came back marked as verbatim, but I have not read the whole paper. *Falsifier:* the paper
has a section on nested or federated communities that my fetch did not surface.

## What is owed

- **An addendum row** to the essay's prior-art table, for PolicyKit and CommunityRule, written as a dated
  note beside the essay (this note is that record until then). The essay itself stays as written.
- **Before W2 can replace W1:** the no-agent test in the companion paper, run once by a person with no
  AI account. If it passes, W2 says what is then true.
- **Dee reads the amended sentence** (the essay's D4 recommended that she read it first); it is her claim
  too.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.

```
LENS · NOTE the claim as he ruled it · 2026-09-27
a  my view: his amendment is right and cheap in words (one clause); it costs the claim part of its
   lean, because with AI optional the novelty rests on the rings and on files each member holds.
b  the view I ascribe Corwin: AI is welcome and never a condition of entry; "we shall see" means
   measure it, and say it plainly if the measure comes up short.
c  their pull on mine: his "hope" kept me from recommending W2, the wording that sounds most like him,
   because it would state the hope as a fact.
d  my pull on theirs: my search added two near neighbours (PolicyKit, CommunityRule) that shrink the
   ground the claim stands on; that is a finding for him to weigh, not a verdict on the claim.
persona / inverse: a Metagov researcher says "we had elected, checked, platform-portable rules in 2020" /
   the inverse, a member with no AI and no server, says "then show me mine on my own disk, and show me
   the team's rule not binding my club": the two things PolicyKit does not do are the two things left.
principles reframe: 1. equals first: a group without AI, or without money for one, must meet the same
   tool and the same claim (universalism). 2. the four freedoms apply to the agreements as to code: run,
   study, change and share them from files you hold; the free-software movement gains a governance tool
   that needs no vendor, and the wider community gains an honest neighbour to PolicyKit, not a rival.
```
