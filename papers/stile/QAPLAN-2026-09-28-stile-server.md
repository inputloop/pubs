# QA PLAN — stile-server

AS-OF 2026-09-28. Written before the build. Every item names the check that settles it.

Q1  `sh stile-test.sh` passes every case, each case naming the contract rule (S1–S17) it tests,
    on two Emacs versions (29 and 30).                                            [stile-test.sh]
Q2  `sh stile-test.sh --prove-red` shows every case can fail: each planted fault (a broken server
    variant or a tampered fixture) turns its case RED, and the controls stay green.
                                                                                  [stile-test.sh]
Q3  The test is not written in the language under test: POSIX sh and awk, from DESIGN §3, not
    from the server's code.                                                       [by inspection]
Q4  A real carry: a file larger than one commit (> 20 MB) split in the workspace, its parts landed
    on his disk in batches of five, assembled by the server on his side, whole hash matching.
    RED-pending, named, if no Emacs runs on his side.                             [the landing]
Q5  No network, no delete: `grep` for network and delete primitives in the server reads empty.
                                                                                  [grep]
Q6  It byte-compiles without warnings on both Emacs versions.                     [emacs -batch -f batch-byte-compile]
Q7  Hand read: every function's comment says in plain words what it does and which rule it serves.
                                                                                  [by hand]
