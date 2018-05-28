;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     git
     (haskell
      :variables
      haskell-completion-backend 'dante
      )
     haskell-ext
     helm
     html
     (markdown :variables markdown-live-preview-engine 'vmd)
     org
     org-ext
     osx
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     themes-megapack
     version-control
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     (tidal :location (recipe :fetcher github :repo "tonyday567/Tidal"))
    )

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(
     gnus
     ox-pandoc
     helm-flycheck
     flycheck-pos-tip
     evil-unimpaired
     haskell-cabal
     yasnippet
     ggtags
     haskell-snippets
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 60
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default nil)
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((projects . 10) agenda (recents . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(farmhouse-dark
                         farmhouse-light
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro" ;;"M+ 1m"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; fixme: add to haskell-ext
  (bind-key* "M-n" 'flycheck-next-error)
  (bind-key* "M-p" 'flycheck-previous-error)
  ;; (spacemacs/add-flycheck-hook 'literate-haskell-mode)

  (evil-leader/set-key
    "wa" 'default-frame
    "wA" 'max-frame
    "we" 'default-right-frame
    "wT" 'toggle-frame-size)

  (defun default-frame ()
    (interactive)
    (cond
     ((string-equal system-type "windows-nt") ; Microsoft Windows
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 10)
        (set-frame-parameter (selected-frame) 'left 6)
        (set-frame-parameter (selected-frame) 'height 40)
        (set-frame-parameter (selected-frame) 'width 120)))
     ((string-equal system-type "darwin") ; Mac OS X
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 20)
        (set-frame-parameter (selected-frame) 'left 1)
        (set-frame-parameter (selected-frame) 'height 47)
        (set-frame-parameter (selected-frame) 'width 85)))
     ((string-equal system-type "gnu/linux") ; linux
      (progn
        (message "Linux")))))

  (defun default-right-frame ()
    (interactive)
    (cond
     ((string-equal system-type "windows-nt") ; Microsoft Windows
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 10)
        (set-frame-parameter (selected-frame) 'left 2000)
        (set-frame-parameter (selected-frame) 'height 60)
        (set-frame-parameter (selected-frame) 'width 120)))
     ((string-equal system-type "darwin") ; Mac OS X
      (progn
        (set-frame-parameter (selected-frame) 'fullscreen nil)
        (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil)
        (set-frame-parameter (selected-frame) 'top 20)
        (set-frame-parameter (selected-frame) 'left 735)
        (set-frame-parameter (selected-frame) 'height 47)
        (set-frame-parameter (selected-frame) 'width 85)))
     ((string-equal system-type "gnu/linux") ; linux
      (progn
        (message "Linux")))))

  (defun max-frame ()
    (interactive)
    (if t
        (progn
          (set-frame-parameter (selected-frame) 'fullscreen 'fullboth)
          (set-frame-parameter (selected-frame) 'vertical-scroll-bars nil)
          (set-frame-parameter (selected-frame) 'horizontal-scroll-bars nil))
      (set-frame-parameter (selected-frame) 'top 26)
      (set-frame-parameter (selected-frame) 'left 2)
      (set-frame-parameter (selected-frame) 'width
                           (floor (/ (float (x-display-pixel-width)) 9.15)))
      (if (= 1050 (x-display-pixel-height))
          (set-frame-parameter (selected-frame) 'height
                               (if (>= emacs-major-version 24)
                                   66
                                 55))
        (set-frame-parameter (selected-frame) 'height
                             (if (>= emacs-major-version 24)
                                 75
                               64)))))

  (defun toggle-frame-size ()
    (interactive)
    (if (> (cdr (assq 'width (frame-parameters))) 100)
        (min-frame)
      (max-frame)))

  (default-frame)

  (setenv "TIDAL_TEMPO_PORT" "9160")
  (setq tidal-interpreter "stack")
  (setq tidal-interpreter-arguments (list "ghci" "--with-ghc=intero"))

  (defun default-face-attribute ()
    (interactive)
    (cond
     ((string-equal system-type "windows-nt") ; Microsoft Windows
      (progn
        (set-face-attribute
         'default nil
         :family "Source Code Pro"
         :height 140
         :weight 'normal
         :width 'normal)))
     ((string-equal system-type "darwin") ; Mac OS X
      (progn
        (set-face-attribute
         'default nil
         ;; :family "Source Code Pro"
         :family "M+ 1m"
         :height 140
         :weight 'normal
         :width 'normal)))
     ((string-equal system-type "gnu/linux") ; linux
      (progn
        (message "Linux")))))

  (default-face-attribute)


  (set-face-attribute
   'default nil
   ;; :family "Source Code Pro"
   :family "M+ 1m"
   :height 140
   :weight 'normal
   :width 'normal)

  
  (spacemacs/toggle-spelling-checking-off)

  ;; fixme
  (setenv "PATH"
          (concat
           (getenv "PATH")
           ";C:\\Users\\ajdayz\\AppData\\Local\\Programs\\Git\\usr\\bin")))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" default)))
 '(dired-auto-revert-buffer t)
 '(evil-escape-key-sequence "jk")
 '(flycheck-display-errors-function (quote flycheck-display-error-messages))
 '(flycheck-pos-tip-mode nil)
 '(haskell-font-lock-symbols t)
 '(haskell-hayoo-url "http://hayoo.fh-wedel.de/?query=%s")
 '(haskell-hoogle-url "https://www.stackage.org/lts/hoogle/?q=%s")
 '(haskell-indent-spaces 2)
 '(haskell-indentation-layout-offset 2)
 '(haskell-indentation-left-offset 2)
 '(haskell-indentation-starter-offset 2)
 '(haskell-indentation-where-post-offset 2)
 '(haskell-indentation-where-pre-offset 2)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(ido-auto-merge-delay-time 4)
 '(org-M-RET-may-split-line (quote ((headline . t))))
 '(org-adapt-indentation nil)
 '(org-agenda-compact-blocks t)
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODO's"
      ((agenda ""
               ((org-agenda-overriding-header "today")))
       (tags "REFILE"
             ((org-agenda-overriding-header "refile me pls")
              (org-tags-match-list-sublevels nil)))
       (todo "+TODO='NEXT'" nil)
       (todo "+TODO='TODO'" nil))
      nil)
     ("z" "draft full agenda"
      ((agenda ""
               ((org-agenda-overriding-header "today")))
       (tags "REFILE"
             ((org-agenda-overriding-header "refiles")))
       (tags "TODO=\"TODO\"+SCHEDULED>\"<today>\""
             ((org-agenda-overriding-header "scheduled")))
       (tags "TODO=\"TODO\"-SCHEDULED<=\"<today>\"-SCHEDULED>\"<today>\""
             ((org-agenda-overriding-header "the rest")))
       (tags "TODO=\"DONE\""
             ((org-agenda-overriding-header "done and dusted"))))
      nil nil)
     ("x" "sandpit" tags "+SCHEDULED>=\"<2008-10-11>\"" nil))))
 '(org-agenda-diary-file (quote diary-file))
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-files
   (quote
    ("~/org/strategy.org" "~/org/econ.org" "~/org/cat.org" "~/org/nsteel.org" "~/org/haskell.org" "~/org/sys.org" "~/org/stuff.org" "~/org/refile.org" "~/org/life.org" "~/org/emacs.org" "~/org/bugz.org")))
 '(org-agenda-include-diary nil)
 '(org-agenda-ndays 1)
 '(org-agenda-persistent-filter t)
 '(org-agenda-scheduled-leaders (quote ("" "S%d: ")))
 '(org-agenda-skip-additional-timestamps-same-entry t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-timestamp-if-done t)
 '(org-agenda-skip-unavailable-files t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up todo-state-up user-defined-up priority-down effort-up category-keep)
     (todo category-up priority-down effort-up)
     (tags category-up priority-down effort-up)
     (search category-keep))))
 '(org-agenda-span (quote day))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-tags-column -102)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-text-search-extra-files nil)
 '(org-agenda-use-time-grid nil)
 '(org-agenda-window-setup (quote current-window))
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (shell . t)
     (dot . t)
     (org . t)
     (js . t)
     (haskell \.t))))
 '(org-babel-results-keyword "results")
 '(org-capture-bookmark nil)
 '(org-capture-templates
   (quote
    (("r" "refile" entry
      (file "~/org/refile.org")
      "* TODO %?
")
     ("z" "bugz" entry
      (file+headline "~/org/bugz.org" "bugz!")
      "* TODO %?
%a"))))
 '(org-clock-clocked-in-display (quote mode-line))
 '(org-clock-idle-time 10)
 '(org-completion-use-ido t)
 '(org-confirm-babel-evaluate nil)
 '(org-confirm-elisp-link-function nil)
 '(org-crypt-disable-auto-save nil)
 '(org-crypt-key "F0B66B40")
 '(org-cycle-global-at-bob t)
 '(org-cycle-separator-lines 0)
 '(org-deadline-warning-days 5)
 '(org-edit-src-content-indentation 0)
 '(org-enable-priority-commands nil)
 '(org-enforce-todo-dependencies t)
 '(org-entities-user
   (quote
    (("hardbreak" "\\\\" nil "" "" "" "")
     ("greytext" "\\\\color{greytext}" nil "" "" "" ""))))
 '(org-export-babel-evaluate nil)
 '(org-export-copy-to-kill-ring t)
 '(org-export-date-timestamp-format "%Y-%m-%d")
 '(org-export-html-inline-images t)
 '(org-export-html-link-home "www.scarcecapital.com")
 '(org-export-html-postamble nil)
 '(org-export-html-style "")
 '(org-export-html-style-extra "")
 '(org-export-html-style-include-default nil)
 '(org-export-html-xml-declaration
   (quote
    (("html" . "")
     ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
     ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))
 '(org-export-use-babel nil)
 '(org-export-with-drawers nil)
 '(org-export-with-tags nil)
 '(org-export-with-timestamps nil)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-footnote-section nil)
 '(org-from-is-user-regexp "\\<tony day\\>")
 '(org-hide-leading-stars nil)
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-htmlize-output-type (quote css))
 '(org-html-postamble nil)
 '(org-image-actual-width nil)
 '(org-insert-heading-respect-content nil)
 '(org-latex-to-pdf-process
   (quote
    ("xelatex -interaction nonstopmode -output-directory %o %f" "xetex %f")))
 '(org-link-abbrev-alist (quote (("google" . "http://www.google.com/search?q="))))
 '(org-log-done nil)
 '(org-log-into-drawer "LOGBOOK")
 '(org-modules (quote (org-id org-info)))
 '(org-outline-path-complete-in-steps nil)
 '(org-provide-todo-statistics nil)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-target-verify-function nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-refile-use-outline-path (quote file))
 '(org-remove-highlights-with-change nil)
 '(org-return-follows-link t)
 '(org-show-notification-handler (quote alert))
 '(org-src-fontify-natively t)
 '(org-src-lang-modes
   (quote
    (("plantuml" . fundamental)
     ("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . graphviz-dot)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("screen" . shell-script)
     ("R" . R)
     ("haskell" . haskell))))
 '(org-src-preserve-indentation t)
 '(org-startup-folded t)
 '(org-startup-indented t)
 '(org-support-shift-select t)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (tidal multiple-cursors hasky-extensions idris-mode prop-menu zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox spinner osx-trash osx-dictionary orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum linum-relative link-hint light-soap-theme less-css-mode launchctl jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide hydra hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein skewer-mode request-deferred websocket request deferred js2-mode simple-httpd dumb-jump f s dracula-theme django-theme diminish diff-hl darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web web-completion-data company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup farmhouse-theme)))
 '(paradox-automatically-star t)
 '(paradox-execute-asynchronously t t)
 '(paradox-github-token "9c0337a9d7ffbfa53d06bf294278dc777a2b77c9")
 '(projectile-known-projects-file "~/.emacs.d/.cache/projectile-bookmarks.eld")
 '(reb-re-syntax (quote read))
 '(recentf-save-file "~/.emacs.d/.cache/recentf")
 '(tags-add-tables nil)
 '(tramp-persistency-file-name "~/.emacs.d/.cache/tramp" t)
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9")
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0)))))
 '(yas-fallback-behavior (quote call-other-command))
 '(yas-indent-line (quote nothing))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-dropdown-prompt)))
 '(yas-triggers-in-field t)
 '(yas-wrap-around-region t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
