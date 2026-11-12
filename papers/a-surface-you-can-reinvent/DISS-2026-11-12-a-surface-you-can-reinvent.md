> **Provenance.** Produced by Mentat (for Corwin, claude-opus-5-5) from Corwin Brust's direction of 2026-11-10
> to 2026-11-12, the surface's working code and checks, and draw's design notes. Canonical copy: the lab's
> `writing/surface-ui/` (this file). Pulled 2026-11-12. His words are quoted verbatim where quoted. Reviewed by
> the editorial council: see `REVIEW-2026-11-12-editorial-council.md` beside it before citing a section it flags.
> Edition 0.4: revised after the editorial council's two rounds and after building it (what changed, who asked, and
> what the build taught are listed at the end).

# DISS 2026-11-12 · A surface you can reinvent: the C4 surface, its controller, and the way back to the familiar

## Preface: How to Read This

This is an argument for a kind of interface, written so that someone who has never seen ours could build it
again. Imagine a model, or a person, with this paper and nothing else: no repository, no screenshots, no network.
If, at the end, they can sit down and make a surface that does what ours does and wants what ours wants, the paper
has done its job.

It is written in two registers, and each section says which it is in:

- **Practitioner** sections say what to build: shapes, numbers, defaults, the order of the work, and the check that
  shows each piece works. A builder can follow them without the rest.
- **Analytic** sections say why: the conventions it meets, the principles it answers to, the journeys it serves,
  and the places where we are guessing.

Whose argument this is: it is written by the makers of the thing it argues for (inputloop, and the agent that
works for its keeper). Weigh it that way. Every claim a builder needs has a check beside it, so the parts that matter
can be verified without trusting us.

The argument, in one paragraph: most interfaces make you choose between a familiar one that is easy to start and
hard to make your own, and a strange one that is powerful and hard to start. We think that choice is false. One
document, drawn two ways, can be both: a chamber you stand inside, with displays on its walls and a two-handed
controller, that can raise familiar frames around itself one step at a time until it is a classic application with
menus and a status line. Nothing is lost on the way up or down, because each step only moves or wraps the same
pieces. Whoever uses it chooses how strange it is, and can learn to make it their own starting from the plainest
view.

## 1 · Whose this is, and what it serves (analytic)

The surface belongs to inputloop, a small free-software shop kept by Corwin Brust and Bryant Frankford, with
K Smith (Brigidt) as editor. Its direction here is Corwin's. Two pieces of other people's work sit inside it and
show what "sits on inputloop" means:

- **draw**, the drawing tool that a panel on the surface can hold, grew from **TopoForge**, Bryant's
  network-topology designer. Bryant's paint (brush presets, pressure curve, stabiliser) is still its ink. draw's
  board already has the idea this paper generalises: *one document, two looks* (a free look of small floating,
  Emacs-like frames, and a classic look with the same pieces docked as a menu bar, ribbon and status line).
- **NextTime-Dev**, Brigidt's timebank application, is the example of a *receiving container*: a place things can be
  cast into (a task, an offer of time) that knows what to do with them. On the surface such containers are walls or
  panels that accept a dropped item and act on it, with consent asked and, if the user likes, remembered.

The surface answers to an order of principles that the shop decides by: everyone first (universalism and
egalitarianism), then the four freedoms of free software (to run, study, change and share), then the free-software
movement, then the wider technical and scientific community. Two working rules come from that order and run through
every section: **ship tensions as features** (where two ways both work, offer both, with a sensible default), and
**accessibility second only to unlocking** (make the powerful thing reachable first, then make it reachable by
everyone, never by removing the powerful thing).

## 2 · The chamber (practitioner)

Build a room the user stands inside.

1. **A cube, seen from inside.** Six faces, each a display surface with its own frame: an inward normal `n`, a
   right-pointing `u` and an up-pointing `v`, all unit length and square to each other, chosen so text drawn on any
   wall reads unmirrored from inside. Check: for every face, `u·u = v·v = 1`, `u·v = u·n = v·n = 0`, and from a camera
   facing that wall `u` is the viewer's right.
