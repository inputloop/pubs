#!/usr/bin/awk -f
# EXPERIMENT 2026-09-27 -- the compose toy, solved exactly (no sampling).
# Companion to h/EXPERIMENT-2026-08-30-compose.py and h/LENS-2026-09-27-edrx-deeper-round.md (fork B3).
# Written in awk on purpose: a second language, separate from the Python it checks.
#
# HYPOTHESIS (written before running): the toy's rates are fixed by its chosen parameters.
#   P(motives agree at B)  = 1/k            (k motives, drawn independently and uniformly)
#   P(reach survives)      = 1 - e/r^2      (r reach-sets, e ordered pairs with an empty overlap)
#   P(governance composes) = (1/k) * (1 - e/r^2)
# If the Python's seeded run (3491/20000 = 0.175) sits far from this, the hypothesis is wrong.
#
# Run: awk -f h/EXPERIMENT-2026-09-27-compose-closed-form.awk      (POSIX awk; no input)
function overlap(a, b,    i, n, x, y, j, m, ok) {
  n = split(a, x, ","); m = split(b, y, ",")
  for (i = 1; i <= n; i++) for (j = 1; j <= m; j++) if (x[i] == y[j]) return 1
  return 0
}
BEGIN {
  # the four reach-sets exactly as h/EXPERIMENT-2026-08-30-compose.py line 46 has them
  R[1] = "r1,r2"; R[2] = "r2,r3"; R[3] = "r1,r2,r3"; R[4] = "r3,r4"; r = 4
  e = 0
  for (i = 1; i <= r; i++) for (j = 1; j <= r; j++) if (!overlap(R[i], R[j])) e++
  survive = 1 - e / (r * r)
  printf "reach pairs with no overlap: %d of %d  -> P(reach survives) = %.4f\n", e, r * r, survive
  # k = 5 is the toy's own motive count (line 45). 4, 9, 17 are the house set: CHOSEN stand-ins, not measurements.
  split("5 4 9 17", K, " ")
  for (t = 1; t <= 4; t++) {
    k = K[t]
    printf "k=%-2d motives  P(agree)=%.4f  P(compose)=%.4f  expected in N=20000: %.0f%s\n", \
      k, 1 / k, survive / k, 20000 * survive / k, (k == 5 ? "   <- the toy as run" : "   (house number, chosen)")
  }
  # sampling check against the recorded run: binomial standard deviation at k=5
  p = survive / 5; sd = sqrt(20000 * p * (1 - p))
  printf "recorded run: 3491 composed; exact expectation %.0f; |diff| = %.1f = %.2f standard deviations\n", \
    20000 * p, (3491 > 20000 * p ? 3491 - 20000 * p : 20000 * p - 3491), \
    (3491 > 20000 * p ? 3491 - 20000 * p : 20000 * p - 3491) / sd
  print "identity gov = agree - reach_tears holds for every draw: gov_compose() tests motive first, then reach (Python lines 37-41)."
}
