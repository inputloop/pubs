# NOTE 2026-09-27 — erratum beside the edrx boards: one mistitled link, one quote not on its page

*Form: NOTE (`c/wf:1`). It lands in `h/`, beside `h/LENS-2026-08-30-edrx-mathforward-boards.md`, and does
not edit the boards.*

**The finding, quoted.** From the deeper round on those boards:

> "The boards attach the second title to the first link (`LENS-2026-08-30…:104`). This is a citation fix
> to carry." … "The boards quote *"no discussion, no image, no context"* from a CNRS article
> (`LENS-2026-08-30…:206`). My fetch of that page did not find the phrase."
> (`h/LENS-2026-09-27-edrx-deeper-round.md:61-62`, `:67-68`)

I re-fetched all three pages today (2026-09-27) before writing this.

## Defect 1 — `h/LENS-2026-08-30-edrx-mathforward-boards.md:104`: right link, wrong title

**What the boards say:** `[Blake E. Reid, "Internet Architecture and Disability"](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4262991)`.

**What is wrong.** SSRN 4262991 is a different Reid paper.

**What is known to be right** (observed today):

- SSRN 4262991, fetched: title "The Curb-Cut Effect and the Perils of Accessibility without Disability",
  "Forthcoming in *Feminist Cyberlaw*", posted 2022-11-03. (A direct `curl` of the page returned "Content
  Blocked"; the WebFetch reading succeeded.)
- The same chapter as published: Blake E. Reid, "The Curb-Cut Effect and the Perils of Accessibility
  without Disability", in *Feminist Cyberlaw*, University of California Press, 2024,
  <https://luminosoa.org/chapters/e/10.1525/luminos.190.i> (fetched; title, author, book, publisher and
  year all match).
- "Internet Architecture and Disability" is SSRN 3338589, fetched: Blake E. Reid, *Indiana Law Journal*
  vol. 95, p. 591 (online 2019-03-12).

**The corrected line** (the boards' claim is unchanged, and it matches the curb-cut paper, whose title
carries the boards' own quoted phrase "accessibility without disability", `:105`):

> Blake E. Reid, "The Curb-Cut Effect and the Perils of Accessibility without Disability", *Feminist
> Cyberlaw* (UC Press, 2024) — <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4262991>

## Defect 2 — `h/LENS-2026-08-30-edrx-mathforward-boards.md:206`: quote not found on the cited page

**What the boards say:** Bourbaki *"no discussion, no image, no context"*, linked to
<https://news.cnrs.fr/articles/bourbaki-and-the-foundations-of-modern-mathematics>.

**What is wrong.** The phrase is not on that page, by two routes today: a WebFetch reading found "no
instances" of "no discussion" or "no image"; and `curl` of the raw page (74,296 bytes) with
`grep -i 'no discussion\|no image'` found nothing (`grep -ci context` → 0). I did not find the phrase's
source elsewhere in one web search. So it stands **unverified**, not **false**: it may be a fair summary
someone wrote in quotation marks.

**What is known to be right,** on the same page, verbatim: "The group, which included André Weil and Henri
Cartan, as well as Claude Chevalley, Jean Delsarte and Jean Dieudonné, decided to adopt an axiomatic
presentation for their treatise, clearly formulating the basic rules (axioms) and deducing the related
theorems by logical reasoning, expressed in simple terminology."

**The corrected cell,** keeping the boards' point (terse, axiomatic style, chosen on purpose):

> Bourbaki "decided to adopt an axiomatic presentation for their treatise, clearly formulating the basic
> rules (axioms)" ([CNRS](https://news.cnrs.fr/articles/bourbaki-and-the-foundations-of-modern-mathematics));
> the "no discussion, no image, no context" gloss is unsourced.

## What that changes

- The boards' arguments stand. The Reid complication is Reid's (the curb-cut chapter says it, p. 107, as
  quoted in the deeper round, `h/LENS-2026-09-27-edrx-deeper-round.md:63-64`; I did not re-read the
  chapter's pages myself). The Bourbaki row's verdict
  "AGAINST" rests on the style, which the verifiable line supports; the deeper round says B5 "does not
  depend on" the unverified quote (`:305-306`).
- Nothing else in the tree repeats either defect: `grep -rn '4262991\|Internet Architecture and
  Disability\|no discussion, no image'` over the corpus hits only the boards (and today's deeper round,
  which reports them).

## What is owed

If the published motive-inversion paper (on his H: drive, not in the snapshot) carries either citation,
the same fix applies there. Whether to add a dated note to that paper is decision `owed-writing-D3` (his).
*Falsifier:* the phrase "no discussion, no image, no context" is found on the CNRS page (in a part the
fetches missed, such as a caption or a paginated section); then defect 2 is withdrawn.

---

LENS · the edrx boards' citations · 2026-09-27
a  my view: a wrong title and an unverified quote are small, but the boards are cited as outside evidence, so they must be right. / b  the view I ascribe Corwin: fix the record where it is read; keep the argument that survives. / c  their pull on mine: kept "unverified" from becoming "false" on one missed fetch. / d  my pull on theirs: asks him to let the Bourbaki cell carry a plainer quote than the memorable one.
persona / inverse: a reader checking the link from the boards says "the title now matches the page I land on" / the inverse, a reader who distrusts the fix, finds something new: the correct title contains the boards' own quoted phrase, so the original claim was always about this paper and only the label slipped.
principles reframe: 1. Universalism: credit goes to the right work of the right author, as for anyone's. 2. Freedom to study: a citation a stranger can follow to the words it quotes is part of what makes the work studiable.

Authored by Mentat (for Corwin), 2026-09-27. DRAFT — unsigned; his to bless, change or discard.
