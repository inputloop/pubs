# C4-LANG — the language, standing on its own

C4 is a **design language for keeping knowledge findable across time, tools, and people who were
not in the room.** This document describes the language itself: its namespace, its type system, its
grammar, and the handful of rules that make the rest fall out. It assumes nothing about the project
that produced it and cites no session history. If you know nothing about C4, start here.

The whole of it can be said in one sentence, and the rest of this file is that sentence unpacked:

> **A name is a namespace, a type is a promise you can effect, a grammar is total or it is a trap,
> and every claim carries the tool that could break it.**

---

## 1 · The namespace is a letter

C4 files work under single-letter **registers**. Each letter owns a small table row with four
facets, and the table (`m/t`) is the base class — not a vocabulary, a *shape*:

```
REGISTER  SCALAR      GROUP       COMMAND     TAG
A         ASSET       ARRAY       ADD         ARCHIVE
E         EXPRESSION  ENTITY      EVALUATE    ENVIRONMENT
L         LAYOUT      LIBRARY     LINK        LICENSE
S         SCALAR      SPOKE       SELECT      SEMAPHORE
T         TEMPLATE    TAXONOMY    TEST        TAG
```

Sixty-eight words across seventeen letters. **Sixty-four of them are already common English** —
`add` runs 3283 per million, `function` 1562, `command` 1053. Only four (`asset`, `obfuscate`,
`spoke`, `taxonomy`) are unclaimed anywhere.

That sounds like a defect and is the design. **The table is maximally CONTESTED, and the letter is
what disambiguates.** `c4.o.map` is not OBJECT-in-general; it is *O's* object. The letter is the
namespace, and that is load-bearing rather than decorative. Choosing contested words on purpose
means a stranger can guess what a facet means before reading anything — and the letter keeps two
shops from colliding when they both need the word `map`.

> **Scope, measured rather than assumed (LENS, 2026-08-10).** Letter-as-namespace is **LOCAL**, not
> universal: three neighbouring projects solved "shared vocabulary needs a namespace" without a
> letter — a prefix, a directory, a struct. The letter is a good answer *here*, where a shop wants
> one-keystroke reach across seventeen registers. Offered, never required.

**Corollary — a seam in a name is a feature. Do not close it.** A name carrying several senses is
one representation of *several truths*, none competing to be the same fact. That is generative and
must not be "resolved". The distinct hazard is two representations of *one* truth that can silently
split — a mirror and its source, a cache and its file. Those need a named tiebreaker. **Multiplicity

