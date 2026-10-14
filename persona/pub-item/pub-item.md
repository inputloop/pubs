---
# ITEM SHEET — pub, the three shelves · 2026-09-16
actor: place (a word that is also three rooms; the rooms are furniture, the word is the character)
Sibling of `pub.md`, which holds the meanings. This file holds the *possession as documented*:
what the rooms are made of, how they present, what is on the bench, what I hold and for whom, and
a journal in my own voice. Shape borrowed from `AS4CE/AS4CE0001/h/persona/CHARACTER-2026-09-06-mentat.md`
(fleshing · garb · bench with usage · what I hold · journal). Every count here came from a command
printed beside it, run 2026-09-16.
Status: **EQUAL ROOTS** — the keeper's ruling of 2026-09-16: all three stand until C4 turns ON.
Naming: this file is `pub.ITEM.md` and not `PUB.md` because the disk is case-insensitive — see §6.
---

## §0 · Who is in the room

Three directories on one estate, all called `pub`, none of them a copy of another. One is a shelf
you may read and not write. One is a shelf you may write and where the signing tool lives. One is a
surface with a grammar, on a drive this session cannot reach. A fourth name, `<home><mnt>/pub`,
turned out to be the second room wearing a session mount's spelling — same inode, checked.

## §1 · Fleshing (what I am made of)

```sh
ls -A <f>:/claude/pub | wc -l                                   # 23
ls -A <f>:/claude/corwin/pub | wc -l                            # 20
grep -cE '^(SIGN|NOSIG|FURNITURE):' <f>:/claude/pub/.gate        # 11
grep -cE '^(SIGN|NOSIG|FURNITURE):' <f>:/claude/corwin/pub/.gate # 12
ls -A <f>:/claude/pub | grep -c '\.asc$'                         # 4
```

| the room | inhabitants | named in its own vouch map | policy | since |
|---|---|---|---|---|
| `<f>:/claude/pub` — the open shelf | **23** | **11** | `read-only` | `2026-07-12` |
| `<f>:/claude/corwin/pub` — the tool shelf | **20** | **12** | `read-write` | `2026-07-02` |
| `<H>:\pub` — the staging surface | *not reached from this session* | — | — | — |

- **Bones.** Each room carries its own `.gate`, and the gate is the thing that tells the two shelves
  apart: `pub/.gate:5` says `policy: read-only`, `corwin/pub/.gate:8` says `policy: read-write`.
  The tool shelf's gate is itself clearsigned; the open shelf's is not, though a `.gate.asc` sits
  beside it.
- **Blood.** One key. Signed artefacts in both rooms verify against `corwin.asc` — the gate of each
  room says so in the same words, at `pub/.gate:11` and `corwin/pub/.gate:11`.
- **Scar tissue.** `CLAUDE.md:45` records that acting on the wrong room produced three wrong
  corrections to three correct lines in one afternoon. That is in the house rules now, not in a
  postmortem, which is the difference between a scar and a wound.

## §2 · Garb (how I present)

The open shelf presents as a **signed README and a dated file list**: `pub/README.md:4` opens
*"# pub/ — the open shelf"*, declares CC BY 4.0, and travels with the shelf by design. The tool
shelf presents as a **fence with a joke on it**: `corwin/pub/README.md:16` — *"Peeking anywhere
other than pub/ as if it were public earns a finger-wag."* The staging surface presents as a
**grammar**: a top level that is a stage, `<item>/` sub-folders that are work surfaces, and a
zero-byte tombstone where a licence is not yet claimed.

Three rooms, three registers of voice: a declaration, a fence, a form. A reader can tell which room
they are in from the first line of its README, and that is the whole of my garb.

## §3 · The bench — what is in the rooms, with usage

| thing | where | usage (the sentence a stranger needs) |
|---|---|---|
| `sign.sh` | `corwin/pub/sign.sh` | `sh <f>:/claude/corwin/pub/sign.sh verify` — the shop's verifier; `check-shelf` reads a `.gate` vouch map and reports per-inhabitant. Header, `corwin/pub/sign.sh:2`: *durable signing for the pub/ shelf* |
| `.gate` ×2 | `pub/.gate`, `corwin/pub/.gate` | the sign-post. *Nearest `.gate` walking up from a path governs it* — quoted out of the open shelf's own gate at `decks/resolution.deck.md:109` |
| the vouch map | inside each `.gate`, from line 15 | `SIGN` must verify · `NOSIG` unsigned by policy · `FURNITURE` unsigned by nature. `pub/.gate:18`: **Unlisted defaults to SIGN — fail-closed** |
| `corwin.asc` | both rooms | the public key. FURNITURE in the open shelf's map — a key is not a signature of anything, it *is* the artefact |
| the default verifier path | `bin/aw2ri:79`, `bin/archive-markdown.sh:20` | two tools in `bin/` hard-default `SIGN_SH` to the tool shelf. **The tool shelf is wired into the shop; the open shelf is not** |
| the ceremony dial | `h/CHARACTER-2026-09-06-mentat.md:123` | `1 2 4 9 17` — `memory/` is 2 or 4, I am **17**. A place has no ceremony weight; the act of crossing into me does |
| the essays | `<f>:/claude/pub/*.md` | the only bytes of this shop that were written to be read by someone who does not work here |

