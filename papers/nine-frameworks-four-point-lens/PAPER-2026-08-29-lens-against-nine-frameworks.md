# Reading Nine Architecture Frameworks Through a Four-Point Lens

**Author: Corwin Brust. Written with his instrument; every reading marked.**
**Readers:** written for two named readers, below; published 2026-09-25 at the author's word.

---

## 0 · How to read this, and who it is for

This document has **two readers and they fail differently**, which is the only reason the pair
is worth having.

- **The framework reviewer** catches a missing viewpoint, an untyped relation, a method with
  no phases. They will tolerate hand-waving about tooling, because the framework is the
  subject.
- **DD-B** catches a general-technology claim that is wrong or unsupported, and tolerates
  nothing hand-waved about how a machine behaves. He has Gemini and nothing else to help him
  read this, shares the author's ground on computers, and is **just starting** with
  non-static models.

**Consequences, applied throughout:**

1. Every external claim links to something openable **without an account**.
2. Every claim about machine behaviour is marked **OBSERVED** (we ran it, here is the number)
   or **BELIEVED** (we think so, here is why, here is what would refute it).
3. Every section that describes a tool offers **a guess you make before reading ours**. That
   is not a gimmick — it is the method under discussion, pointed at the reader.
4. It reads like a long man page rather than a paper: **what it does, where to check, and what
   it does not cover.**

**What this is not.** It is not a claim that the frameworks below are deficient. Eight of the
nine are mature, widely taught, and better documented than this. It is a report of what one
small instrument sees when pointed at them, and of what they see when pointed back.

---

## 1 · A note on the name, stated first because it is the first thing a reviewer will hit