2. **Four sense walls by default**: the four walls around the viewer each show the same data laid out by a different
   sense (for example by group, by kind, by link, by use). Ceiling and floor start plain.
3. **The camera** has a position, a yaw and a pitch. A plain drag turns the view in place. A modifier-drag (Alt)
   *swings* the camera round the point ahead, so the thing you are looking at stays put and you move around it.
   Double-click a wall to fly to it. A flight eases over about two-thirds of a second.
4. **Four concentric boxes** step out from the centre to the camera's reach, which stops short of the walls, so
   stepping back always stops inside the room. The box you stand in sets the unit of measure: chamber units in the
   middle, screen widths in the middle steps, pixels in the outermost. A light graph-paper grid on the wall ahead
   shows that unit and labels it ("25 cu", "1/4 screen", "4 px"). Check: from the centre facing away, the grid reads
   chamber units; turned to the near wall, pixels.
5. **Atoms in the middle**: the data's items float in the chamber's middle and settle toward their places, so a
   change of layout is seen as movement, not a jump.

Why this shape: a room gives every display a place you can turn to, and a sense of near and far that a flat window
has to fake. The four boxes make "how close am I" into a unit of measure the user can read.

## 3 · Display segments (practitioner)

Everything the user reads or presses lives on a **display segment**: a panel that floats in front of the view, or
is mounted on a wall. Corwin's metaphor is "attaching giant (but scalable!) wall mount displays and arranging the
control surface with segmented TV walls".

