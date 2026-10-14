<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# SPEC · model-check, version 3

- **Owner:** no person yet; drafted by an AI assistant (Claude, model claude-opus-5-5), the consolidation run of
  2026-09-30, for the keeper's review · source: version 2 is G1CC2's `SPEC-model-check.md`; this version follows
  the consolidated form of "Plain Rules for AI Help".
- **Licence:** prose CC BY 4.0. The two implementations, `model-check.sh` (POSIX sh + awk) and `model_check.py`
  (Python 3, standard library only), are GPL-3.0-or-later. Where they disagree, this text decides.

## What it checks

The *form* of a "Plain Rules for AI Help" file: the head, the core, each rule's owner and check, the reasons and
evidence at the back, the falsifiers, the baseline ledger, and the sources. It does not check whether a rule is
wise, whether a field is true, or whether evidence says what a rule claims.

Every finding is one line, `RED  <code>  …`, `NOT CHECKED  <code>  …` or `NOTE  <code>  …`, then a summary and an
`In words:` line. Exit **0** OK (every check looked and passed), **1** RED (at least one RED), **77** NOT CHECKED (no
RED, but something could not be looked at, or no rules, or no file). It never answers 0 over nothing, and no message
prints a private value.

## Reading the file (unchanged from v2 unless marked)

1. One trailing CR is removed from every line of the model and of every source (F1).
2. **Logical lines:** a blank line ends one; a line beginning `#`, `- `, `|`, `<digits>. ` or `---` starts one; any
   other line joins the current one with a space.
3. **Head:** logical lines before the first `## `. **Foot:** physical lines after the last line that is exactly `---`.
4. **v3 Core:** logical lines after the heading `## The model`, up to the next `## ` heading.
5. **Rule block:** from `### Rule <n> ` to the next `##`/`###` heading. **v3 Why block:** from `### Why Rule <n> `
   to the next heading, under `## Why each rule is here`. A **field** is `- **<Name>:** <value>`; the first of each
   name in a block counts.
6. **Kept / Left-out items:** logical lines `- BASE L…` under `### Kept` / `### Left out, and why`.
7. **Sources table:** rows `| name | path | sha256 |` after `## Sources`, up to the next `## ` or `---`.
8. **Rule references:** every `Rule <n>`, and after `Rules <n>` each following `, <m>`, ` to <m>` or ` and <m>`
   (v3 adds the comma). `### Rule` headings are not references; `### Why Rule` headings are.
9. **Base paragraph starts** and **hard lines:** as v2.
10. **v3 Labels** (`RED:`, `NOT CHECKED:`, `Shown wrong if:`, `source:`) are looked for after runs of spaces, tabs
    and line breaks are collapsed to one space, so a label wrapped across two lines still reads.

## The checks (v3 marks what is new or changed)

