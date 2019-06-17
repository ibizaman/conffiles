(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(adaptive-fill-regexp "[ 	]*\\([-–/!|#%;>*·•‣⁃◦]+[ 	]*\\)*")
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.3)
 '(auth-source-do-cache t)
 '(company-go-show-annotation t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-scroll-output (quote first-error))
 '(default-frame-alist (quote ((fullscreen . maximized) (undecorated))))
 '(desktop-restore-eager t)
 '(desktop-restore-in-current-display nil)
 '(desktop-save-hook (quote (tramp-cleanup-all-connections)))
 '(dired-dwim-target t)
 '(display-buffer-alist
   (quote
    (("*compilation\\\\*" display-buffer-in-side-window
      (slot . 0)
      (side . bottom)))))
 '(ediff-autostore-merges t)
 '(ediff-merge-split-window-function (quote split-window-horizontally))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("https://write.as/dani/feed/" "https://markkarpov.com/feed.atom" "http://bitemyapp.com/rss.xml" "https://www.fpcomplete.com/blog/rss.xml" "http://neilmitchell.blogspot.com/feeds/posts/default" "https://planet.haskell.org/rss20.xml" "https://vocalfolds.wordpress.com/category/emacs/feed/" "http://tychoish.com/tag/emacs/feed/index.rss" "https://scripter.co/categories/emacs/atom.xml" "http://feeds.feedburner.com/pimpmyemacs" "https://punchagan.muse-amuse.in/tags/emacs/index.xml" "https://pozorvlak.livejournal.com/data/atom?tag=emacs" "https://panduwana.wordpress.com/category/emacs/feed/" "http://subtech.g.hatena.ne.jp/antipop/rss2" "https://emacs.wordpress.com/feed/" "https://emacspeak.blogspot.com/feeds/posts/default?alt=atom" "http://emacsninja.com/emacs.atom" "http://emacshorrors.com/feed.atom" "https://emacsair.me/feed.xml" "https://baongoc124.wordpress.com/category/emacs/feed/" "https://au9ustine.wordpress.com/tag/emacs/feed/" "https://zingming.wordpress.com/tag/emacs/feed/" "http://sxemacs-en.blogspot.com/feeds/posts/default" "http://feeds.feedburner.com/FistOfSenn" "http://prodissues.com/category/emacs-geeking/feed" "https://wolfgangpfaff.wordpress.com/category/emacs/feed/" "https://www.miskatonic.org/feed/emacs.xml" "http://www.wilfred.me.uk/emacs_rss.xml" "http://whattheemacsd.com/atom.xml" "https://netflux.wordpress.com/tag/emacs/feed/" "http://dorophone.blogspot.com/feeds/posts/default/-/emacs" "http://trey-jackson.blogspot.com/atom.xml" "http://occident.us/category/emacs/feed/" "http://tromey.com/blog/?cat=11&feed=rss2" "http://tehom-blog.blogspot.com/feeds/posts/default/-/emacs" "http://www.lonecpluspluscoder.com/category/emacs/feed/" "https://blog.lnx.cx/category/emacs/feed/" "https://jugglingbits.wordpress.com/tag/emacs/feed/" "https://www.fitzsim.org/blog/?feed=rss2&cat=3" "http://feeds.feedburner.com/ted-roden-emacs" "https://tsdh.wordpress.com/tag/emacs/feed/" "https://tsdh.org/rss.xml" "https://suvayu.wordpress.com/tag/emacs/feed/" "https://hbfs.wordpress.com/category/emacs/feed/" "http://gnufool.blogspot.com/feeds/posts/default/-/emacs" "https://swsnr.de/emacs.atom" "http://thewanderingcoder.com/category/emacs/feed/" "http://scottfrazersblog.blogspot.com/feeds/posts/default" "http://acidwords.com/" "http://whatthefuck.computer/rss.xml" "http://www.mostlymaths.net/feeds/posts/default/-/emacs" "https://roylowrance.wordpress.com/category/emacs/feed/" "http://robert-adesam.blogspot.com/feeds/posts/default/-/emacs" "http://splash-of-open-sauce.blogspot.com/feeds/posts/default/-/planetemacsen" "http://wenshanren.org/?cat=10&tag=en&feed=rss2" "http://www.randomsample.de/dru5/taxonomy/term/2/0/feed" "http://puntoblogspot.blogspot.com/feeds/posts/default/-/emacs" "https://techleaves.wordpress.com/tag/emacs/feed/" "http://www.spacjer.com/emacs/feed.xml" "https://rvfblog.wordpress.com/category/emacs/feed/" "http://pragmaticemacs.com/feed/" "http://www.russet.org.uk/blog/category/all/professional/tech/emacs/feed" "http://psung.blogspot.com/feeds/posts/default/-/emacs" "http://technomancy.us/feed/atom" "https://doxdrum.wordpress.com/tag/emacs/feed/" "http://brain-break.blogspot.com/feeds/posts/default/-/emacs" "https://manandbytes.wordpress.com/tag/emacs/feed/" "http://www.modernemacs.com/categories/emacs/index.xml" "https://sinewalker.wordpress.com/tag/emacs/feed/" "http://mwfogleman.github.io/" "http://mp.vv.si/blog/category/emacs/feed/" "https://matt.hackinghistory.ca/blog/feed/atom/" "https://tincman.wordpress.com/tag/emacs/feed/" "http://muublog.blogspot.com/feeds/posts/default/-/emacs" "https://martinralbrecht.wordpress.com/category/emacs/feed/atom/" "" "https://hexmode.com/tag/emacs/feed" "http://ww7.nongeekrecipes.org/" "http://mbork.pl/?action=rss;rcfilteronly=CategoryEmacs;all=0;showedit=0;title=%20Content%20AND%20Presentation" "http://manuel-uberti.github.io/feed.xml" "http://emacsblog.org/feed/" "http://www.lambdacat.com/tag/emacs/rss/" "https://kuniganotas.wordpress.com/category/emacs/feed/" "http://dialectical-computing.de/blog/emacs.xml" "https://kevand.wordpress.com/tag/emacs/feed/" "http://justinsboringpage.blogspot.com/feeds/posts/default/-/emacs" "https://curiousprogrammer.wordpress.com/tag/emacs/feed/atom/" "http://blog.jorgenschaefer.de/feeds/posts/default/-/Emacs" "https://jonathancamp.com/tag/emacs/feed/" "http://emacsair.me.s3-website.eu-central-1.amazonaws.com/feed.xml" "http://jr0cket.co.uk/categories/emacs/atom.xml" "https://seeknuance.com/tag/emacs/feed/" "http://feeds.feedburner.com/tuxicity-emacs" "https://jawher.wordpress.com/category/emacs/feed/" "http://www.carcosa.net/jason/blog/computing/index.rss2" "https://chopmode.wordpress.com/category/emacs/feed/" "http://kanis.fr/blog-emacs.xml" "http://irreal.org/blog/?tag=emacs&feed=rss2" "https://ikaruga2.wordpress.com/tag/emacs/feed/" "https://ignaciopp.wordpress.com/tag/emacs/feed/" "http://atomized.org/tag/emacs/feed/" "https://yilmazhuseyin.wordpress.com/category/emacs/feed/" "https://www.gregnewman.org/journal/feed/category/emacs/" "http://www.wisdomandwonder.com/tag/emacs/feed" "http://feeds.feedburner.com/GotEmacs" "https://gongyiliao.wordpress.com/category/emacs/feed/" "https://keramida.wordpress.com/category/emacs/feed/" "https://gaiustech.wordpress.com/category/emacs/feed/" "http://api.flickr.com/services/feeds/photos_public.gne?tags=emacs&lang=en-us&format=rss_200" "https://xeno-by.livejournal.com/data/atom?tag=emacs-en" "http://endlessparentheses.com/atom-planet.xml" "http://feeds.feedburner.com/emacsrookiecom" "http://emacs-fu.blogspot.com/feeds/posts/default/-/new" "http://emacs.cafe/feed.xml" "http://emacsredux.com/atom.xml" "http://emacsmovies.org/atom.xml" "http://feeds.feedburner.com/emacslife" "https://l0st3d.wordpress.com/category/emacs/feed/" "http://tromey.com/elpa/elpa.rss" "https://draptik.wordpress.com/tag/emacs/feed/" "http://tapoueh.org/rss/emacs.xml" "http://echosa.github.io/blog/categories/emacs/atom.xml" "https://calltopower.wordpress.com/tag/emacs/feed/" "http://davazp.net/feeds/emacs.xml" "http://blog.danielgempesaw.com/tagged/planet-emacsen/rss" "https://zhangda.wordpress.com/feed/" "https://crazythinking.wordpress.com/category/emacs/feed/" "https://punchcard.wordpress.com/tag/emacs/feed/" "http://nullprogram.com/tags/emacs/feed/" "https://blog.printf.net/feed/" "https://raw.githubusercontent.com/chmouel/rise-mystack/master/bootstrap.sh" "http://blog.binchen.org/categories/emacs.xml" "https://camdez.com/blog/categories/emacs/atom.xml" "http://bryan-murdock.blogspot.com/atom.xml" "https://bloggingmath.wordpress.com/tag/emacs/feed/" "http://batsov.com/emacs.xml" "http://babbagefiles.blogspot.com/feeds/posts/default/-/emacs" "http://www.blogger.com/feeds/12753102/posts/default/-/emacs" "http://denverdroid.blogspot.com/feeds/posts/default/-/emacs" "https://awhan.wordpress.com/category/emacs/feed/" "https://arunsag.wordpress.com/category/emacs/feed/" "http://tsengf.blogspot.com/feeds/posts/default/-/emacs" "https://blog.anupamsg.me/tag/emacs/feed/atom/" "http://mnemonikk.org/feed/" "https://amortizedanalysis.wordpress.com/tag/emacs/feed/" "http://peadrop.com/blog/category/computers/emacs/feed/" "http://gromnitsky.blogspot.com/feeds/posts/default/-/emacs" "https://alexschroeder.ch/wiki?action=rss;full=1" "http://alexott.blogspot.com/feeds/posts/default/-/emacs" "https://www.bennee.com/~alex/blog/tag/emacs/feed" "https://axelio.wordpress.com/category/emacs/feed/" "http://aidan.codes/blog/category/emacs/feed/" "https://aaronhawley.livejournal.com/data/atom/" "http://oremacs.com/atom.xml" "http://tess.oconnor.cx/feed;tag%3Demacs" "https://mousecradle.wordpress.com/tag/emacs/feed/" "http://emacstidbits.blogspot.com/atom.xml" "https://haskellweekly.news/haskell-weekly.atom" "http://www.bouletcorp.com/feed/" "http://www.howardism.org/index.xml" "https://www.with-emacs.com/rss.xml" "https://irreal.org/blog/?feed=rss2")))
 '(etl-mode-etl-dir "~/Projects/OpenMail/OpenMail/etl/")
 '(etl-mode-hostname "laptop")
 '(etl-mode-slack-user "pierre")
 '(evil-insert-state-modes
   (quote
    (term-mode erc-mode eshell-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode wdired-mode)))
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-golangci-lint-tests t)
 '(flycheck-popup-tip-error-prefix ">> ")
 '(git-gutter+-hide-gutter t)
 '(global-command-log-mode t)
 '(global-git-gutter+-mode t)
 '(hl-paren-background-colors (quote nil))
 '(hl-paren-colors
   (quote
    ("red2" "DarkOrange2" "gold2" "chartreuse2" "DarkSlateGray2" "SlateBlue2")))
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
 '(org-capture-templates
   (quote
    (("w" "Add website entry" entry
      (file "~/org/websites.org")
      "* %a :website:

%U %?

%:initial")
     ("t" "Todo" entry
      (file+headline "~/org/tasks.org" "Tasks")
      "* TODO %?
:PROPERTIES:
:Added: %U
:link: %a
:END:

#+BEGIN_EXAMPLE
%i
#+END_EXAMPLE
"))))
 '(org-default-notes-file "~/org/notes")
 '(org-edit-src-content-indentation 0)
 '(org-jira-download-dir "~/Downloads/jira")
 '(org-special-ctrl-a/e t)
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-tab-acts-natively t)
 '(org-src-window-setup (quote current-window))
 '(picasm-assembler-program (quote mpasmx))
 '(picasm-db-file "~/.emacs.d/straight/repos/picasm/picasm-db.el")
 '(picasm-gpasm-program "gpasm")
 '(picasm-includes
   (quote
    ("." "/Applications/microchip/mplabx/v5.20/mpasmx/")))
 '(picasm-mpasmx-harness-dir "~/.emacs.d/straight/repos/picasm/")
 '(picasm-mpasmx-program "/Applications/microchip/mplabx/v5.20/mpasmx/mpasmx")
 '(picasm-mplinkx-program "/Applications/microchip/mplabx/v5.20/mpasmx/mplink")
 '(picasm-pk2cmd-program "~/Projects/pic-radio/bin/pk2cmd")
 '(picasm-pk2devicefile "~/Projects/pic-radio/bin/")
 '(picasm-require-comment nil)
 '(picasm-show-assembler-output t)
 '(picasm-use-default-keybindings nil)
 '(pyenv-mode t)
 '(pytest-cmd-flags "-x -s -vv")
 '(safe-local-variable-values
   (quote
    ((eval setenv "OVERRIDE_CS_LOCAL" "postgres://timi:postgres@localhost:5432/postgres")
     (eval setenv "OVERRIDE_CS_POSTGRES_TESTING" "postgres://timi:postgres@localhost:5432/postgres"))))
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-flyspell text-mode-hook-identify)))
 '(wdired-allow-to-change-permissions t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#202020" :foreground "#e2e2e5" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Inconsolata"))))
 '(company-scrollbar-bg ((t (:background "#6080a0"))))
 '(company-scrollbar-fg ((t (:background "#7090ff"))))
 '(company-tooltip ((t (:background "#2e5077"))))
 '(company-tooltip-annotation ((t nil)))
 '(company-tooltip-common ((t (:foreground "#d73c3f"))))
 '(company-tooltip-common-selection ((t (:foreground "#921e20"))))
 '(company-tooltip-selection ((t (:background "#ff9642" :foreground "#202020"))))
 '(diff-added ((t (:inherit ediff-even-diff-B))))
 '(diff-changed ((t (:inherit ediff-even-diff-C))))
 '(diff-refine-added ((t (:inherit ediff-fine-diff-B))))
 '(diff-refine-changed ((t (:inherit ediff-fine-diff-C))))
 '(diff-refine-removed ((t (:inherit ediff-fine-diff-A))))
 '(diff-removed ((t (:inherit ediff-even-diff-A))))
 '(ediff-current-diff-C ((t (:background "#554433"))))
 '(ediff-even-diff-A ((t (:background "#553333"))))
 '(ediff-even-diff-Ancestor ((t (:background "#004151"))))
 '(ediff-even-diff-B ((t (:background "#335533"))))
 '(ediff-even-diff-C ((t (:background "#5a442e"))))
 '(ediff-fine-diff-A ((t (:background "#46150f"))))
 '(ediff-fine-diff-B ((t (:background "#0f4615"))))
 '(ediff-fine-diff-C ((t (:background "#46310f"))))
 '(ediff-odd-diff-A ((t (:background "#553333"))))
 '(ediff-odd-diff-Ancestor ((t (:background "#004151"))))
 '(ediff-odd-diff-B ((t (:background "#335533"))))
 '(ediff-odd-diff-C ((t (:background "#5a442e"))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :underline t))))
 '(eyebrowse-mode-line-active ((t (:inherit mode-line-emphasis :inverse-video t))))
 '(font-lock-warning-face ((t (:background "#202020" :foreground "#ff6523"))))
 '(git-gutter+-added ((t (:inherit font-lock-comment-face :weight bold))))
 '(git-gutter+-deleted ((t (:inherit font-lock-comment-face :weight bold))))
 '(git-gutter+-modified ((t (:inherit font-lock-comment-face :weight bold))))
 '(magit-diff-context-highlight ((t (:background "#312C33" :foreground "grey70"))))
 '(magit-diff-file-heading ((t (:background "#794214" :weight bold))))
 '(magit-diff-file-heading-highlight ((t (:inherit magit-section-highlight :background "#a55a1c"))))
 '(magit-diff-hunk-heading ((t (:background "#113f67" :foreground "grey90" :weight bold))))
 '(magit-diff-hunk-heading-highlight ((t (:background "#38598b"))))
 '(mu4e-view-body-face ((t (:background "gray10"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :background "#102D3F" :foreground "#3A86B4" :slant normal))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :slant italic))))
 '(vertical-border ((t (:foreground "gray23")))))
