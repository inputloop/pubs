;;; c4-stile-mcp.el --- A teaching MCP server  -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Corwin Brust <corwin@bru.st>
;; Author: Corwin Brust <corwin@bru.st>
;; Version: 0.1.0
;; Package-Requires: ((emacs "29.1"))
;; Keywords: tools, comm
;; SPDX-License-Identifier: GPL-3.0-or-later

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.  This program is distributed in the
;; hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
;; implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See <https://www.gnu.org/licenses/>.

;;; Commentary:

;; QUESTIONS GO TO: not yet named (see the LENS, fork F4).  Until a place
;; is named, nobody has promised to answer, and this line says so.
;;
;; What this is.  A complete Model Context Protocol (MCP) server in one
;; file of Emacs Lisp, written to be read.  If you know Emacs Lisp and want
;; to learn how an AI assistant talks to a program, read it top to bottom:
;; each part says what the protocol asks for and which lines do it.
;;
;; What it is not.  Not a library, and not the whole protocol: there are
;; no resources, prompts, pagination, subscriptions or cancellation.  For
;; a library that runs inside a live Emacs, see mcp-server-lib.el.  This
;; file runs as `emacs --batch' and needs nothing else.
;;
;; What it does.  It carries a big file over a narrow gate.  When a file
;; is too big to move in one piece, you cut it into pieces, write each
;; piece's checksum in a manifest, move the pieces, and put them back
;; together on the far side -- but only when every piece checks.  Three
;; tools: `stile_hash' (one file's checksum), `stile_check' (which pieces
;; are here and right), and `stile_assemble' (join them, never over
;; someone else's file).  A stile is the step built into a fence, so a
;; person can cross without anyone opening the gate.
;;
;; How to run it:
;;
;;     emacs --batch -Q -l c4-stile-mcp.el -f c4-stile-main ROOT
;;
;; ROOT is the only folder it will read or write in.  Try it by hand:
;;
;;     echo '{"jsonrpc":"2.0","id":1,"method":"server/discover"}' \
;;       | emacs --batch -Q -l c4-stile-mcp.el -f c4-stile-main /tmp
;;
;; The rules it keeps are numbered S1..S18 in the design file beside it
;; (DESIGN-2026-09-28-stile-server.md).  stile-test.sh tests each rule;
;; it was written in shell from that text, not from this code.  To show
;; that each test can fail, the test loads stile-plants.el, which breaks
;; this server on purpose, one mistake at a time.  Nothing in this file
;; can switch a fault on.

;;; Code:

