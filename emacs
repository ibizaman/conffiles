(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)


; ORG-MODE install hack https://github.com/raxod502/straight.el/commit/3190d95ee0556233624a4fb3bd2342e1fcb516b1#diff-04c6e90faac2675aa89e2176d2eec7d8
(require 'subr-x)
(straight-use-package 'git)

(defun org-git-version ()
  "The Git version of 'org-mode'.
Inserted by installing 'org-mode' or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (git-run "describe"
              "--match=release\*"
              "--abbrev=6"
              "HEAD"))))

(defun org-release ()
  "The release version of 'org-mode'.
Inserted by installing 'org-mode' or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (string-remove-prefix
      "release_"
      (git-run "describe"
               "--match=release\*"
               "--abbrev=0"
               "HEAD")))))

(provide 'org-version)

(straight-use-package 'org)
; ORG-MODE install hack END

(setq-default indent-tabs-mode nil)

(set-face-attribute 'default nil :family "Inconsolata"
                               :foundry "PfEd"
                               :slant 'normal
                               :height 90
                               :weight 'normal
                               :width 'normal)

; Disable GUI
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(setq mode-line-position
      '(;; %p print percent of buffer above top of window, o Top, Bot or All
        ;; (-3 "%p")
        ;; %I print the size of the buffer, with kmG etc
        ;; (size-indication-mode ("/" (-4 "%I")))
        ;; " "
        ;; %l print the current line number
        ;; %c print the current column
        (line-number-mode ("%l" (column-number-mode ":%c")))))
; Enable saving of minibuffer history and other variables
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring)
      savehist-file "~/.emacs.d/savehist")
(savehist-mode t)

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
               (output ""))
       (when (and path (equal "" (car path)))
         (setq path (cdr path)))
       (while (and path (< (length output) (- max-length 4)))
         (setq output (concat (car path) "/" output))
         (setq path (cdr path)))
       (when path
         (setq output (concat ".../" output)))
       output))

(defvar mode-line-directory
  '(:propertize
    (:eval (if (buffer-file-name) (concat " " (shorten-directory default-directory 20)) " "))
                face mode-line-directory)
  "Formats the current directory.")
(put 'mode-line-directory 'risky-local-variable t)

(setq-default mode-line-buffer-identification
  (propertized-buffer-identification "%b "))

(setq-default mode-line-format
      '("%e"
        mode-line-front-space
        ;; mode-line-mule-info -- I'm always on utf-8
        mode-line-client
        mode-line-modified
        ;; mode-line-remote -- no need to indicate this specially
        ;; mode-line-frame-identification -- this is for text-mode emacs only
        " "
        mode-line-directory
        mode-line-buffer-identification
        " "
        mode-line-position
        ;; (vc-mode vc-mode)  -- I use magit, not vc-mode
        ;; (flycheck-mode flycheck-mode-line)
        " "
        ;; mode-line-modes
        mode-line-misc-info
        mode-line-end-spaces))

; Git-grep command
(defun completing-read-simple (prompt alist)
  "Equivalent to (completing-read PROMPT ALIST nil nil (car ALIST) (quote ALIST))."
  (completing-read prompt (symbol-value alist) nil nil nil alist))

(defun git-grep (dir regexp &optional files)
  "Search in DIR (default current git folder) for REGEXP tracked FILES."
  (interactive (let* ((dir (read-file-name (concat "Git grep in dir: ") (vc-root-dir) nil t)))
		 (list dir
		       (completing-read-simple (concat "Git grep regexp in dir " dir ": ") 'grep-regexp-history)
		       (completing-read-simple (concat "Run on files in dir " dir " : ") 'grep-files-history))))
  (lgrep (concat "git --no-pager grep -n -e '" regexp "'") nil dir))

(global-set-key (kbd "C-x f") 'git-grep)

(defun call-with-prefix (prefix function)
  "Call a function interactively like if \\<keymap> PREFIX FUNCTION was given."
  (interactive)
  (let ((current-prefix-arg (list prefix)))
    (call-interactively function)))

;; When saving a file that starts with `#!', make it executable.
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

(use-package evil
  :straight t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (global-unset-key (kbd "C-x +")) ; Set to "C-w =" with evil
  )

(use-package mustang-theme
  :straight t)

(use-package magit-gh-pulls
  :straight t)

(use-package evil-magit
  :straight t)

(use-package magit
  :straight t
  :after magit-gh-pulls
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
  (setq magit-diff-refine-hunk t
	magit-diff-paint-whitespace t
	magit-diff-highlight-trailing t
	magit-process-popup-time 10
	magit-save-repository-buffers t
	magit-push-current-set-remote-if-missing t)
  :bind (("C-x g" . magit-status)))

(use-package ob-async
  :straight t)
(use-package ob-python)
(use-package ob-shell)

(use-package org
  :straight t
  :after ob-python ob-async ob-shell
  :init
  (defun my/org-mode-hook-evil ()
      (setq evil-auto-indent nil))
  (add-hook 'org-mode-hook 'my/org-mode-hook-evil)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (sql . t)
     (python . t)
     (shell . t))))

(use-package virtualenvwrapper
  :straight t
  :bind (("C-c v" . venv-workon)))

(use-package flycheck
  :straight t
  :config
  (setq flycheck-command-wrapper-function
        (lambda (command)
          (if (null (string-match "pylint" (car command)))
              command
	    (let* ((new-prefix (replace-regexp-in-string "pylint$" "python" (car command)))
		   (new-rest (append '("-m" "pylint") (cdr command)))
		   (new-command (append (list new-prefix) new-rest)))
	      new-command))))
  (global-flycheck-mode))

(use-package flycheck-popup-tip
  :straight t
  :after flycheck
  :config
  (flycheck-popup-tip-mode))

(use-package pytest
  :straight t
  :bind (("C-c t t" . pytest-one)
	 ("C-c t m" . pytest-module)))

(use-package company-jedi
  :straight t
  :init
  (defun my/python-mode-hook-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook-company-jedi))

(use-package company
  :straight t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package json-mode
  :straight t)

(use-package yaml-mode
  :straight t)

(use-package expand-region
  :straight t
  :bind (("C-c =" . er/expand-region)
	 ("C-c -" . (lambda () (interactive) (call-with-prefix -1 'er/expand-region)))))

(use-package htmlize
  :straight t)

(use-package git-link
  :straight t
  :config
  (defun git-link-master-branch ()
    (interactive)
    (let ((git-link-default-branch "master"))
      (call-interactively 'git-link)))
  (defun git-link-at-commit ()
    (interactive)
    (let ((git-link-use-commit t))
      (call-interactively 'git-link)))
  (defun git-link-master-branch-at-commit ()
    (interactive)
    (let ((git-link-default-branch "master")
	  (git-link-use-commit t))
      (call-interactively 'git-link))))

(use-package git-gutter-fringe+
  :straight t
  :config
  (global-git-gutter+-mode)
  (git-gutter-fr+-minimal)
  (setq git-gutter-fr+-side 'right-fringe))


(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
; Move custom-set-variables and custom-set-faces in different file
(setq custom-file "~/.emacs-custom.el")
(load custom-file)

; Prompt to save customization before quitting
(add-hook 'kill-emacs-query-functions
	  'custom-prompt-customize-unsaved-options)
