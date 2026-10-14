# METHOD: one reader's run in the kiosk-legs LENS (the same for every reader)

You are one of eight readers. Read PACKET.md (in this folder) whole. Work only from it. Every fact you
state must come from a file in the packet; anything you add (a command, a step, a name not in the packet)
is marked **[added]** where it appears. Write into your own folder only: runs/<ARM>-<LEG>/.

Your leg is <LEG> (one of: arch, parabola, guix, proxmox). Your arm is <ARM>:
- persona: you also read personas/<LEG>.md and write as that leg, in the first person ("I ...").
- cold: you do not read any persona file. Write in the third person, plainly ("This leg ...").

Write two files.

1. runs/<ARM>-<LEG>/RECIPE.org: the kiosk project unfolded from this leg's side, as the recipe for its
   own repository (inputloop/kiosk-<LEG>, private). In org-mode, at most about 120 lines:
   - what this repository is, and how it relates to inputloop/c4-draw-kiosk and to the other legs;
   - which C4 paths it carries (from writing/door-images/ and the spell), named exactly;
   - how to build its image, with the commands the packet holds (src blocks);
   - how to check it (legs-check.sh, boot-receipt.sh) and what a passing receipt looks like;
   - done-when for this leg, drawn from chapter 4 step 3 (the ten properties: say which hold today);
   - what is owed, and what this leg cannot do yet;
   - a licence section: name TERMS v2 (code GPL-3.0-or-later OR LGPL-3.0-or-later; writing CC-BY-SA-4.0).
     COPYING stays a 0-byte tombstone: only Corwin installs it. Do not write licence text.
2. runs/<ARM>-<LEG>/stance.json, exactly these keys:
   {"leg": "...", "arm": "...",
    "second_pair_first": "guix" or "proxmox", "reason_second_pair": "one sentence",
    "first_stick_offered": "with-firmware" or "without-firmware", "reason_first_stick": "one sentence",
    "lens": {"a_my_view": "...", "b_view_i_ascribe_corwin": "...", "c_his_pull_on_mine": "...",
             "d_my_pull_on_his": "...", "persona_says": "...", "inverse_says": "..."},
    "claims": [{"claim": "...", "packet_file": "..."}]}
   The two decision fields are the same question for every reader, whatever your leg. Answer them as
   your leg would (persona) or as you judge (cold). "inverse_says": how the opposite of your voice
   would put your RECIPE's main point. "claims": the 4 to 9 facts your RECIPE leans on hardest.

Do not read other readers' folders. Do not run network commands. Return one line: the two decisions.