(require 'subr-x)
(require 'seq)

;;;; Part 1.  What never changes

(defconst c4-stile-versions ["2026-07-28" "2025-11-25"]
  "The protocol versions this server speaks, newest first.
2026-07-28 is \"modern\": every request carries its version, and
there is no handshake.  2025-11-25 is \"legacy\": the client says
`initialize' first.  Speaking both makes a \"dual-era\" server.")

(defconst c4-stile-server-info '((name . "c4-stile") (version . "0.1.0"))
  "Who this server says it is.  Clients show it; they must not trust it.")

(defconst c4-stile-whole-hash-limit (* 256 1024 1024)
  "Largest joined file whose whole checksum we compute in memory.
Emacs hashes a buffer, not a stream, so a bigger file would need that
much memory.  Above this size we say the whole hash was NOT CHECKED.")

(defvar c4-stile--root nil
  "The one folder we may touch (S11), as a directory name.")

(defvar c4-stile--legacy nil
  "Non-nil once a client has said `initialize' (S7).")

;;;; Part 2.  The wire: one JSON message per line (S1, S2, S3, S18)

(defun c4-stile--send (message)
  "Write MESSAGE (an alist) to standard output as one line of JSON.
Nothing else ever goes to stdout (S1).  `send-string-to-terminal'
in batch mode writes the bytes and flushes them at once (S18).
`princ' also works in this loop, but only because the next
`read-from-minibuffer' flushes stdout before it waits.  (We first
wrote here that `princ' would sit in a buffer until exit; the test
showed that was wrong on Emacs 29.3 and 30.2, so the claim went.)"
  (let ((line (concat (json-serialize message
                                      :null-object :null
                                      :false-object :false)
                      "\n")))
    (send-string-to-terminal line)))

(defun c4-stile--reply (id result)
  "Answer request ID with RESULT (S1).
The keys go in this order so that a reader sees \"jsonrpc\" first."
  (c4-stile--send `((jsonrpc . "2.0") (id . ,id) (result . ,result))))

(defun c4-stile--error (id code text &optional data)
  "Answer request ID with JSON-RPC error CODE, message TEXT, and DATA.
Used for the protocol errors of S3, S6 and S8."
  (c4-stile--send
   `((jsonrpc . "2.0")
     (id . ,(or id :null))
     (error . ((code . ,code)
               (message . ,text)
               ,@(when data `((data . ,data))))))))

(defun c4-stile--log (fmt &rest args)
  "Write a diagnostic, formatted from FMT and ARGS, to standard error.
In batch mode `message' writes there, never to stdout, which keeps
stdout for protocol messages only (S1)."
  (apply #'message (concat "c4-stile: " fmt) args))

;;;; Part 3.  The fence: every path stays under ROOT (S11)

(define-error 'c4-stile-refused "Refused")

(defun c4-stile--refuse (fmt &rest args)
  "Refuse the current tool call, with a reason made from FMT and ARGS.
The caller gets it as a tool result with isError true (S17)."
  (signal 'c4-stile-refused (list (apply #'format fmt args))))

(defun c4-stile--inside (rel)
  "Return REL as an absolute file name under the root, or refuse (S11).
Absolute names (\"/etc/x\", \"~/x\", a drive letter) are refused.
Then `file-truename' resolves symbolic links and \"..\", and the
result must still start with the root.  That is the whole fence,
and it is the lesson: check where a path lands, not how it looks."
  (unless (and (stringp rel) (not (string-empty-p rel)))
    (c4-stile--refuse "a path is required"))
  (when (file-name-absolute-p rel)
    (c4-stile--refuse "%s is outside the root (absolute paths are refused)"
                      rel))
  (let ((full (file-truename (expand-file-name rel c4-stile--root))))
    (unless (string-prefix-p c4-stile--root full)
      (c4-stile--refuse "%s is outside the root" rel))
    full))

;;;; Part 4.  The work: checksums, manifests, joining (S14, S15, S16)

(defun c4-stile--sha256 (file)
  "Return the sha256 of FILE's bytes, as lower-case hex (S14, S15).
The buffer is unibyte and the file is read literally, so no coding
system touches the bytes: we hash exactly what is on disk."
  (with-temp-buffer
    (set-buffer-multibyte nil)
    (insert-file-contents-literally file)
    (secure-hash 'sha256 (current-buffer))))

(defun c4-stile--size (file)
  "Return FILE's size in bytes (S14, S16)."
  (file-attribute-size (file-attributes file)))

(defun c4-stile--read-manifest (manifest)
  "Read MANIFEST, in sha256sum format, and return (PIECES . WHOLE) (S15).
PIECES is a list of (NAME . HASH) in file order.  WHOLE is (HASH .
BYTES) from a \"# whole HASH BYTES\" line, or nil.  Each NAME is
relative to the manifest's folder, and is fenced like any path."
  (let ((dir (file-name-directory manifest)) pieces whole)
    (with-temp-buffer
      (insert-file-contents manifest)
      (dolist (line (split-string (buffer-string) "\n" t))
        (setq line (string-trim-right line "\r"))
        (cond
         ((string-match
           "\\`# whole \\([0-9a-f]\\{64\\}\\) \\([0-9]+\\)" line)
          (setq whole (cons (match-string 1 line)
                            (string-to-number (match-string 2 line)))))
         ((string-prefix-p "#" line))   ; any other comment
         ((string-match "\\`\\([0-9a-fA-F]\\{64\\}\\) [ *]\\(.+\\)\\'" line)
          (let ((name (expand-file-name (match-string 2 line) dir)))
            (push (cons (file-relative-name name c4-stile--root)
                        (downcase (match-string 1 line)))
                  pieces))))))
    (cons (nreverse pieces) whole)))

(defun c4-stile--check-pieces (pieces)
  "Check each of PIECES; return one alist per piece (S15).
Each says the piece's name, its status (OK, MISSING or MISMATCH),
the hash expected, and, on a mismatch, the hash found."
  (mapcar
   (lambda (p)
     (let* ((file (c4-stile--inside (car p)))
            (actual (and (file-regular-p file) (c4-stile--sha256 file))))
       `((name . ,(car p))
         (status . ,(cond ((not actual) "MISSING")
                          ((equal actual (cdr p)) "OK")
                          (t "MISMATCH")))
         (expected . ,(cdr p))
         ,@(when (and actual (not (equal actual (cdr p))))
             `((actual . ,actual))))))
   pieces))

(defun c4-stile--all-ok-p (rows)
  "Return non-nil when there are ROWS and every one is OK (S15, S16)."
  (and rows
       (seq-every-p (lambda (r) (equal (alist-get 'status r) "OK")) rows)))

(defun c4-stile-hash (args)
  "Tool `stile_hash' (S14): the sha256 and size of one file.
ARGS holds `path', relative to the root."
  (let* ((rel (alist-get 'path args))
         (file (c4-stile--inside rel)))
    (unless (file-regular-p file)
      (c4-stile--refuse "%s is not a file here" rel))
    (let ((h (c4-stile--sha256 file))
          (n (c4-stile--size file)))
      (list (format "%s  %s (%d bytes)" h rel n)
            `((path . ,rel) (sha256 . ,h) (bytes . ,n))))))

(defun c4-stile-check (args)
  "Tool `stile_check' (S15): which pieces of a manifest are here and right.
ARGS holds `manifest', relative to the root."
  (let* ((rel (alist-get 'manifest args))
         (read (c4-stile--read-manifest (c4-stile--inside rel)))
         (rows (c4-stile--check-pieces (car read)))
         (ready (c4-stile--all-ok-p rows)))
    (list (concat (mapconcat (lambda (r)
                               (format "%-8s %s" (alist-get 'status r)
                                       (alist-get 'name r)))
                             rows "\n")
                  (if ready "\nREADY: every piece checks." "\nNOT READY."))
          `((manifest . ,rel)
            (pieces . ,(vconcat rows))
            (ready . ,(if ready t :false))
            ,@(when (cdr read)
                `((whole . ((sha256 . ,(cadr read))
                            (bytes . ,(cddr read))))))))))

(defun c4-stile--join (pieces tmp)
  "Append each of PIECES to the file TMP, re-checking each (S16).
A piece that changed since it was checked stops the join; the
partial file is left where it is, and the refusal names it (this
server never deletes, not even its own leftovers: S12)."
  (let ((coding-system-for-write 'no-conversion)
        ;; Emacs normally locks a file while writing it (a ".#name" link)
        ;; and removes the lock after: a delete.  This server never
        ;; deletes (S12), and on a folder that forbids deleting, the lock
        ;; would be left behind.  So: no lock files.
        (create-lockfiles nil))
    (dolist (p pieces)
      (with-temp-buffer
        (set-buffer-multibyte nil)
        (insert-file-contents-literally (c4-stile--inside (car p)))
        (unless (equal (secure-hash 'sha256 (current-buffer)) (cdr p))
          (c4-stile--refuse "%s changed while joining; partial file left at %s"
                            (car p) (file-relative-name tmp c4-stile--root)))
        (write-region nil nil tmp t 'silent)))))

(defun c4-stile-assemble (args)
  "Tool `stile_assemble' (S16): join checked pieces into one file.
ARGS holds `manifest' and `target', both relative to the root.
The order of care: every piece must check first; the target must
not exist; we write to a temporary name beside it, re-checking each
piece as it is appended; we check the whole when we can; and only
then rename it into place.  If anything fails, the target is never
touched."
  (let* ((rel (alist-get 'target args))
         (target (c4-stile--inside rel))
         (read (c4-stile--read-manifest
                (c4-stile--inside (alist-get 'manifest args))))
         (pieces (car read))
         (whole (cdr read)))
    (unless (c4-stile--all-ok-p (c4-stile--check-pieces (car read)))
      (c4-stile--refuse "not every piece checks; stile_check says which"))
    (when (file-exists-p target)
      (c4-stile--refuse "%s already exists; this server never overwrites"
                        rel))
    (let ((tmp (make-temp-file
                (expand-file-name ".stile-" (file-name-directory target)))))
      (c4-stile--join pieces tmp)
      (let* ((bytes (c4-stile--size tmp))
             (big (> bytes c4-stile-whole-hash-limit))
             (verdict (cond ((or (not whole) big) "NOT CHECKED")
                            ((equal (c4-stile--sha256 tmp) (car whole)) "MATCH")
                            (t "MISMATCH")))
             (why (cond ((not whole) "the manifest has no \"# whole\" line")
                        (big (concat "too large to hash in memory; every piece"
                                     " matched, so check it with sha256sum")))))
        (when (equal verdict "MISMATCH")
          (c4-stile--refuse
           "the joined file does not match the whole hash; left at %s"
           (file-relative-name tmp c4-stile--root)))
        (rename-file tmp target)
        (list (format "%s: %d pieces, %d bytes, whole hash %s%s"
                      rel (length pieces) bytes verdict
                      (if why (concat " (" why ")") ""))
              `((target . ,rel) (pieces . ,(length pieces))
                (bytes . ,bytes) (whole . ,verdict)
                ,@(when why `((reason . ,why)))))))))

;;;; Part 5.  The menu: what tools/list shows a client (S9)

(defun c4-stile--schema (props required)
  "An input schema (S9): an object with PROPS; REQUIRED must be given."
  `((type . "object") (properties . ,props) (required . ,required)))

(defconst c4-stile-tools
  `[((name . "stile_hash")
     (title . "Checksum one file")
     (description . "The sha256 and size of one file under the root.")
     (inputSchema . ,(c4-stile--schema
                      '((path . ((type . "string")
                                 (description . "A path under the root."))))
                      ["path"]))
     (fn . c4-stile-hash))
    ((name . "stile_check")
     (title . "Check pieces against a manifest")
     (description . ,(concat "For each piece in a sha256sum-format manifest:"
                             " OK, MISSING or MISMATCH; ready when all OK."))
     (inputSchema . ,(c4-stile--schema
                      '((manifest . ((type . "string")
                                     (description . "The manifest's path."))))
                      ["manifest"]))
     (fn . c4-stile-check))
    ((name . "stile_assemble")
     (title . "Join checked pieces into one file")
     (description . ,(concat "Only when every piece checks: join them in"
                             " manifest order into target, never over an"
                             " existing file."))
     (inputSchema . ,(c4-stile--schema
                      '((manifest . ((type . "string")))
                        (target . ((type . "string")
                                   (description . "The joined file."))))
                      ["manifest" "target"]))
     (fn . c4-stile-assemble))]
  "The three tools.
`fn' is ours and is never sent; the rest is what a client sees.")

(defun c4-stile--tool-list ()
  "The tools as a client sees them: without `fn', in a fixed order (S9)."
  (let ((l (mapcar (lambda (tool)
                     (seq-remove (lambda (kv) (eq (car kv) 'fn)) tool))
                   (append c4-stile-tools nil))))
    (vconcat l)))

;;;; Part 6.  The two eras (S5, S6, S7, S8)

(defun c4-stile--version-of (params)
  "The protocol version a modern request declares in PARAMS' _meta (S6)."
  (alist-get 'io.modelcontextprotocol/protocolVersion
             (alist-get '_meta params)))

(defun c4-stile--complete (result)
  "Mark RESULT complete, the modern way (S5); legacy clients do not."
  (if c4-stile--legacy result (append result '((resultType . "complete")))))

(defun c4-stile--admit (id method params)
  "Decide whether request ID, for METHOD with PARAMS, may be served.
If not, answer it with the error and return nil (S5 to S8).
`initialize' and `server/discover' are always admitted.  Anything
else needs a supported version in _meta (modern) or an earlier
`initialize' (legacy).  This one function is the whole difference
between the eras."
  (let ((v (c4-stile--version-of params)))
    (cond
     ((member method '("initialize" "server/discover")) t)
     ((and v (seq-contains-p c4-stile-versions v)) t)
     (v (c4-stile--error id -32022 "Unsupported protocol version"
                         `((supported . ,c4-stile-versions)
                           (requested . ,v)))
        nil)
     (c4-stile--legacy t)
     (t (c4-stile--error
         id -32602
         (concat "Missing _meta io.modelcontextprotocol/protocolVersion;"
                 " this server speaks 2026-07-28 and 2025-11-25"
                 " (send initialize first for 2025-11-25)"))
        nil))))

;;;; Part 7.  Dispatch: one request in, one answer out

(defun c4-stile--tool-result (text data error)
  "A tool result: TEXT for people, DATA for programs, ERROR if refused.
Both say the same facts (S17)."
  (c4-stile--complete
   `((content . [((type . "text") (text . ,text))])
     (structuredContent . ,data)
     (isError . ,(if error t :false)))))

(defun c4-stile--call-tool (id params)
  "Run the tool PARAMS names and answer request ID with its result (S17).
A refusal is a tool result with isError true, not a protocol error:
errors a model could fix belong in the result, where it can read
them.  An unknown tool name is a protocol error."
  (let* ((name (alist-get 'name params))
         (tool (seq-find (lambda (tl) (equal (alist-get 'name tl) name))
                         c4-stile-tools)))
    (if (not tool)
        (c4-stile--error id -32602 (format "Unknown tool: %s" name))
      (condition-case err
          (let ((out (funcall (alist-get 'fn tool)
                              (alist-get 'arguments params))))
            (c4-stile--reply id (c4-stile--tool-result
                                 (car out) (cadr out) nil)))
        (c4-stile-refused
         (c4-stile--reply id (c4-stile--tool-result
                              (format "Refused: %s" (cadr err))
                              `((refused . ,(cadr err)))
                              t)))))))

(defun c4-stile--answer (id method params)
  "Answer request ID for METHOD with PARAMS; it has been admitted.
The answers of S5, S7, S9 and S10, and the unknown method of S3."
  (pcase method
    ("initialize"
     (setq c4-stile--legacy t)
     (let ((asked (alist-get 'protocolVersion params)))
       (c4-stile--reply
        id `((protocolVersion . ,(or (car (member asked '("2025-11-25")))
                                     "2025-11-25"))
             (capabilities . ((tools . ,(make-hash-table))))
             (serverInfo . ,c4-stile-server-info)))))
    ("server/discover"
     (c4-stile--reply
      id `((resultType . "complete")
           (supportedVersions . ,c4-stile-versions)
           (capabilities . ((tools . ,(make-hash-table))))
           (_meta . ((io.modelcontextprotocol/serverInfo
                      . ,c4-stile-server-info)))
           (instructions . ,(concat "Carry big files in checked pieces:"
                                    " stile_check, then stile_assemble.")))))
    ("ping" (c4-stile--reply id (make-hash-table)))
    ("tools/list"
     (c4-stile--reply id (c4-stile--complete
                          `((tools . ,(c4-stile--tool-list))))))
    ("tools/call" (c4-stile--call-tool id params))
    (_ (c4-stile--error id -32601 (format "Method not found: %s" method)))))

(defun c4-stile--handle (line)
  "Read one LINE from the client and answer it.
A line that is not JSON gets -32700 (S3).  A notification, which
has no id, gets no answer at all (S2)."
  (let ((msg (condition-case nil
                 (json-parse-string line :object-type 'alist
                                    :array-type 'list
                                    :null-object nil :false-object :false)
               (error (c4-stile--error nil -32700 "Parse error: not JSON")
                      nil))))
    (when (and msg (listp msg))
      (let ((id (alist-get 'id msg))
            (method (alist-get 'method msg))
            (params (alist-get 'params msg)))
        (when (and (assq 'id msg)                 ; no id: a notification
                   (c4-stile--admit id method params))
          (c4-stile--answer id method params))))))

;;;; Part 8.  The loop: read until stdin ends (S4)

(defun c4-stile-main ()
  "Serve MCP on stdin and stdout, for the root named on the command line.
Read until standard input ends, then exit 0 (S4).  Run it as
\"emacs --batch -Q -l c4-stile-mcp.el -f c4-stile-main ROOT\",
with ROOT the only folder the server may read or write."
  (let ((root (pop command-line-args-left)))
    (setq command-line-args-left nil)  ; so Emacs does not visit ROOT
    (unless (and root (file-directory-p root))
      (c4-stile--log "usage: emacs --batch -Q -l c4-stile-mcp.el %s"
                     "-f c4-stile-main ROOT (a folder)")
      (kill-emacs 2))
    (unless (and (fboundp 'json-parse-string)
                 (or (not (fboundp 'json-available-p)) (json-available-p)))
      (c4-stile--log "no native JSON here; Emacs 29 with libjansson, or 30")
      (kill-emacs 2))
    (setq c4-stile--root (file-name-as-directory (file-truename root)))
    (c4-stile--log "serving %s" c4-stile--root)
    (catch 'eof
      (while t
        (let ((line (condition-case nil
                        (read-from-minibuffer "")
                      (error (throw 'eof nil)))))
          (setq line (string-trim-right line "\r"))
          (unless (string-empty-p (string-trim line))
            (condition-case err
                (c4-stile--handle line)
              (error (c4-stile--log "internal error: %S" err)
                     (c4-stile--error nil -32603 "Internal error")))))))
    (kill-emacs 0)))

(provide 'c4-stile-mcp)
;;; c4-stile-mcp.el ends here
