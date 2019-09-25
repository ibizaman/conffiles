; You can also tangle the emacs.org file directly. This makes it easier to debug.

(require 'org)
(let ((real-dir (file-name-directory (file-chase-links (expand-file-name ".emacs" "~")))))
  (org-babel-load-file (concat real-dir "emacs.org")))
