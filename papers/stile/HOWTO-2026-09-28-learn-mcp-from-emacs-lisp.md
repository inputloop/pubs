# HOWTO 2026-09-28 — learn MCP by reading (and changing) an Emacs Lisp server

*For someone who knows some Emacs Lisp and has never seen the Model Context Protocol. You need
Emacs 29 (built with JSON support) or Emacs 30, and a shell. Nothing else: no packages, no
network, no running Emacs.*

## 1 Run it before you read it

Make a folder to play in, and ask the server who it is:

    mkdir -p ~/stile-play
    echo '{"jsonrpc":"2.0","id":1,"method":"server/discover","params":{}}' \
      | emacs --batch -Q -l c4-stile-mcp.el -f c4-stile-main ~/stile-play

You get one line back. That line is the whole idea of MCP: a program (the *client*, usually an
AI assistant's app) writes one JSON message per line to the server's standard input, and the
server writes one JSON message per line back. The line on your screen that starts `c4-stile:` is
not part of the conversation; it went to standard error, where diagnostics belong.

Now ask for its tools, the way a 2026 client would:

    echo '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{"_meta":{"io.modelcontextprotocol/protocolVersion":"2026-07-28"}}}' \
      | emacs --batch -Q -l c4-stile-mcp.el -f c4-stile-main ~/stile-play

## 2 Read it in this order

| part | what it teaches | the rule it keeps |
|---|---|---|
| 1 | the constants: which protocol versions, who the server says it is | S5 |
| 2 | the wire: one line out per message, flushed, nothing else on stdout | S1, S18 |
| 3 | the fence: every path is checked for where it *lands* | S11 |
| 4 | the work: hashing exactly the bytes on disk; joining carefully | S14–S16 |
| 5 | the menu a client sees: names, descriptions, input schemas | S9 |
| 6 | the two eras: the one function that tells old clients from new | S6–S8 |
| 7 | dispatch: a refusal is a *result* the model can read, not a crash | S17, S3 |
| 8 | the loop: read a line, answer it, stop when input ends | S2, S4 |

The rules S1–S18 are written out in `DESIGN-2026-09-28-stile-server.md`. The test,
`stile-test.sh`, was written from those rules in shell, not from the Lisp, so when you change the
server the test tells you which rule you broke.

## 3 The one change in the protocol worth understanding

Until 2025, a client began by sending `initialize`, and the server remembered what was agreed.
The specification of 2026-07-28 removed that: "Every request carries its protocol version, and the
server accepts or rejects each request independently." This server speaks both. Read
`c4-stile--admit` in Part 6: it is eighteen lines, and it is the whole difference.

## 4 Exercises (each one ends with the test passing)

1. **Add a fourth tool**, `stile_list`, that lists the files in a folder under the root with
   their sizes. Add it to `c4-stile-tools` (Part 5). Then add a case to `stile-test.sh` *first*,
   watch it fail, and make it pass.
2. **Break the fence on purpose**: run `C4_STILE_PLANT=no-fence sh stile-test.sh` and read which
   case goes red, and why. Every fault in `stile-plants.el` is a mistake someone could really
   make, planted from outside with `advice-add`; the server itself has no switch for any of them.
3. **Make the whole-file check work for big files.** Emacs hashes a buffer, not a stream (Part 4,
   `c4-stile-whole-hash-limit`). Can you hash a 2 GB file without holding it all? (Hint: you
   cannot with `secure-hash` alone; say so honestly, or find another way and test it.)
4. **Read the refusal messages as a model would.** Call `stile_assemble` with a missing piece. Is
   the message enough for someone to fix the problem without reading the code?

## 5 No Emacs on the far side?

`guix pack -RR -S /bin=bin emacs-minimal` makes a relocatable Emacs 30 (about 78 MB) that runs
without installing and without administrator rights. The first time you carry it, join its pieces
by hand (`cat`) and check them with `sha256sum -c`; after that, the server can do its own carrying.

## 6 Using it for real: carrying a big file over a narrow gate

On the side that has the file:

    split -b 19000000 -d big.iso big.iso.part.
    { printf '# whole %s %s\n' "$(sha256sum < big.iso | cut -c1-64)" "$(wc -c < big.iso)"
      sha256sum big.iso.part.*; } > big.iso.sha256

Move the parts and the manifest across however you can, in as many trips as it takes. On the
other side, point the server at the folder and call `stile_check`, then `stile_assemble`. The
manifest is ordinary `sha256sum` format, so `sha256sum -c big.iso.sha256` checks it too, with no
Emacs at all. That is on purpose: the format is the contract, and the server is one reader of it.
