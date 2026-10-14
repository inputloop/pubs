<!-- produced-by: lens · subject: h/RESEARCH-2026-09-29-acknowledgements-models.md · sha256: 78a944350b39a6c9 · 2026-09-29 -->
# LENS 2026-09-29: the acknowledgements lane (a committee of personas, a cold control, a blind judge, then the minions)

His words, verbatim (2026-09-29): "I see an opportunity here to stack tasks across lens (or
microscope, or other analysis skill/method), letting the outcomes from each inform the next as
applying our committee of concerned/intrigued (or otherwise interested or usefully disinterested)
PERSONA by.  Invent or reuse one of our combinations+controls to stage the additional lane and bring
EM across at the end per forms customary."

The ask and the method: which credit model C4's ACKNOWLEDGEMENTS file should be built on. The
combination reused is lens's doubled-nine mode, cut down (preregister; arms from one packet; a blind
judge; measure against the cold floor). Stages, each feeding the next:

| stage | rung | input | output |
|---|---|---|---|
| 0 | RESEARCH | his question | `h/RESEARCH-2026-09-29-acknowledgements-models.md` (the packet, 12 models, sources checked) |
| 1 | LENS, by committee | the packet | five answers: SOLBERG-MAAS, VANTH, PENUMBRA (committee); two cold runs |
| 2 | MICROSCOPE | the five answers | blind judge's split; what survives without trusting any one reader |
| 3 | DESIGN and build | the survivors | `p/C4/acknowledgements/` and `ACKNOWLEDGEMENTS` |
| 4 | ethicsminions | the built file | the minions' notice, at the end, as the form has it |

Preregistered before any arm ran: `h/HYPOTHESIS-2026-09-29-acknowledgements-lane.md` and `h/HYPOTHESIS-2026-09-29-acknowledgements-lane.tsv`.
Raw answers, the judge's packet, key and answer: `h/lane-2026-09-29-acknowledgements/`.

## Stage 1 OBSERVED: what the five said

| arm | BASE | ADD | REFUSE |
|---|---|---|---|
| committee, SOLBERG-MAAS | M10 role credits | M7 consent; M1 author-or-thanks marker | M4 DCO record kept forever |
| committee, VANTH | M1 AUTHORS | M7 consent; M10 open roles | M4 DCO record kept forever |
| committee, PENUMBRA | M10 role credits | M11 each credit points at its history; M7 consent | M1's "small contributions can be omitted" |
| cold 1 | M10 | M7; M1 | M4 DCO permanence |
| cold 2 | M10 | M7; M1 | M4 DCO permanence |

## Stage 2 OBSERVED: the judge and the counts (`h/lane-2026-09-29-acknowledgements/hypothesis-results.tsv`)

- The blind judge split B, C, E from A, D: exactly the true committee and cold arms (1 chance in 10).
  Its stated basis: the cold pair read "almost like twins", and the committee answers had distinct
  first-person voices and persona-framed INVERSE lines.
