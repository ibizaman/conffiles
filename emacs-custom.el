(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-do-cache t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-scroll-output (quote first-error))
 '(ediff-autostore-merges t)
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("http://planet.emacsen.org/atom.xml" "http://www.howardism.org/index.xml" "https://www.with-emacs.com/rss.xml" "https://irreal.org/blog/?feed=rss2")))
 '(etl-mode-etl-dir "~/Projects/OpenMail/OpenMail/etl/")
 '(etl-mode-hostname "laptop")
 '(etl-mode-slack-user "pierre")
 '(evil-insert-state-modes
   (quote
    (term-mode erc-mode eshell-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode wdired-mode)))
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(global-command-log-mode t)
 '(hl-paren-background-colors
   (quote
    ("red2" "DarkOrange2" "gold2" "chartreuse2" "DarkSlateGray2" "SlateBlue2")))
 '(hl-paren-colors
   (quote
    ("gray100" "gray100" "gray100" "gray100" "gray100" "gray100")))
 '(ibizaman/mu4e-unread-excluded-lists
   (quote
    ("055beefeabea5aa48a0c0bc74.107657.list-id.mcsv.net" "80fc49ec84df168e48c00c18a.307193.list-id.mcsv.net" "faa8eb4ef3a111cef92c4f3d4.583821.list-id.mcsv.net" "baron.PyCQA.github.com" "codalist.coda.cs.cmu.edu" "42-hackerspaces.be" "elixir.elixir-lang.github.com" "elodie.jmathai.github.com" "redbaron.PyCQA.github.com" "password-store.lists.zx2c4.com" "emacs-devel.gnu.org")))
 '(magithub-clone-default-directory "~/Projects")
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 5) ((control)))))
 '(mu4e-context-policy (quote pick-first))
 '(mu4e-view-auto-mark-as-read nil)
 '(mu4e-view-show-addresses t)
 '(my-font-size 13)
 '(nameses-ido-mode nil)
 '(next-error-recenter (quote (4)))
 '(org-adapt-indentation nil)
 '(org-babel-uppercase-example-markers t)
 '(org-edit-src-content-indentation 0)
 '(org-jira-download-dir "~/Downloads/jira")
 '(org-special-ctrl-a/e t)
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-tab-acts-natively t)
 '(org-src-window-setup (quote current-window))
 '(pyenv-mode t)
 '(pytest-cmd-flags "-x -s -vv")
 '(safe-local-variable-values
   (quote
    ((eval setenv "OVERRIDE_CS_LOCAL" "postgres://timi:postgres@localhost:5432/postgres")
     (eval setenv "OVERRIDE_CS_POSTGRES_TESTING" "postgres://timi:postgres@localhost:5432/postgres"))))
 '(text-mode-hook (quote (turn-on-flyspell text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-even-diff-A ((t (:background "#553333"))))
 '(ediff-even-diff-Ancestor ((t (:background "#004151"))))
 '(ediff-even-diff-B ((t (:background "#335533"))))
 '(ediff-even-diff-C ((t (:background "#888833"))))
 '(ediff-odd-diff-A ((t (:background "#553333"))))
 '(ediff-odd-diff-Ancestor ((t (:background "#004151"))))
 '(ediff-odd-diff-B ((t (:background "#335533"))))
 '(ediff-odd-diff-C ((t (:background "#888833"))))
 '(eyebrowse-mode-line-active ((t (:inherit mode-line-emphasis :inverse-video t))))
 '(mu4e-view-body-face ((t (:background "gray10"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :background "#102D3F" :foreground "#3A86B4" :slant normal))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :slant italic))))
 '(vertical-border ((t (:foreground "gray23")))))
