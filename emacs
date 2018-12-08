(require 'org)
(let ((real-dir (file-name-directory (file-chase-links (expand-file-name ".emacs" "~")))))
  (org-babel-load-file (concat real-dir "emacs.org")))