**"C4" in this document does not mean the C4 model.** The [C4 model](https://c4model.com/) —
Context, Container, Component, Code — is Simon Brown's, developed 2006–2011 from UML and the
4+1 view model, and is the sense an architecture reader will reach for.

The system described here is **Collaborative Consent Continuity Controls**, and it **descends
from Brown's C4 and credits it always** — that is a standing rule in the project, dated
2026-08-03. The descent is not decorative: Brown's four levels are used inside this work as a
**zoom level for a unit of work**, so that a turn can declare the scope it operates at and a
view can draw what falls in and out of it (project card `brown-C4-is-the-turn-scope-axis`,
2026-07-31).

**OBSERVED:** twenty files in the project name Simon Brown, across nine dates, beginning
2026-07-29.
**Why this paragraph exists at all:** the instrument that produced this paper *rediscovered*
that ancestry by web search on 2026-08-29, having read none of the twenty, and briefly filed
it as a hazard. **That failure is reported in §7 rather than hidden, because it is a finding
about how machines that write documents go wrong.**

---

## 2 · The instrument: a four-point lens

The lens is one figure and two rules. A stranger can apply it in five minutes.

```
                    F O C U S                    what you can SHOW
             \        ^          ^   /
      RESULT  \     SHOW    PLAN·CONFIDENCE
               \      |         |    /
   CHANGE -----> \    |         |  <----- LEARN
   "SYSTEM"       \   |         | /       "PERSON"
                  /   |         |  \
        PLAN     /  CLARITY      \
                /      |           \
               /      FEEL          \

              U N D E R S T A N D I N G       what you can FEEL YOUR WAY THROUGH
```

**Rule one — the waist is the point.** Nothing reaches focus or understanding except by
passing through the single place where **a change to the system** and **a person's learning**
meet. A framework that moves the system without teaching anyone, or teaches without changing
anything, is not passing through the waist.

**Rule two — opposition is built, not found.** *System-change* and *person-learning* are made
opposable **so they can be measured against each other**. The opposition is a measurement
construct you create, not a fact you discover. (Author's page, 2026-08-28.)

**A companion ratio, used below and stated so it can be checked.** `SP/UF` — what you can
**S**how times the **P**lan-confidence you hold, over **U**nderstanding times **F**eel.
Above 1 you are showing more than you understand (over-claim); below 1 you understand more
than you show (a buried lead, which is a real failure and not modesty); near 1 is calibration.
The ratio must be reported with the **resolution** of its inputs, because a judgement-only
estimate and an instrumented one are different statements wearing the same numeral.

> **Guess first.** Before the table: of the nine frameworks below, which do you expect to
> score *above* 1 — showing more than they let a person understand? Write your guess down.
> Ours is in §5.

---

## 3 · Nine frameworks through the lens

Sources for each are in §9. Characterisations are **BELIEVED** unless a number is given.

| framework | what it is | FOCUS — what it lets you SHOW | UNDERSTANDING — what it lets you feel through | passes the waist? |
|---|---|---|---|---|
| **[C4 model](https://c4model.com/)** (Brown) | a diagramming notation at four zoom levels | a system at the right altitude, to a mixed audience | **strong** — the levels are how a newcomer learns a codebase | **yes**, and it is the cleanest pass in the set |
| **[Zachman](https://en.wikipedia.org/wiki/Zachman_Framework)** | a 6×6 classification grid, *not a method* | complete coverage; the cells you have not filled | weak — a grid tells you what is missing, not what it means | **partly** — it changes what you notice, not what you build |
| **[4+1](https://en.wikipedia.org/wiki/4%2B1_architectural_view_model)** (Kruchten) | four views plus scenarios | the same system to four stakeholder kinds | **strong** — the `+1` scenarios are the teaching device | **yes** — the scenarios *are* the waist |
| **[TOGAF](https://www.opengroup.org/togaf)** | an enterprise method (the ADM cycle) | governed change across many teams | moderate — the method teaches process, not domain | **yes at scale, no at small scale** |
| **[ISO/IEC/IEEE 42010](https://www.iso.org/standard/50508.html)** | a standard for architecture description | that every view has a **stakeholder and a concern** | **strong, and unusually so** — it forces you to name who is confused | **yes** — it is almost a lens itself |
| **[arc42](https://arc42.org/)** | a twelve-section documentation template | trade-offs, quality goals, risks, glossary | strong — the sections are ordered the way understanding accretes | **yes** |
| **[ArchiMate](https://www.opengroup.org/archimate-forum)** | a modelling *language* with a typed relationship metamodel | analysable models — you can query them for correctness | weak by design; it is a language, not a pedagogy | **no** — deliberately; it supplies rigour and leaves teaching to others |
| **[DDD](https://www.domainlanguage.com/ddd/)** (Evans) | ubiquitous language + bounded contexts | that the code and the conversation use one vocabulary | **strongest in the set** — the whole method is a learning discipline | **yes** — DDD *is* a waist mechanism |
| **[Wardley Mapping](https://learnwardleymapping.com/)** | value chain × evolution | what is genesis and what is commodity | strong — it changes what you think is worth building | **yes** |

**Three readings that are worth more than the table.**

**42010 is the closest thing in the field to this lens**, and it got there first. Its rule —
*every view must have a stakeholder and a concern* — is the waist stated as a conformance
requirement. A practitioner summary puts its use bluntly: **to stop diagram theatre.** That is
the same instinct as the project's own bar that *a drawing which only renders is a screenshot*.
**Where they differ:** 42010 asks *whose view is this*; the lens asks *what did the person
learn as the system changed*. The first is a static requirement on a document. The second is a
delta across a turn, and only the second can be measured repeatedly.

**ArchiMate deliberately does not pass the waist, and is right not to.** It is a language.
Languages supply analysability and leave teaching to whoever writes in them. Its existence is
an argument this project needs to hear: **untyped relationships are unanalysable**, and this
project's own graph edges are free text today (§6).

**DDD is the friendliest and the most useful.** *Ubiquitous language* names, in one phrase,
what this project spends most of its effort on. Its *bounded context* names what this project
calls a reservation. Published practice already composes DDD with Wardley Mapping and with
Team Topologies, so the vocabulary is not merely available, it is load-tested.

---

## 4 · Where this project sits

**It is not an architecture framework and should not be reviewed as one.** It is closer to a
**laboratory discipline for one operator working with a non-static model** — closer to
DDD and to 42010 than to TOGAF or Zachman.

The parts a reviewer would recognise:

| our part | their nearest word | honest difference |
|---|---|---|
| registers, a 17×4 word table | Zachman's grid | ours classifies **artifacts**; Zachman classifies **stakeholder perspectives**. We have no audience axis |
| cards with a `kind:` and a `falsifier:` | 42010's views-with-concerns | ours attaches a **refutation condition** to each claim; 42010 attaches a stakeholder |
| decks and universes | arc42's sections | ours are unordered and self-declaring; arc42's are ordered and prescribed |
| graph edges (`FROM RELATION TO WHY`) | ArchiMate relationships | **ours are untyped. This is the real gap** |
| the reservation boundary | DDD's bounded context | same idea, worse word. Theirs comes with a literature |
| the loop (guess → try → test → write) | 4+1's scenarios | ours measures the **delta between guess and actual**; scenarios do not |

---

## 5 · What the lens finds that the frameworks do not

**One thing, and it is small enough to state in a sentence:** *the frameworks describe
artifacts; the lens measures a person's calibration changing.*

Every framework above answers **"is the architecture described well?"** The lens answers
**"did the describer's guess get better?"** — which requires the guess to be recorded *before*
the work, and the delta measured after. **OBSERVED:** in this project a per-run estimate ledger
has recorded a token guess and the actual for 59 runs; the guesses converge from above
(600k→250k, 150k→90k, 60k→40k, 250k→215k, 400k→330k). That is a measurement of the *operator*,
not of the artifact, and no framework in §3 has a place to put it.

**Answering the guess from §2:** we score ourselves **above 1 — over-claiming** — at coarse
resolution. The instrument set is young (built within one session), most of it is untested
against anyone else's work, and this document is itself an example of showing more than we
have grounded. **The frameworks in §3 mostly score near 1**: they show a great deal and are
backed by decades of practice, teaching, and tooling.

---

## 6 · What the frameworks find that we do not — the scolding, kept

Each of these is a criticism we accept.

- **ArchiMate:** the edges are untyped and therefore unqueryable. *Accepted; it is the
  largest technical gap.*
- **Zachman:** artifacts are classified, readers are not. There is no audience axis.
  *Accepted.*
- **42010:** views exist; whose views is unstated. *Accepted — and there are exactly two
  named readers, which is a strength if declared and a gap if not.*
- **4+1:** no scenarios. Everything is structure; nothing walks a use case end to end.
  *Accepted.*
- **arc42:** no quality goals, no risk section a reader can act on, and the term ledger is not
  a glossary. *Accepted.*
- **Wardley:** nothing states what is commodity. Several tools here were hand-built where an
  existing package pinned at a commit would have done. *Accepted, and it is the criticism most
  likely to have saved real effort.*
- **TOGAF:** artifacts without a method; the consent gate is a stub that says of itself that it
  gates nothing. **Noted and refused** — an ADM is ceremony this project cannot yet justify to
  the people it serves, and its own standing rule is that process complexity must demonstrate
  lift before it is adopted. *A refusal recorded is not the same as a criticism unnoticed.*

---

## 7 · For DD-B: how the machine behaves here, observed and believed

This section exists because a reader new to non-static models needs it, and because the
explanation is equally useful to such a model reading this document.

**What a non-static model is, for this purpose.** It produces output conditioned on the text
it can currently see. It does not remember previous sessions unless that memory was written to
a file and read back. **Consequence:** everything durable in this project is a file, on
purpose. The model is the worker; the tree is the memory.

**OBSERVED — three failures from one session, each with its number.**

1. **Recorded and read by nothing.** Six times in one session, material existed on disk that
   answered a question, and was not consulted. The sharpest: **twenty files naming Simon
   Brown, across nine dates and a month**, plus a keeper ruling and a card — and the model
   re-derived the fact by web search and briefly filed it as an alarm. *A search result feels
   like rigour: it produces a citation and confident prose while the better answer sits
   unread.*
2. **A test suite half as good as it looked.** Mutation testing — sabotage the tool, ask
   whether its own tests notice — scored the session's suites at **7 caught / 7 survivors**
   on first run. After two targeted improvements: **9 / 5**.
3. **Fixtures passing while reality was empty.** A tool's tests were green while the same tool
   returned nothing on the real tree, because the caller's shell options silently killed a
   loop. *Fixtures covered a shape the project does not have and skipped the shape it does.*

**BELIEVED, with its refutation named.** We believe writing for a human newcomer and writing
for a small model are the same job, because both need claims separated into *observed* and
*believed* and both are harmed by confident prose with no citation. **What would refute it:** a
document that a human finds clear and a model systematically misreads, or the reverse.

**What you can do with this, concretely.** Every tool named here ships an example that runs and
a guess to make first. Take one, guess the number, run it, and compare. **The delta is the
product** — that is the whole method, and you can perform it on us.

---

## 8 · How to check us

- **The frameworks:** all nine are linked in §9. Read one, then re-read §3's row for it and
  disagree.
- **The numbers:** every OBSERVED figure came from a command over a public-shaped tree; where
  the tree is not public, the command is stated so the shape can be reproduced elsewhere.
- **The falsifiers:** claims in this project carry a `falsifier:` field naming what would
  refute them. **OBSERVED:** 21 of 453 cards carry one — 4.6%. That number was 0 at the start
  of the day and it is reported because the low figure is the honest one.
- **The lens itself:** if a framework in §3 passes the waist and its practitioners cannot
  point to a person who learned something as the system changed, the lens is measuring
  something other than what it claims.

---

## 9 · Sources

**Frameworks.** [C4 model](https://c4model.com/) · [C4 model (Wikipedia)](https://en.wikipedia.org/wiki/C4_model) · [Simon Brown](https://simonbrown.je/) · [4+1 view model (Wikipedia)](https://en.wikipedia.org/wiki/4%2B1_architectural_view_model) · [Architectural Blueprints — the 4+1 View Model (Kruchten, PDF)](https://arxiv.org/pdf/2006.04975) · [Zachman Framework (Wikipedia)](https://en.wikipedia.org/wiki/Zachman_Framework) · [TOGAF](https://www.opengroup.org/togaf) · [ArchiMate](https://www.opengroup.org/archimate-forum) · [ISO/IEC/IEEE 42010](https://www.iso.org/standard/50508.html) · [arc42](https://arc42.org/) · [arc42 documentation tips](https://docs.arc42.org/tips/8-5/) · [Domain-Driven Design](https://www.domainlanguage.com/ddd/) · [Learn Wardley Mapping](https://learnwardleymapping.com/)

**Comparative and compositional practice.** [TOGAF, DoDAF and ISO 42010 in a nutshell (Berrisford)](http://grahamberrisford.com/00EAframeworks/TOGAF%20with%20ArchiMate,%20DoDAF%20and%20Zachman.htm) · [Frameworks comparison: TOGAF, ArchiMate, Zachman](https://enterprisearchitecture.work/docs/best-practise/frameworks-comparison-togaf-archimate-and-zachman/) · [Adaptive socio-technical systems with Wardley Maps, DDD and Team Topologies (InfoQ)](https://www.infoq.com/articles/adaptive-socio-technical-systems-flow/) · [Context Mapping — What Is Domain-Driven Design?](https://www.oreilly.com/library/view/what-is-domain-driven/9781492057802/ch04.html)

---

*§3's table is the part most likely to be wrong in a way a practitioner would catch in
one reading, which is why it is a table and not prose.*
