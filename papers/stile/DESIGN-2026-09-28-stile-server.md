# DESIGN 2026-09-28 — the stile server: a fourth MCP server, in Emacs Lisp, that teaches

**Status:** written before the build; revisable. Minted as an example, not as a gate: nothing in
the shop is made to depend on it.

## 1 What the source asked for, in his words

From `q/2026-09-28-stile/PROMPT.md` (sha256 `eeccefcba3a93b9d…`):

> I think I have been itching to have an MCP server written in one more implementation language
> (…), and something where an MCP example might be helpful, for example to someone learning MCP
> who already knows the selected language

The reasons for Emacs Lisp and for the job are in `LENS-2026-09-28-over-the-fence.md`, Boards 2–3.

## 2 The design

One file, `c4-stile-mcp.el`, run as

    emacs --batch -Q -l c4-stile-mcp.el -f c4-stile-main ROOT

It reads one JSON-RPC message per line on standard input and writes one per line on standard
output, until standard input ends. Its comments are the lesson: each part says what the protocol
asks and which line does it.

## 3 The contract (written first; the tests are written from this, not from the code)

**Transport**
- **S1** Every line written to standard output is one complete JSON-RPC 2.0 message, and nothing
  else is ever written there. Diagnostics go to standard error.
- **S2** A message with no `id` (a notification) gets no reply.
- **S3** A line that is not JSON gets error `-32700` with `id` null. A request for a method the
  server does not know gets `-32601`.
- **S4** When standard input ends, the server exits with status 0.
- **S18** Each reply is on standard output as soon as it is written: a client does not have to
  close standard input to read it. (Added before the build, while writing the test: a test that
  pipes every request in and reads after exit would never see a buffered reply go missing.)

**Both eras**
- **S5** `server/discover` answers with `supportedVersions` `["2026-07-28","2025-11-25"]`,
  `capabilities.tools`, `_meta["io.modelcontextprotocol/serverInfo"]`, and `resultType` `"complete"`.
- **S6** A request whose `_meta["io.modelcontextprotocol/protocolVersion"]` names a version not in
  that list gets error `-32022` with `data.supported` and `data.requested`.
- **S7** `initialize` (the older handshake) answers with `protocolVersion` (the client's if
  supported, else `2025-11-25`), `capabilities.tools` and `serverInfo`; after it, requests without
  `_meta` are served the older way.
- **S8** A request with neither a supported `_meta` version nor a prior `initialize` gets `-32602`
  whose message names the supported versions.
- **S9** `tools/list` names exactly three tools, always in the same order: `stile_hash`,
  `stile_check`, `stile_assemble`, each with an `inputSchema` of type `object`.
- **S10** `ping` answers with an empty result.

**The fence (the root)**
- **S11** Every path argument is relative to ROOT. An absolute path, or one that resolves outside
  ROOT (for example through `..`), is refused as a tool error (`isError` true) whose text names the
  path and says it is outside the root.
- **S12** Nothing is ever deleted. Nothing is ever written except by `stile_assemble`.
- **S13** No network connection is opened, ever.

**The tools**
- **S14** `stile_hash {path}` returns the file's sha256 (lower-case hex) and size in bytes.
- **S15** `stile_check {manifest}` reads a manifest in `sha256sum` format (`<64 hex>  <name>` per
  line; lines starting `#` are comments, except `# whole <64 hex> <bytes>`, which names the joined
  file's hash and size). Names are relative to the manifest's folder. It returns, per piece in
  manifest order, `OK`, `MISSING` or `MISMATCH`, and `ready` true only if every piece is `OK`.
- **S16** `stile_assemble {manifest, target}` refuses unless every piece is `OK`; refuses if
  `target` exists with different contents (it never overwrites); writes the pieces, in manifest
  order, to a temporary name beside the target and renames it into place; re-checks each piece's
  hash as it is appended; and reports the joined size and, when the manifest has a `# whole` line,
  whether the joined file matches it — or says plainly that the whole hash was **not checked** and
  why (for example, too large to hash in memory).
- **S17** Tool results carry `content` (text for people) and `structuredContent` (the same facts
  as data), and `isError` true on a refusal.

## 4 What it adds and does not add

Adds: one teaching file, its test, and a way to carry big files over a narrow gate. Does not add:
resources, prompts, pagination, subscriptions, cancellation, or a place in the default plugin set.
Not a library.

## 5 Open questions routed to him (the LENS forks)

F2 where it goes toward Emacs users · F4 where a learner's questions go · the move from `h/stile/`
to `mcp/`.