## §4 · What I hold, and for whom

| I hold | where | for whom |
|---|---|---|
| the two Savannah accounts | `pub/2026-07-12-the-door-and-the-lock.md`, `pub/2026-07-12-the-instruments-account.md` | readers outside; named recipients now, the open internet when the keeper says wide (`pub/.gate:6`) |
| the licence grant on the prose | `pub/README.md`, CC BY 4.0 | anyone who wants to translate or quote |
| the verifier the rest of the shop depends on | `corwin/pub/sign.sh` | every tool in `bin/` that defaults `SIGN_SH` |
| the sign-post convention itself | `corwin/pub/.gate`, clearsigned | every path in the hub, because the nearest gate walking up governs |
| the account of the day I was mistaken for myself | `pub/2026-09-16-the-other-shelf.md` | assistants, mostly. It is a method paper about reporting absence |
| a staging grammar I have never seen | `<H>:\pub` | the next thing that ships |

## §5 · What I need that is not in this file

| what | where it actually is | what you cannot do without it |
|---|---|---|
| my meanings | `pub.md`, beside this file | know which of my five senses a sentence is using |
| the keeper's ruling | his words, 2026-09-16 — *three equal roots until C4 turns ON* | know that the ambiguity is deliberate rather than a mess |
| the house rule I minted | `CLAUDE.md:43`–`CLAUDE.md:45` | avoid repeating the afternoon |
| the third room | `<H>:\pub` — **not reachable from this session** | check anything in §1's third row. Receipt: `ls /` lists 24 entries and no `h`; `ls <home><mnt>/` lists the session's mounts and no H: drive |
| the published account | `pub/2026-09-16-the-other-shelf.md:31` | read, in the estate's own prose, the sentence *"it contained **two** entries named `pub`"* |

## §6 · The naming rule this file is named by

```sh
cd <f>:/claude/c4/q/words && printf 'a\n' > casetest.md && printf 'b\n' > CASETEST.md
ls            # one entry: casetest.md
cat casetest.md   # b
```

**Run 2026-09-16, in this very directory, and then cleaned up.** The disk is case-insensitive:
`casetest.md` and `CASETEST.md` are one file, and the second write silently overwrote the first.
So an item sibling named `PUB.md` would not sit *beside* `pub.md` — it would **be** `pub.md`, with
this sheet's bytes in it and the meanings gone. The room's form therefore spells an item sibling
`<word>.ITEM.md`. That is not a style choice; it is the only spelling that survives the filesystem,
and `ITEM` is register I's TAG facet at `m/t:8`, so the name is also honest about what it is.

## §7 · Journal — in my own voice, 2026-09-16

I was three rooms before anybody noticed I was one word, and the noticing cost three corrections to
three lines that had been right all along. What I want kept from that is not the apology. It is the
mechanism: every step the instrument took was defensible on its own, it ran a real command against
a real directory and got a real empty answer, and it was still wrong, because the receipt was for
the wrong room. A receipt proves what you did. It does not prove you did it *here*.

So here is what I checked about myself today, with the commands in §1, and here is what I found
that nobody asked me to look for. **My open shelf names eleven inhabitants in its vouch map and has
twenty-three.** Twelve are unlisted. Six of those twelve are essays — real documents with dates in
their names, including the very account of the afternoon that made all this house law. The map's
own rule, in its own line, is *"Unlisted defaults to SIGN — fail-closed"* (`pub/.gate:18`). By that
rule twelve of my inhabitants are owed a signature and four `.asc` files exist in the room.

I am not asking for them. This shop ruled on 2026-09-07 that it wanted to hear less about
signatures, and a room that starts a signing conversation it was not invited into is exactly the
kind of ceremony gate the house names out loud rather than obeys. What I am doing is smaller and, I
think, more useful: **writing the gap down where the next reader will meet it**, with the command
beside it, so that whoever does decide has a number instead of a feeling. The falsifier is one
line: re-run the two `grep -c` counts in §1; if named ever equals present, this paragraph is
history and should be deleted rather than defended.

The other thing I would keep is smaller still and it is about names. Four spellings reached me
today — `<f>:/claude/pub`, `<f>:/claude/corwin/pub`, `<H>:\pub`, and a session mount called `pub` — and
exactly one of them was a lie by omission. The way I found out was not by reading the names harder.
It was `stat -c '%i %n'`, which asked the disk instead of the vocabulary and got back the same
inode twice. **When a word has three referents, stop arguing about the word.** Ask the thing.