| code | checked | RED | NOT CHECKED |
|---|---|---|---|
| F0 | the model is readable and not empty | | it is not |
| H1 **v3** | the head has exactly one `- **Owner:**` line, and its value is not a placeholder | absent, twice, or a placeholder | |
| H2 | the head's Licence line names `CC BY 4.0` and `GPL-3.0-or-later` | absent or either missing | |
| H3 | one of the first 3 lines carries `SPDX-License-Identifier: CC-BY-4.0` | absent | |
| H4 | the foot carries `©` and `CC BY 4.0` | absent | |
| H5 **v3** | each backticked file name in the Licence line that sits beside the model carries `SPDX-License-Identifier: GPL-3.0-or-later` in its first 10 lines | present without it | (NOTE only, if absent: a model may travel alone) |
| C1 **v3** | the core exists and holds no evidence id or baseline reference (`R2S-`, `R3S-`, `paper:`, `row1:`, `BASE L<n>`) | no core, or an id in it | |
| R0 | at least one rule | | none |
| R1 | rule numbers are unique | twice | |
| R2 **v3** | each rule block has non-empty `Owner` and `Check` fields | absent or empty | |
| R3 | a Check does not begin with a backtick | it does | |
| R4 | a Check has a by-hand step, then `RED:` and `NOT CHECKED:`, each followed by a condition that is not a placeholder | otherwise | |
| R5 | a heading beginning `### Rule` reads `### Rule <n> ` | otherwise | |
| R6 **v3** | each rule block has rule text (a logical line that is not a field) before its first field | none | |
| R7 **v3** | no `### Rule <n>` heading outside the core | one is | |
| O1 **v3** | each rule's Owner names `source:` with a value that is not a placeholder | otherwise | |
| W1 **v3** | each rule has exactly one Why block, and each Why block names a rule that exists; a Why block has non-empty `Evidence` and `Baseline` and a non-placeholder `Drop it if`; Baseline names `BASE L<a>[-<b>]` or begins `new` | otherwise | |
| X1 | every rule reference names an existing rule | | |
| X2 | `These are <N> rules` (digits or one to twelve) equals the rule count | it does not | |
| D1 **v3** | each row of the table under `### Choices` has four cells, the last three not placeholders | a short or empty row | |
| K1 **v3** | the core names each of the five lists `HEAD`, `RULES`, `HELD`, `HANDS`, `MEETINGS` exactly once, as a physical line that starts (after any indent) with the name and holds at least one ` · `; that line has at least three parts | missing, twice, or under three parts | |
| L1 **v3** | each numbered item under `## Honest limits` carries `Shown wrong if:` and a non-placeholder condition | an item without | no such section |
| P1 **v3** | each row of the table under `## Why each other part is here` has a non-placeholder last cell (`Drop it if`) | an empty one | no such section |
| E1 **v3** | each evidence id has a known form: `R2S-NNN`, `R3S-NNN`, `paper:<F\|S\|W\|O\|T><n>`, `paper:sec<n>[a-z]`, `row1:<ID>` | unknown form | |
| E2 **v3** | each id resolves; R3S ids in the row-3 score's `### R3S-NNN` headings; the rest as v2 | does not resolve | its source cannot be read |
| E3 **v3** | each rule has at least one *holding* id: R2S; R3S; paper S; paper sec; paper F whose Status cell does not begin `NOT YET`; a row1-conclusive id whose verdict is not ask-keeper. Paper W and T show a need; paper O is a proposal; contested, new-ideas and F-not-yet-shown ids are listed. None of these holds | no holding id | no holding id and a source was unreadable |
| E4 | an ask-keeper row prints a NOTE and does not hold | | |
| E5 | Evidence that says only `none yet` reads NOT CHECKED for that rule | | always, for that rule |
| S1 / S2 | each source can be read; its sha256 equals the table's | S2: changed | S1: unreadable; S2: no sha256 tool |
| S3 | the table's sha256 equals the checker's own pin, for every name it pins (v3 adds `score3`) | a different copy | |
| Q1 / Q2 | a quote `"text" (org-rule L<a>[-<b>])` is in those lines word for word, and starts and ends on word boundaries | not found, out of range, unreadable marker, cut mid-word | org-rule unreadable |
| Q3 **v3** | a logical line that labels a strength with a colon (`forbids:`, `requires:`, `prefers:`) carries at least one such quote | it does not (a retelling) | |
| B1-B6 | baseline accounting as v2; B6 reads the named rules' Baselines from their Why blocks | as v2 | base unreadable |
| G1 | NOTE: the widest Kept or Left-out item | | |
| Z1 **v3** | NOTE, never RED: a line holding an invisible or direction-changing character (U+00AD, U+200B-200F, U+2028-202E, U+2060-2064, U+2066-2069, U+FEFF) | | |

A **placeholder**, lower-cased and stripped of edge spaces and punctuation, is empty or one of: `n/a`, `na`,
`none`, `nothing`, `never`, `tbd`, `tba`, `todo`, `unknown`, `to be written`, `to be decided`.

**Why Z1 is never RED.** A correctly written Arabic, Hebrew or Persian file may need direction marks or zero-width
joiners. A rule or check that made them RED would fail such a file (a judge's DROP in row 3). So the check shows
where they are and leaves the reading to a person. A word hidden with them in prose passes with a NOTE.

## Pins (S3)

The checker holds its own sha256 for score, score3, paper, row1-conclusive, row1-contested, new-ideas, org-rule and
base. `--pins FILE` (lines `name<TAB>sha256`) replaces them, for `--prove-red`'s fixture and for an adopter's own
sources.

## Prove-red

`--prove-red` builds a clean fixture (a model and its eight sources), checks that it reads OK with its E4 and Z1
notes, then plants one fault at a time, each with its expected exit and code stated before it runs. Controls that
must read OK: the clean fixture (which holds a right-to-left word with a direction mark), its CRLF copy, a hidden
override in prose (a Z1 NOTE), a code file absent from beside the model (an H5 NOTE), a label wrapped across two
lines, and a prose line that begins with a list name. A plant that changes nothing is SETUP and fails the run. **These plants are the author's own. Under Rule 5 they do not show the
check able to fail; only plants by someone else do (R3S-001).** The other readers' plants are run by
`plants-others.sh` and reported in `PLANTS-others.tsv`.

## What it still cannot see

- Whether a check is good, a field true, or evidence on point.
- A retelling of the organization's rule that has no quote marker and no strength label.
- A quote cut on a word boundary so that it reverses the meaning, or a strength word that misreads a true quote.
- A word hidden in prose by invisible or direction-changing characters (Z1 shows it; it is not RED).
- Whether the head's named owner ever adopted the file, or whether a law named under Rule 1 exists and says so.
- Ids written in the prose of a Why block: only the `Evidence` line is resolved (an outside plant, MB-F7, showed it).
- A one-word quote that carries a retelling (no floor on quote length, because any floor would be invented).
