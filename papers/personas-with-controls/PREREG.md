# PREREG: the kiosk-legs LENS at GREAT (9), written before any run (2026-10-14)

Subject: PACKET.md (sha256 in PACKET.sha256). Every reader gets the same packet and the same METHOD.md.

Seats (9, the house GREAT):
- 4 persona readers, one per leg (Arch, Parabola, Guix, Proxmox), each wearing that leg's persona sheet.
- 4 cold readers, one per leg, the same packet and method, no persona: the controls.
- 1 blind judge, after: sees the eight shared-question answers shuffled and unlabeled, splits them in two.

Decision fields (asked of all eight, the same question each time):
- `second_pair_first`: guix | proxmox. Which leg of pair two should be built first.
- `first_stick_offered`: with-firmware | without-firmware. Which Arch stick a tester is handed first.

Reading rule (from the lens skill's doubled-nine mode):
- The persona changed a decision only if cross-arm pairs disagree on a decision field more often than
  same-arm pairs. Otherwise the persona cited reasons and did not move the decision.
- The judge "found the arms" only if its split matches persona/cold on at least 7 of 8 (chance is about 1 in 9
  for 8-or-better of 8 by permutation); a judge that splits by leg instead is a finding about the legs, not the arms.

What would show the experiment wrong-headed: every reader, cold or persona, writes the same RECIPE skeleton
(then the legs do not need personas); or a persona RECIPE claims a fact the packet does not hold.