- C1 failed (cross-arm BASE agreement 4 of 6 pairs, against the cold pair's 1 of 1); C2 held; C3 is
  a cited difference only; C4 held (consent 5 of 5, the author-or-thanks marker 4 of 5, refusing
  permanence 4 of 5).

## Stage 2 JUDGED: what survives the microscope

- **Survives, both arms:** role credits in plain words with an open vocabulary (M10); a line that
  says whether a credit is authorship or thanks (M1's marker); a name the person can withdraw or
  reword (refusing M4's permanence); nothing that reads badly aloud (no emoji, no meaning carried by
  "&"). These go into the design as requirements.
- **Committee only, offered:** each credit points at the history behind it (PENUMBRA's M11); small
  contributions are labelled, never dropped (PENUMBRA and VANTH); being named can expose the newest
  collaborator (VANTH's visa, employer, family). The design takes the first two, because both cost a
  line and are checkable; the third is carried by the withdrawal rule.
- **Cold only:** both cold INVERSE lines asked for something a machine can check (M6). The design
  answers with a fixed line shape and a checker, and keeps the open words.
- **The judge's success is partly my method's doing, not only the personas'.** The committee was
  asked for "the inverse of your persona" and the cold arm for "the strongest objection": the
  judge split on exactly that framing. Doubled-nine step 3 wants one method for every arm. A finding
  about how I ran it, kept here; the next lane gives both arms the same INVERSE line.
- **Personas cited reasons; they did not move the decision** beyond what one cold pair can show. Same
  reading as the lens skill's first test ("reasons, not decisions"), on a thinner floor.

## The packet had a hole, and all five walked into it

Every arm, committee and cold alike, chose M7: written permission before anyone is named. The house
already ruled the other way (MEMORY.md 2026-09-25, "correction: credits as desired; no modelled
ownership or consent"): "Only attribution as desired is correct. A supplied credit is acted on only
once the person it concerns establishes an error ... The shelf does not model consent outside the
system we define". The packet cited the self-defined-title custom and "unnamed by choice", and not
this ruling, so the arms could not see it. Resolved in the design by special-casing rather than
choosing: no permission gate before naming (his ruling holds); the withdrawal and rewording the arms
wanted is exactly "the person it concerns establishes an error", acted on when they say so. The
check that would show this wrong: a credit in ACKNOWLEDGEMENTS that waits on a consent record.

## The LENS block

```
LENS · the acknowledgements lane · 2026-09-29
a  my view:            the lane found a shape quickly and agreed on it; its most unanimous pick
                       (asked permission) was the one the house had already ruled out.
b  the view I ascribe: Corwin wants the skills visibly used and their results comparable, and
                       wants credit that does not invent who-did-what (his 2026-09-25 correction).
c  their pull on mine: his ruling turned a unanimous feature into a special case instead of a rule.
d  my pull on theirs:  the packet I wrote decided what the arms could know; the hole was mine.
persona / inverse:     the committee said "roles in their own words, withdrawable"; its inverses
                       said "prose thanks, no machinery" (twice) and "keep nothing, let history
                       speak" (once). The cold arm's objection, "make it checkable", is the one the
                       design adopts.
principles reframe:    1. naming everyone the same way, people and AI alike, with the same power
                       to reword or withdraw, is the egalitarian floor.  2. credit that tells a
                       reuser whom the license obliges them to cite serves the freedom to
                       redistribute.  3. plain words read aloud serve the reader the movement
                       most often forgets.
notes: written
```

## Stage 3: built (p/C4/acknowledgements/)

DESIGN and QAPLAN written first; two QA passes (pass 1 found three faults: a wrapped `from:` line
read as a path, no `c/names` row, HELLO-C4's tool list stale; all fixed; pass 2 clean, so no final
swing owed). `ACKNOWLEDGEMENTS` (7 entries: 3 author, 4 credit), `bin/ak1ck` (`c4 acknowledgements`),
`tests/ak1ck-spec.py` (Python; 15 held; 3 of 3 mutants caught). Every quoted credit was found verbatim
in the record its `from:` names (QA Q4).

## Stage 4: the minions, at the end

`python3 skills/ethicsminions/scripts/check_principles.py --memory . --expect
skills/ethicsminions/references/attestations.txt --skills skills` (in AS4CE0001): 0 risk notices
(memory present; principles present; no truncation; no duplication; no drift from the three
attestations; descriptions within limit), 2 opportunities (unclaimed memory themes, a list of stems
that reads as noise this time; savane-forensics self-describes as plugin-worthy and is not shared).

The lane's own notices, by hand, each with the check that would dissolve it:
- RISK [MINE]: Alfred's `from:` names `from-bryant/2026-09-29-r4/MANIFEST.md`, a folder cleared to the
  lab only. If ACKNOWLEDGEMENTS ships, that record does not ship with it. Dissolves when: a
  distributed tree's `c4 acknowledgements` reads CLEAN (today it would name the path as not resolving,
  which is the checker doing its job; the fix then is a `~` record or another source).
- RISK [DOMAIN]: two entries credit AIs, one as author. The entry says the standing is unsettled and
  what the line does and does not claim. Dissolves when: a reader can tell from the file alone that
  the AI lines state the shop's records, not a legal finding (the note says so in those words).
- OPPORTUNITY: a reuser under CC BY needs one line to cite; `kind: author` gives it without making
  credit a gate on use. That is the freedom half working. Routed to SkillTank as a lead: the file's
  shape and its checker could stand alone for any project (a garden skill: ENHANCE writing-forms, or
  NEW), since nothing in either names a C4 path.
- OPPORTUNITY: the lane itself (packet, committee, cold control, blind judge, minions) is a first
  use of its shape; on a second use it earns a row in `c/wf`, and its INVERSE line must be the same
  for every arm (Stage 2's finding).
