;;; stile-plants.el --- Faults for stile-test.sh --prove-red  -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Corwin Brust <corwin@bru.st>
;; SPDX-License-Identifier: GPL-3.0-or-later
;; This program is free software under the GNU General Public License, version 3 or (at your
;; option) any later version, WITHOUT ANY WARRANTY; see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Loaded only by stile-test.sh, after c4-stile-mcp.el, when C4_STILE_PLANT
;; names a fault.  Each fault is a mistake someone could really make when
;; writing a server like this one, and each is planted from outside with
;; `advice-add', so the server itself carries no switch that could turn
;; its own safety off.  If a planted fault does not turn its test red, the
;; test was not testing what it said.
;;
;; A learner's exercise: read a fault, predict which rule (S1..S18) it
;; breaks, then run  C4_STILE_PLANT=<name> sh stile-test.sh  and see.

;;; Code:

(require 'cl-lib)
(require 'json)

(defvar stile-plants--held nil "Replies held back by the \"buffered\" fault.")

(pcase (getenv "C4_STILE_PLANT")
  ;; S1: a debugging line on stdout, which the client reads as a message.
  ("stdout-noise"
   (advice-add 'c4-stile-main :before (lambda (&rest _) (princ "starting up\n"))))
  ;; S18: every reply held until the server exits.
  ("buffered"
   (advice-add 'c4-stile--send :override
               (lambda (m)
                 (push (concat (json-serialize m :null-object :null
                                               :false-object :false)
                               "\n")
                       stile-plants--held)))
   (add-hook 'kill-emacs-hook
             (lambda () (dolist (l (reverse stile-plants--held)) (princ l)))))
  ;; S2: an answer to a notification, which must get none.
  ("reply-notify"
   (advice-add 'c4-stile--handle :after
               (lambda (line)
                 (let ((m (ignore-errors
                            (json-parse-string line :object-type 'alist))))
                   (when (and (consp m) (not (assq 'id m)))
                     (c4-stile--reply :null (make-hash-table)))))))
  ;; S6, S8: every request admitted, whatever version it names.
  ("no-version-check"
   (advice-add 'c4-stile--admit :override (lambda (&rest _) t)))
  ;; S9: the tools in a different order each time someone "tidies" them.
  ("order"
   (advice-add 'c4-stile--tool-list :filter-return
               (lambda (v) (vconcat (reverse (append v nil))))))
  ;; S11: no fence; a path is taken as given.
  ("no-fence"
   (advice-add 'c4-stile--inside :override
               (lambda (rel) (expand-file-name rel c4-stile--root))))
  ;; S16: an existing target is written over.
  ("overwrite"
   (advice-add 'c4-stile-assemble :around
               (lambda (f args)
                 (let ((rename (symbol-function 'rename-file)))
                   (cl-letf (((symbol-function 'file-exists-p) #'ignore)
                             ((symbol-function 'rename-file)
                              (lambda (a b &rest _) (funcall rename a b t))))
                     (funcall f args))))))
  ;; S16: the temporary file copied into place and left behind.
  ("keep-temp"
   (advice-add 'rename-file :override
               (lambda (a b &rest _) (copy-file a b t))))
  ;; S16: the pieces joined in the wrong order.
  ("reverse-join"
   (advice-add 'c4-stile--join :filter-args
               (lambda (args) (list (reverse (car args)) (cadr args)))))
  ;; S12: Emacs's usual file locks, which are removed (deleted) after writing.
  ("lockfiles"
   (advice-add 'write-region :around
               (lambda (f &rest a) (let ((create-lockfiles t)) (apply f a))))))

(provide 'stile-plants)
;;; stile-plants.el ends here