1. **Floating or mounted.** A floating segment is positioned in screen space. A mounted one is pinned to a wall at
   wall coordinates `(a, b)` and drawn with a homography (the 3×3 projective map that carries the segment's four
   corners onto the wall's four projected points; as CSS, `matrix3d`). Check: the map lands every corner on its
   target within a millionth of a pixel.
2. **What a mounted segment rides with** (a small d-pad on the segment): the wall itself, the camera (it slides along
   its wall to stay where you look), or the lens (it stays beside the lens's strongest item on that wall). And its
   timing: in step, or chasing after with a delay each press lengthens. Check: the chase is an exponential approach
   whose gap falls to 1/e after `lag` seconds.
3. **Glanceable at a distance**: a segment in a box farther out than the camera's own box (section 2, step 4) shows
   only its title and one live value; in the camera's box or nearer, its controls.
   Its border and title fade when nothing is hovering or working it (Corwin, 2026-11-11: "quite a lot of
   bordering/titling feels extra, at least when not hovering").
4. **Scale by the corner.** Every segment can be scaled by dragging a corner; a group of buttons scales together.
5. **The word "frame"** keeps its Emacs meaning (a window-level container with a mode line). Our moving parts are
   *segments* or *panels*, never frames.

**OBS on a wall** is the first real job a segment does. A segment can show a live source from OBS Studio by its
websocket (screenshots of a source, about three a second) or by RTSP through a local helper (the stream itself).
Connecting is one press when the surface is served from the same computer: the helper reads OBS's own websocket
settings file (address, whether a password is asked, the password) only on that press, only for a same-origin
request carrying the press's own header, and never stores or logs it. From another device, paste the `obsws://`
link or read OBS's QR code. Check: any route other than the headered same-origin press returns no password.

## 4 · The lens controller and Firm (practitioner)

A **lens** decides what the user sees strongly. Four modes, one per direction of a pad:

| direction | mode | what it does |
|---|---|---|
| up | **Chamber** | what is bound to the chamber shows; the rest dims |
| down | **Chrome** | each control shows by how firmly it is pinned (mounted on a wall strongest, floating faint) |
| right | **Hide** | controls are hidden until the pointer comes near, a key is held, or an event touches them |
| left | **Firm** | the view (camera and walls) is pinned as one canonical state with its SHA-256; the surface says when you have drifted from it, and returns you to it |

Pressing the mode you are in, or the centre, returns to none. The Firm fingerprint is the canonical string of the
state (keys sorted, numbers rounded), hashed, so the same view always gives the same hash: it is what a signature
would cover. Check: Hide leaves only the controller visible; Firm reads *held*, then *drifted* after a turn, then
*held* after return.

## 5 · The controller (practitioner)

The controller is a virtual game controller drawn on the surface: **two halves and the xframe between them**. It is
"our fancy three element two channel -so far- virtual HUI device" (Corwin, 2026-11-12). Build it as one panel type.

**The roles.** Think of a film crew on a dolly.

| part | job | default control | trigger (index finger) |
|---|---|---|---|
| **left half** (the superior one) | points the camera or bosses the crew; accepts or declines state after modules change | a d-pad, carrying the four lens modes | **RESET**: back to the last good frame of reference (the Firm pin if there is one, else home); unpinned parts of the UI go back |
| **right half** (hot-swappable) | steers the cart that carries the camera and crew; owns accepting what the xframe shows | a d-pad by default; may be swapped for a button cluster or another control | **HOLD**: stop what moves (the camera's flight, the middle settling, segments chasing, a video's picture as a freeze-frame); with nothing moving, the place's own stop, or say there is none |
| **xframe** (the middle) | shows the controller's state and whatever the halves are acting on | an Emacs-style frame: a buffer and a mode line | none |

The defaults for the two triggers live in one place in the code, as one line, so that changing HOLD back to
"simplify" (Corwin may reverse course) is one word.

**The right pad is context-sensitive.** On the widest lens (the chamber's whole view), the right pad steers the
cart: up and down dolly in and out, left and right truck sideways. When the target narrows the lens (a display
segment under the pointer: OBS, a card, a wall's list), the right pad's directions become that target's actions.
With no pointer (a gamepad alone), the target is whatever lies under the centre of view, where the surface draws a
small reticle. Check: with the pointer outside the surface, the right pad's actions are those of the segment under
the centre.
For an OBS segment: up is Select Scene. (Built first for OBS segments only; a card, a wall's list and a draw board narrowing the pad are the next step, each a target with its own four directions.) A chord then carries a two-step action across the halves: the right pad
picks, the left trigger takes the tool, and from then the right trigger fires it. The xframe says it in the words
every crew knows: "standby: scene Demo", then "go". (HOLD and RESET are theatre's words too: hold stops the show
where it is; reset puts every prop back where the show starts.) For scenes, each right-trigger
press swaps between the current scene and the last one used, so a few presses move back and forth.

**The assembly handshake.** When a controller assembly is defined or swapped (a new right control, say), each half
must affirm it. The right half offers its control set, filled with the centre's and its own parts. The left half
affirms that same plan and sends it back. The xframe shows a plan only when both halves hold it; any change asks
both again. Once linked, each press carries a sequence number and is written to both halves, so either half can be read to
find the other's state. Check: one half alone cannot change what the xframe shows; and after any run of presses,
the two halves hold the same last sequence number.

**The xframe at every size.** This is where the controller earns its keep.

The sizes below are derived, not chosen; each says from what.

1. **Large** (the xframe at least 320 by 100 CSS pixels): an Emacs frame. A buffer shows the current target's details. The mode line is a row of live, clickable
   segments: the buffer name, where the camera points (`245° -30`), modified and lock flags, and a parenthesised run
   of **indicators**, each a small icon for one signal group (OBS, recording, scenes, the chamber's motion, tools,
   alerts). Tapping an indicator gives the whole xframe to that group's instruments and controls. The echo area
   below it says what each press did.
   The 320 comes from the mode line: about 48 characters (buffer name, heading, pitch, flags and a run of
   indicators) at a monospace advance of about 6.6 pixels at 11-pixel type. The 100 is four lines of buffer (the
   house's default count, 4, said here as the number it is) at 15 pixels, plus the mode line and the echo area.
2. **Small** (narrower than 320 but at least 176 CSS pixels): the xframe collapses to a group of touch buttons, one
   per indicator, four to a row, mounted where the frame sat. The 176 is four buttons of 44 pixels, the target size
   WCAG 2.1 asks for at its highest level (success criterion 2.5.5).
   The whole controller needs room for its halves too: each half holds a 3-by-3 pad whose labels read best on two
   lines (the arrow above the word) at 10-pixel type, which needs about 150 pixels a half. So a controller shows its
   frame from about 644 pixels wide (two halves, a 24-pixel gap, 320 for the xframe); the built default is 680.
3. **Smaller than 176, or a tapped group that needs room**: the whole controller changes shape, for example to a phone
   held landscape, repainting its buttons so the context's actions stay reachable.
4. **The extreme**: while an action in progress binds both lanes, and the action's subject is not drawn anywhere the
   user can see, the controller may come forward and grow until the action is done or cancelled. Cancel is always
   on it. This is never a default way to fit the screen.

**Gamepads.** A real game controller maps to the same: bumpers and triggers to the two triggers, its d-pad to the
left half, its face buttons to the right. Keys do too: one key per trigger (we use Q and E), Shift with the arrows
for the left pad. Nothing ever needs a start, menu or back button: two triggers and a pointer are the floor.

## 6 · The radial menu and the action space (practitioner)

Every action the surface can do is a named command with a key. Lay all actions against all targets and most cells
are empty. That emptiness is the design: the **radial menu** shows only the cells that apply here, and keeps an
empty slot where an absent action would sit, so nothing shifts under the hand when the target changes.

- **Rings by scope**, inner to outer: the thing under the pointer, the selection, the selection's group (with how
  much of it is selected, "3 of 7"), the groups within a lens, the lens itself (in effect or proposed, said in
  words).
- **Sectors by grain**, at fixed angles: right BUTTON (do one thing now), up X panel (show more), down Y panel (place
  it on the grid), left GADGET (make a control from it). These match the left half's lens directions where they
  rhyme: left is Firm and GADGET ("make it hold"); up is Chamber and X ("show more").
- **Stable slots.** Use earns an item the inner half of its sector, re-ordered only when a menu is opened fresh, never
  while it is open. Pins hold wherever the user put them. A first-time user's menu shows only the four sector roots.
- **A magnifier at the hub** while the menu shows, and **targeting keeps working**: a click that misses the menu
  passes through to what the menu was drawn over. A radial pick can arm a two-step action, and the target then shows
  its armed state (a cue, a label) until the second click lands on it.
- **Each user's menu is a recipe**: a text file they can read and change, holding the defaults, their pins and the
  order their use has earned.

Why: pie menus (Callahan, Hopkins, Weiser and Shneiderman, 1988) and marking menus (Kurtenbach and Buxton, 1993)
showed that stable angles become muscle memory; a command palette (Emacs's `M-x`) shows that naming every action is
what makes a large space learnable.

## 7 · The firmaments: the way back to the familiar (practitioner, then analytic)

Corwin, 2026-11-12: "In talking of FIRM vs not we are talking about the overall wrapping from the OS (e.g. a 'window'
belonging to Google Chrome or some other web-browser as far as the OS is concerned). When we add firmaments we are
effectively turning surface into the 'classic' UI flavor that `draw` has." And: the surface "is visually unlikely
anything" most people have used for development, art, calls, video, operations or games, "much less to combine them".

So the surface carries a **firmament dial**, with steps a stranger meets in this order:

| level | raised | a newcomer recognises |
|---|---|---|
| 0 · open | nothing: the chamber, floating segments, the controller | a game, a planetarium |
| 1 · trim | each segment gets a title bar and close box; the xframe's mode line docks to the bottom edge | windows |
| 2 · status | a status line and an echo area along the bottom; the controller docks as a tool palette | an editor |
| 3 · menus | a menu bar along the top, every action by name, the radial menu's contents as menus | a desktop application |
| 4 · classic | a ribbon or tool bar, docked readers left and right; the walls drawn flat as tabs | an office suite, an IDE |

**Rules for the dial.**

1. Each step only moves or wraps pieces of the same document. A feature added at one level is there at every level.
   A raised frame never sits on top of a segment: when the menu bar and the ribbon take the top of the window, the
   segments there move below them, and go back to where they were when the frames come down.
2. A step up never hides a capability the step below had: at level 4 the chamber is still reachable, as a tab.
3. With the firmaments raised, moving between scenes is a cut (a teleport), and the chamber is drawn as a staged
   window into a "magical" other place: no reflections, nothing pinned to the six surfaces drawn.
4. The controls inside the firmaments stay context-sensitive (accordions, tool bars and their groups, menus), and
   follow the user's pinned and learned preferences.
5. The dial is per user and remembered; a project can suggest a starting level.

Why degrees and not a switch (analytic): draw's board already has a two-state switch, free and classic. That works
for a person who knows both. For a person learning, a switch is a cliff: one press and everything moves. Degrees let
a person take down one familiar frame at a time and see what it was doing for them. This is progressive disclosure
run in reverse: the familiar view is complete, and the strange one is unlocked a step at a time, rather than the
strange view being complete and the familiar one bolted on.

## 8 · draw on a panel, and the LENS accordion as a builder (practitioner)

**draw on a panel.** A display segment can hold draw: a board where a person reads one document and takes notes
beside it, typing cards into lanes, inking anywhere (ink is stored as vectors, so the board stays text), framing ink
and cards to lift them into one note, and dropping tag chips on cards or on the backdrop (a chip on the backdrop
makes a *ground* whose cards carry the tag). On the surface, draw keeps its own two looks: its free look fits a
firmament level of 0 or 1; its classic look fits 3 and 4. Its mode line and echo area are Emacs's: every element of
the mode line is a button, and questions are asked in the echo area with a default, never in a modal.

**The LENS accordion.** A LENS, in this shop, is a short structured reflection: hold four views apart (yours, the
one you ascribe to the other party, their pull on yours, yours on theirs), pass a persona and its inverse, restate
each point from principles, and write it down. On the surface, lenses are also *templates for how to see*: which
walls show which senses, which segments are mounted where, which lens mode is on, which firmament level, which
controller assembly. The builder for these templates is an **accordion** in the classic view (level 3 or 4):

1. **One section per template**, folded to a single line (its name and a one-line preview) until opened.
2. **Opened, a section is a small draw board**: lanes for the template's parts (walls, segments, controller,
   firmaments), cards for each choice, chips for tags (who it is for, which job). Dragging a card between lanes moves
   a segment between walls.
3. **Preview, then commit**: a section's preview button applies the template as *proposed* (the radial menu's lens
   ring says PROPOSED in words); a commit button makes it *in effect*. Prime and fire, again.
4. **The template is text**: an exported template is a recipe file a person can read, change and share, and the
   accordion reads it back unchanged. A shared template carries the shop's default terms (CC-BY-SA-4.0 for its
   words, GPL-3.0-or-later for any code in it) unless its maker chooses others, so whoever receives it may change it. On export, the accordion lists every name
   the template carries (a person's camera, a colleague's host, a friend's stream) and asks which to keep, defaulting
   to none. Check: export, import, export gives the same bytes.
5. **Start uncluttered.** A new user's accordion holds the five stereotypes of section 9 (Stage, Desk, Studio,
   Console, Plain) and an empty one to start from; a power user's holds everything they have made.

Why the classic view for the builder: building is the moment a person most needs familiar forms (lists, folds,
buttons that say what they do). The chamber is where templates are used; the accordion is where they are made.

## 9 · Control-panel stereotypes, placed by likelihood (practitioner)

A stereotype is a starting arrangement of segments and controller for a kind of work. Place each control by how
likely it is to be reached in that work: the likeliest under the thumbs (the controller's pads), the next on the
segment nearest the centre of view, the rest in the radial menu and, at higher firmament levels, the menus. Fitts's
law is the reason: time to reach grows with distance and shrinks with size, so the frequent things get near and big.

| stereotype | for | under the thumbs | on the nearest segment | firmament to start |
|---|---|---|---|---|
| **Stage** | recording or streaming a talk | cue cards (turn), take (start/stop), HOLD, scene swap | cue cards as a teleprompter; the program view | 1 |
| **Desk** | reading and deciding (reviews, triage) | next/previous item, keep/redo, open | the item, with its source beside it | 3 |
| **Studio** | drawing, painting, laying out | tool, brush size, undo (RESET), HOLD the canvas | draw's board | 2 |
| **Console** | operations: hosts, logs, shells | next alert, acknowledge, open a shell | the alerts list; a terminal segment | 3 |
| **Plain** | a first visit | the four sector roots; RESET | a short "what you can do here" segment | 2 |

Each stereotype is a LENS template (section 8), so a user can open its section, see why each control is where it is,
and move it.

## 10 · The journeys, against the principles (analytic)

| journey | what they need | the principle it tests | the opening |
|---|---|---|---|
| **The first look** | four choices, one obvious next step, a trigger that always undoes | everyone first | start at firmament 2; offer "take the frames down" as an invitation |
| **Practise and record** | cue cards, takes, HOLD, scene swaps, nothing strange on camera | the four freedoms (his own OBS, his own files) | the Stage stereotype; the xframe shows the take state |
| **Compose your own** | templates they can read and change | freedom to study and change | the LENS accordion in the classic view |
| **The classic worker** | menus, ribbon, docked panels, a status line | meeting people where they are | firmament 4 as a complete product, not a fallback |
| **The power user** | every action named and keyed; recipes as text | software freedom | `M-x` over the action space; the radial as a view of it |
| **Constrained hardware** | two triggers and a pointer, one hand, a phone | everyone first | the controller reshapes; nothing needs start, menu or back |
| **The watched user** | to know what a viewer sees and what is kept | consent and honesty | an on-air indicator in the xframe; secrets never drawn during a take |

## 11 · The openings, said as contrasts (analytic)

Each opening is a pair, so that neither end is the lesser product. Beside each is the preparation we owe: technical
hygiene, and the social risk of how it looks.

1. **Fancy and classic** are two ends of one dial. *Hygiene*: classic never hides a capability. *Appearance*: a
   colleague glancing at the screen sees an application, not a toy.
2. **Large and small** controllers carry the same actions. *Hygiene*: a takeover always shows its cancel.
   *Appearance*: the reshaped controller looks like a phone held sideways, which people know.
3. **Pad and keys**: every pad action has a key and a name. *Hygiene*: nothing is pointer-only. *Appearance*: on a
   recording, presses show in the echo area, so viewers learn the moves.
4. **Travel and aim**: the right half moves, the left aims and commands; swappable for people whose hands or habits
   want the gaming default (most games put movement on the left). *Hygiene*: the swap is one line of the user's
   recipe, said in words. *Appearance*: smooth cart moves read well on video.
5. **Hold and reset**: the two triggers a nervous user needs most. *Hygiene*: reset never discards a pin.
   *Appearance*: a held picture says HOLD on screen, so a viewer does not think the stream froze.
6. **On air and off air**: the surface knows when it is recording. *Hygiene*: passwords and keys are never drawn
   during a take; and a take begins with **standby**: the frame shown to the presenter exactly as it will be
   recorded, with a three-second countdown (broadcast's "three, two, one"), so anyone in the room who did not choose to be
   recorded can be cleared from it first; a standby can be stood down (RESET) with nothing recorded. *Appearance*: a
   **tally** shows on the controller at every size (frame, buttons, phone shape): amber at standby and during the
   countdown, red only once the recorder confirms it is recording, dark again (with the reason in the echo area) if it
   never does, and a fourth state, **practice** (marked, never red), when there is no recorder at all and the take is
   only timed: so the presenter always knows what is true.

## 12 · How to build it, in order (practitioner)

The order matters because each step gives the next a place to be checked.

1. The chamber, the camera and the four boxes, with checks for the face frames, the ray-to-wall hit and the reach.
2. Display segments, floating and mounted, with the homography check.
3. The lens controller and Firm, with the canonical-string hash.
4. The controller: the two triggers and their defaults first (one line), then the handshake (both halves hold the
   same last sequence number), then the xframe at its largest size, then the collapse to buttons at 320 and the
   reshape at 176, then the takeover (a takeover without a visible cancel fails its check).
5. The action space as a registry: every action a name, a key, a sector and a scope. The radial menu reads it.
6. The firmament dial, level by level, with one check per level: nothing reachable at level n is unreachable at
   n+1.
7. draw on a panel; the LENS accordion; the five stereotypes as templates.
8. The Stage stereotype end to end: standby (the frame as it will be recorded), stand down, a three-second
   countdown, the tally at every size (amber, then red only on the recorder's confirmation), cue cards, takes with their marks, a cut from the kept takes, a caption draft.

Every check should be written in a different language from the code it checks, and should be shown able to fail:
plant the fault, and the check must catch it. A check that has never failed is not yet a check.

## 13 · Where we are guessing (analytic)

- **The right pad's default.** This paper says travel on the wide lens, actions on a narrowed one. The first build
  (2026-11-12, 01:00) put Select Scene on the right pad's up regardless. Falsifier: in practice, the scene chord is
  wanted from anywhere.
- **The firmament levels' order.** Trim, status, menus, classic is our guess at the order a stranger meets familiar
  frames. Falsifier: watching three newcomers raise the dial one step at a time, at least two reach for a different
  frame first.
- **HOLD against simplify** for the right trigger. Corwin: "I wonder if we will reverse course on hold vs simplify on
  that tigger." Kept as one line so it can flip.
- **What "visible" means for a takeover.** The build judges an action's subject visible when its segment is drawn in
  view (an OBS wall with a picture). For subjects that are not segments (a scene not on any wall, a file), visibility
  is harder to say. Falsifier: a takeover that appears while the subject is plainly on screen.
- **Gaming convention.** Most games move with the left hand. Our roles put travel on the right. The swap exists; the
  default may need to follow the hands of the people who use it most.

## Changes from 0.1 (the council's first round)

- Preface: whose argument this is, said before the argument (Vanth: "say so in the preface, in one sentence").
- Section 3: "far away" measured by the four boxes (Merlin).
- Section 5: the target with no pointer is the centre of view, with a reticle (Merlin: "A gamepad has no pointer").
- Section 5: standby and go; hold and reset named as theatre's words (the stage manager).
- Section 5: the handshake's check by sequence number, replacing "as if each half had its own processor" (Merlin).
- Section 5: the xframe's sizes as numbers with their derivations, 320 by 100 and 176 (Solberg-Maas: "a breakpoint
  that is an adjective").
- Section 8: a shared template's default terms (Vanth); five stereotypes in the new user's accordion, not four
  (Solberg-Maas: "A reader who counts will stop trusting the rest").
- Section 11, opening 6: standby with the frame as it will be recorded and a three-second countdown, for bystanders
  (Vanth); the tally at every size (the stage manager).
- Section 12: checks for the handshake, the breakpoints and the takeover's cancel (Merlin).

## Changes from 0.2 (the council's second round)

- Section 11, opening 6: the countdown says its source; stand down with RESET; the tally is amber, then red only
  on the recorder's confirmation (Solberg-Maas: "hold it everywhere"; the stage manager: "A tally that lies is worse
  than none").
- Section 8: on export, the names a template carries are listed and kept only by choice (Vanth).
- Section 5: a check for the reticle rule (Merlin).

## Changes from 0.3 (what the build taught)

- Section 5: the whole controller's width (two halves of about 150 for their two-line pad labels, so a frame from
  about 644; built at 680), learned when the first build's labels spilled into the xframe and then truncated.
- Section 7, rule 1: a raised frame never sits on a segment; segments move below the bars and come back, learned when
  the menu bar and ribbon first covered the segments along the top.
- Section 11, opening 6: the fourth tally state, practice, learned when a take with no recorder needed a state that was
  neither dark nor red.
- Section 5: the right pad narrows for OBS segments first; other targets named as the next step.
- Section 13: what "visible" means for a takeover, a guess with its falsifier.

*Edition 0.4: revised from 0.3 on 2026-11-12, after building it; spine: 2026-11-10.*

Copyright 2026 INPUTLOOP (Bryant Frankford and Corwin Brust; K Smith, editor); CC-BY-SA-4.0:
https://creativecommons.org/licenses/by-sa/4.0/. Mentat (for Corwin, claude-opus-5-5).
