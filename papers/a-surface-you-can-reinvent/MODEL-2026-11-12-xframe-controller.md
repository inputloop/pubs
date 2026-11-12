produced-by: monocle-stack + lens · subject: q/2026-11-12-xframe-controller/PROMPT-2026-11-12-0951-xframe-controller.md · sha256 51f223aa… · 2026-11-12

# MODEL 2026-11-12: the xframe controller, the firmaments, and four models of the surface's UI

*Corwin's 09:51 message and drawing (verbatim beside the stack: `q/2026-11-12-xframe-controller/`), ground by
the monocle (`STACK-monocle.md`: 26 questions, two layers, every quote found, no gaps). OBSERVED carries its source;
JUDGED says whose it is. Mentat (for Corwin, claude-opus-5-5).*

## 0 · The controller, as drawn

OBSERVED (his drawing, `c4-xframe-controller.svg`, after carlosmtnz's CC0 gamepad): a left grip with a d-pad and a
shoulder trigger; a middle screen (teal, crossed, carrying an Emacs mode line `*chamber* c4:* 245° -30 + * ( … )` with
indicator emoji); a right grip with a shoulder trigger and four face buttons (yellow up, blue left, red right, green
down) where the default d-pad would sit.

OBSERVED (his words): the right side **steers the cart** that carries the camera and its crew; the left **points the
camera or bosses the crew**; the middle is the **xframe**, "usually an Emacs Frame when we have enough room to draw it",
collapsing to "a group of touch buttons" when there are not pixels enough. Indicators on its mode line are tappable;
each gives the xframe over to its signal group. When the controller is too small for that, the whole controller may
change shape ("a phone in landscape") to keep the context's actions reachable; in the extreme, while an action in
progress binds both lanes and its subject is not drawn, it may come into the foreground and grow until the action is
done or cancelled. That is not a default.

JUDGED (mine, from the 00:57 two-halves note and this): the 00:57 halves and today's roles agree. The right half owns
the X panel's acceptance and is the swappable one; it is also the cart. The left is the superior half that accepts or
declines state; it aims and commands. So the right pad's default is **travel**, not scene actions: on the widest lens
(the chamber's whole viewport) up/down/left/right move the cart; scene and detail actions arrive on the right pad only
when the target narrows the lens (a display segment under the pointer). The 2026-11-12 01:00 build put Select Scene on
the right pad's up by default; this model says that was early. Falsifier: he says the scene chord should stay reachable
from the right pad on the wide lens.

**FIRM**, in his words, is the OS's wrapping (the browser's window); raising the firmaments turns the surface toward
draw's classic flavour. Not one switch: "by steps and degrees". JUDGED (mine): firmament levels, each step raising one
kind of familiar frame, in an order a stranger meets them:

| level | raised | what a newcomer recognises |
|---|---|---|
| 0 · open | nothing: the chamber, floating segments, the controller | a game, a planetarium |
| 1 · trim | each floating segment gets a title bar and close box; the mode line docks to the bottom | windows |
| 2 · status | a status line and an echo area along the bottom edge; the controller docks as a tool palette | an editor |
| 3 · menus | a menu bar along the top: every action by name, the radial menu's contents as menus | any desktop application |
| 4 · classic | a ribbon or tool bar, docked readers left and right; walls drawn flat as tabs | an office suite, an IDE |

Each step only moves or wraps pieces of the same document, as draw's board does with one DOM and two looks
(`projects/draw/design/DESIGN-2026-11-03-board.md`: "A look only moves the pieces, so a feature added to one is there in
the other"). Moving between scenes with the firmaments raised is a cut (a teleport), and the chamber's view is drawn as
a staged window: no reflections, no pins on the six surfaces (his 23:35 answer 3).

## (a) The models of our own ideation

| model | what it says | where it was said |
|---|---|---|
| **The chamber** | You stand inside a cube; its six inner walls are display surfaces; four sense walls by default | lens-composer memory, 2026-11-10; surface README |
| **The four boxes** | Concentric boxes step out from the centre: chamber units near the middle, screens between, pixels near a wall; the unit of measure follows where you stand | 2026-11-11 (graph paper) |
| **The lens ladder** | LENS (one person can hold it), MICROSCOPE, BUBBLE CHAMBER; and on the surface the lens controller's four modes: Chamber, Chrome, Hide, Firm | lens skill; MODEL-2026-11-10-frames-of-reference |
| **Display segments** | Giant, scalable wall-mounted displays arranged as segmented TV walls; "frame" keeps its Emacs meaning | his 23:35 answer 2 |
| **HIC2 grains** | BUTTON, X panel, Y panel, GADGET: four faces on one sparse action space | his 16:31 message |
| **The radial menu** | Rings by scope, sectors by grain, stable slots; a magnifier at the hub; clicks that miss pass through | MODEL-2026-11-11-hic2-radial; 23:35 |
| **The controller** | Two halves and the xframe; left aims and commands (RESET trigger), right travels and is swappable (HOLD trigger); the X panel shows only a plan both halves affirmed | 00:57; 09:51 |
| **Firmaments** | The way back to familiar frames, by degrees | 23:35 answer 3; 09:51 |
| **The Documentation Layer** | The floating controls in their reset state, castable onto surfaces | lens-composer memory, 2026-11-10 |
| **FORT and CAVE** | The transition's flavour: panels pack to the walls, or rise from the borders | 16:31 |

## (b) The industry concepts they meet

| ours | the convention it meets | what the convention teaches us |
|---|---|---|
| the controller's halves | the gamepad (left stick and d-pad for movement, face buttons for actions, shoulders for modifiers) | his roles invert the gaming default (left moves in most games); say so, offer the swap |
| the cart and the camera | the film dolly and the camera operator; the 3-D editor's orbit/pan/dolly | travel and aim are separate jobs with separate hands |
| the radial menu | pie menus (Callahan, Hopkins, Weiser, Shneiderman, 1988) and marking menus (Kurtenbach, Buxton, 1993) | stable angles make muscle memory |
| the xframe | the Emacs frame, window, mode line and echo area | a mode line is a row of live, clickable state |
| collapse to buttons, then reshape | responsive design's breakpoints; the phone's landscape keyboard | content decides the breakpoint, not the device |
| takeover until done | the modal dialog, and its critique (modes trap) | modal only while the subject is invisible, with cancel always on |
| firmaments by degree | progressive disclosure; the ribbon's minimised and full states; "classic mode" toggles | many small steps beat one switch for people learning |
| display segments | video walls, broadcast multiviewers, tiling window managers | a wall reads at a distance only if each tile is sparse |
| HOLD and RESET | the transport's pause; undo to last checkpoint | the two buttons a nervous user needs most |
| the action space | command palettes (M-x, Ctrl+Shift+P) | every action has a name and a key |

## (c) The journeys, against our principles

| journey | what they need | principle it tests | opening |
|---|---|---|---|
| **The first look**: someone opens the surface cold | four choices, one obvious next step, a trigger that always undoes | universalism (no one shut out for being new) | start at firmament level 2, offer "take the frames down" as the invitation, not the default |
| **Practise and record** (his EmacsConf talk) | cue cards, takes, HOLD, scene swaps, nothing strange on camera | four freedoms (his own OBS, his own files) | the controller as a stage-manager's desk; the xframe shows the take state |
| **Compose your own**: a user building their own surface | the LENS accordion as a builder; draw on a panel; recipes as text | freedom to study and change | the builder lives in the classic view, where forms are familiar |
| **The classic worker**: an office or IDE habit | menus, ribbon, docked panels, status line | community (meet people where they are) | firmament level 4 is a complete product, not a fallback |
| **The power user** (Emacs especially) | every action named and keyed; recipes they can read | software freedom | M-x over the action space; the radial as a view of it |
| **Constrained hardware**: a phone, one hand, two triggers | the floor: two triggers and a pointer | universalism | the controller reshapes; nothing needs start, menu or back |
| **The watched user**: streaming or recording | what a viewer sees; what is kept | consent and honesty | an on-air indicator in the xframe; passwords never on screen |

## (d) The openings as contrasts

Accessibility second only to unlocking: every opening is said as the pair it unlocks, so neither end is the lesser
product.

1. **Fancy and classic** are two ends of one dial, and each end is complete. Hygiene: classic must not hide a
   capability the fancy end has; appearance: a colleague glancing at the screen sees an application, not a toy.
2. **Large and small** controllers carry the same actions: frame, then buttons, then a reshaped controller, then
   foreground. Hygiene: a takeover always shows its cancel; appearance: the reshaped controller looks like a phone
   held sideways, something people know.
3. **Pad and keys**: every pad action has a key and a name. Hygiene: no action is pointer-only; appearance: on a
   recording, key presses show in the xframe's echo area, so viewers learn the moves.
4. **Travel and aim**: right moves the cart, left aims and commands, and the two can be swapped for people whose hands
   or habits want the gaming default. Hygiene: a swap is a recipe line, said in words; appearance: a cart that moves
   smoothly reads well on video.
5. **Hold and reset**: the two triggers a nervous user needs. Hygiene: reset never discards a pin; appearance: a held
   frame says HOLD on screen, so a viewer does not think the stream froze.
6. **On-air and off-air**: the surface knows when it is being recorded. Hygiene: secrets (passwords, keys) are never
   drawn while a take runs; appearance: the take indicator is part of the xframe's mode line.

Copyright 2026 INPUTLOOP (Bryant Frankford and Corwin Brust); CC-BY-SA-4.0. Mentat (for Corwin, claude-opus-5-5).