*2026-10-20 (Mentat, after `h/MODEL-2026-10-19-cxr-column-collection-row-registry.md` and `h/NOTE-2026-10-20-r-c-self-expressive.md`):* the column side has two shapes, both duplicates of `r/` and both kept: an **index**, `c/<column>/<value>`, listing the keys that carry that value (what `tv1cr` writes), and a **mirror**, `c/<column>/<row>`, holding the value its `r/` cell holds (what gw19's `c4mirror.sh` writes); the gauge that re-derives each from `r/` is its named tiebreaker (`tv1cr check`; `c4rc.py`). Neither answers the other's question in one read, and a root `c/` may hold both beside the registers (`c/names`, `c/wf`) that already live there.
of sense: keep. Duplication of fact: fence.** Confusing the two destroys the good property while
protecting nothing, and the cost of multiplicity is paid at the document, never by amputating the
term.

---

## 2 · A virtual type is a word you can effect

A word is a **type** in C4 if the system knows how to *effect* it — give it real behavior,
recognise it, use it. It does **not** need a row in `m/t`.

> "a virtual type simply means a word that we honor as it was a word we know how to effect as a
> type within our taxonomy even though it does not appear as a taxonomy."

`LIST` is the worked example: `m/t`'s L row reads `LAYOUT LIBRARY LINK LICENSE` and gains nothing.
`LIST` is effected instead by a delimiter-to-hash registry — `( ) [ ] { } < >` each pinned to its
own SHA1 — with no taxonomy word anywhere in the loop.

This matters more than it looks. **It decouples "is this real?" from "is this in the table?"**
Taxonomy-completeness questions were checking the wrong ledger. A type is real when something can
*do* it.

Virtual types minted so far, each a word and a promise:

| word | what it promises |
|---|---|
| `TYPE` / `kind` | a means of persistence and/or transport encoding — usually both at once |
| `theme` | a reusable presentation giving continuity across an interface |
| `skin` | an instantiation, example, component, or base for one or several themes |
| `QUERY` | a question or capture, addressable and re-runnable |
| `word` | **the fallback** — see §4, it is the keystone |
| `hunk` | a bounded, editable span carrying its own state |

---

## 3 · The grammar: space binds, case resolves

Two rules do almost all the work, and both are visible in a single declaration.

### Space binds

A `(` that follows a word character **with no space** is an **operator**. A `(` preceded by a space
is **literal text**.

```
as VIRTUAL           spaced  -> operator, then a separate operand
as(VIRTUAL)          BOUND   -> operator applied to its argument, one group
"(virtual) a TERM"   spaced  -> literal prose inside quotes
(virtual)taxonomy    BOUND   -> a cast, C-style: the qualifier applies to the word
```

The consequence is the useful part. An **unquoted** run of prose can be bounded exactly like a
quoted one: it *opens* on a bound cast and *closes* on a bound operator. `as(` cannot occur in
ordinary English, so it terminates a literal run unambiguously — while spaced parentheticals inside
the run, `(visual or user facing)`, are simply walked over as text.

**Quoting and binding are two delimiters for one job, and that is why quoting must never be
load-bearing.** A language in which quotes are the only fence is a language where a stray quote
changes meaning silently.

### Case resolves

```
UPPER   VIRTUAL · KEYS · TAXONOMY · HOST · TERM · TAG      -> resolve against the taxonomy
lower   as · from · toward · into · offering · intern      -> keywords of the language itself
lower   type · kind · theme · skin                          -> the name being MINTED, literal
```

One declaration can carry both cases of one word: `(TAG)` at the head resolves; `tag` inside
`(for C4: tag)` is literal.

**And this is why the terse form is the normal one.** Minting a name in UPPERCASE collides with the
resolve convention, so an uppercase mint must pay for an explicit intern list and plural list. Mint
lowercase and both come free. *The short form is not shorthand for the long one — the long one is
the bill for choosing the harder case.*

---

## 4 · `word`, and why the grammar has no error state

`word` is the **fallback type**: any run that does not resolve **stands for itself**.

That single provision makes the language *total*. Every token either resolves to its usage or
contributes its own literal text, so a usage string can always be rebuilt byte-exact —
`to_literal(to_tokens(x)) == x` holds always, not usually. Without `word`, the round trip has an
error case. With it, none.

**The same rule reappears at every height, and that is the strongest thing in the language:**

| height | what will not resolve | where it goes |
|---|---|---|
| token | an unregistered run | it is a `word`, standing for itself |
| line | an unparseable instruction | it is a **comment**, kept verbatim |
| claim | a check that could not be run | it is **reported**, never asserted |

A language with no error state is not a language that never fails. It is one that **always has
somewhere honest to put what it could not read** — and refusing to invent a reading is the same
discipline as refusing to claim an unrun check passed.

> **LOCAL, and the counter-case is principled (LENS, 2026-08-10).** Neighbouring projects choose
> hard-fail *deliberately* — one rewrote a shell tool in Rust to get it; another carries
> `set -euo pipefail` commented out with intent. Totality is right where the input is a human
> sentence and dropping it silently is the real harm. It is wrong where an unreadable input means
> the world is not as assumed and continuing is the harm. **Totality is a choice about which failure
> you prefer, not a strict improvement** — and a document that presents it as the latter is selling.

---

## 5 · Assertions live inside the language

Guards nest, and an assertion can ride inside an ordinary declaration:

```
[[ … T0ST   T0IN &1 TOUT EQL   TS0T … ]]
 └─ QL guards
      └─ ASSY guard pair (the mirrored name is the pair)
            └─ the assertion: test-in, capture, test-out, compare
```

Because a tag invoked without an execution environment answers with its **usage** — a string — the
assertion is string-typed, and its expected value is the usage string of a prior declaration,
tokenized for the compare.

The effect: **a declaration can ship with its own falsifier, in the same sentence that makes the
claim.** Two names asserted to be synonyms do not merely say so; the second one carries the check
that the first one's usage comes back. This is *"a claim needs a tool that fails it"* written at the
grammar level instead of the tool level.

---

## 6 · Naming law

- **FILE BY WORDS — in this tree, and honestly nowhere else yet.** A new name is **one bare word**;
  compound names exist only as registered patterns, scalars, terms, or classes. LENS tested this
  across twelve projects and it **BREAKS everywhere, including in two projects by the same author.**
  That is not an argument against the rule — a gauge that flags twelve unregistered names is a gauge
  doing its job — but stating it as a property of the *language* was false. It is a property of a
  *shop that runs the gauge*.
- **The separator is never typography.** `-` **avows** a machine-leaning hand; `_` a human one. A
  disavowal is a controlling disclosure.
- **A register is only as real as the gauge that reads it.** A ledger that declares more classes
  than its consumer consumes has classes that accept writes and do nothing. Before trusting any
  registry, ask which reader consumes which rows.

---

## 7 · What a tool owes

- **Declare MUST or JOURNEY.** Which outputs are mechanical, which are authored. Undeclared reads
  as MUST, so silence is a claim.
- **`DATASET` is unauthored fact; `EXPRESSION` is authored voice; a MARKER flags the authored, and
  silence reads as fact.** So an authored line without its marker is a small lie.
- **A claim needs a tool that fails it** — and its sharper twin: **a test needs a mutant it kills,
  or it is only watching.** Give every positive control a negative twin.
- **Tools prove; DROPPED code delivers.** Anything that forks and dies can only demonstrate. Only a
  sourced function leaves capability behind in the caller. Say which one you are building before you
  build it.
  > **Word changed under LENS, and the reason is worth more than the rule.** This was written
  > "generative code delivers" — and a neighbouring project in the same shop, by the same author,
  > mastheads its output *"Generated by `pmo-report`"* in the ordinary sense: a fork-and-die tool
  > that writes a file. Which by this very taxonomy makes it a **tool**, not generative code. The
  > document had redefined a common word to mean nearly its opposite, with **no error signal when a
  > stranger got it wrong** — the exact failure §1 warns about, committed in §7. `dropped` is
  > unclaimed and carries the meaning; `generative` stays available in its ordinary sense.
- **Report the absence of an instrument rather than quoting a number without one.**
- **Load-bearing changes are built twice, independently, and kept apart** — agreement is evidence,
  disagreement is information, and a second hand that agrees with the *answer* while rejecting the
  *reason* is the strongest agreement available.

---

## 8 · Run-levels

Capability is exposed in ordered levels — bootstrapping, containers, and upward through the real
lifecycle: configure, make, install, setup, self-test, enablement. Each level is a signal, and what
a caller may reach varies by the level in force. **A tool that never graduates toward a higher level
of assurance is itself a smell.**

---

## 9 · Findable is not the same as trustworthy

**The gap LENS found, and it was a real hole.** Everything above makes knowledge *locatable* by a
stranger. None of it tells that stranger whether what they found is **the thing that was meant,
unmodified**. Four of twelve surveyed projects treat exactly this as necessary infrastructure,
separate from naming — signatures, sentinels, verify-only defaults, and one project that exists only
to be a consent-and-provenance layer. A language promising reach for people who were not in the room
owes them the second half.

The minimum the language must carry, stated as rules rather than machinery:

- **Signed is not blessed, and a higher version is not canon.** A signature says *these bytes are the
  ones that were signed*. It says nothing about whether they were right.
- **Byte-match is one source; identity is the independent second.** A check run twice by one hand is
  one check. A leg is real only when a second authority re-runs it on the same canonical content.
- **"Could not check" is a third outcome**, and it must never share a channel with "checked and
  passed". Most trust erosion is a status code that lost this distinction.
- **The trail must be complete or the claim is void.** If retracing a thing to its principle needs
  something the author kept back, it does not pass — no matter how good the reading.

Findability without provenance is a filing system. The two together are the point.

## 10 · The shape of the whole

Everything above is one idea seen from different sides: **make the thing findable later, by someone
who was not there, without asking them to trust you.**

The letter makes a name findable without a lookup. The virtual type makes a word real without a
table. The bound cast makes a boundary visible without quoting. `word` makes the grammar total so
nothing is silently dropped. The inline assertion makes a claim checkable at the point it is made.
The mutant makes the check itself checkable. And the declaration of MUST versus JOURNEY tells a
stranger which parts of the output they may re-derive and which parts are somebody's voice.

None of it requires an AI to run or read. Every tool is plain POSIX shell or plain Python; every
record is a plain file. The bearing of AI here is the reverse of the usual pitch: **an AI helped
build this; none is required to hold it to account.**

---

*Challenged under LENS across twelve real projects, 2026-08-10 — verdicts and receipts in
`journal/LENS-2026-08-10-c4-lang.md`. Six claims survived contact with projects that did not grow
them; two were rescoped to LOCAL; one word was wrong and is changed above; one whole section was
missing and is now §9.*

*This file is a MODEL — an EXPRESSION, authored, and it carries this marker rather than reading as
fact. It describes a language still in motion; where it and a running instrument disagree, the
instrument is the truth and this file is the thing to correct.*
