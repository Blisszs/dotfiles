(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

(require 'org)
(org-babel-load-file
 (expand-file-name "emacs.org"
                   user-emacs-directory))

;;; config
;
;;;dired
;(add-hook 'dired-mode-hook 'dired-hide-details-mode)
;
;;; random variables
;(setq vc-follow-symlinks t)
;(setq gc-cons-threshold 100000000) ;; for lsp
;(setq read-process-output-max (* 1024 1024)) ;; for lsp
;
;;; unused keybinds
;
;(global-unset-key "\C-z")
;
;;; Colortheme & display
;
;(use-package jazz-theme
;  :ensure t
;  :config (load-theme 'jazz t))
;(menu-bar-mode -1)
;(tool-bar-mode -1)
;(scroll-bar-mode -1)
;
;;; Font
;
;(set-face-attribute 'default nil :font "terminus-12")
;
;;; line wrapping
;
;(global-visual-line-mode 1)
;
;;; highlight parentheses
;
;(show-paren-mode 1)
;
;;; backup setting
;
;(setq
; backup-by-copying t      ; don't clobber symlinks
; backup-directory-alist
;  '(("." . "~/.backups/"))    ; don't litter my fs tree
; delete-old-versions t
; kept-new-versions 6
; kept-old-versions 2
; version-control t)       ; use versioned backups
;
;;; autoswitch to new window after split
;
;(defadvice split-window (after move-point-to-new-window activate)
;"Moves the point to the newly created window after splitting."
;(other-window 1))
;
;;; parentheses settings
;
;(electric-pair-mode 1)
;
;;; multiple cursors
;
;(use-package multiple-cursors
;  :ensure t)
;
;(global-set-key (kbd "C-c c")
;		(defhydra cqql-multiple-cursors-hydra (:hint nil)
;  "
;     ^Up^            ^Down^        ^Miscellaneous^
;----------------------------------------------
;[_p_]   Next    [_n_]   Next    [_l_] Edit lines
;[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
;[_M-p_] Unmark  [_M-n_] Unmark  [_q_] Quit"
;  ("l" mc/edit-lines :exit t)
;  ("a" mc/mark-all-like-this :exit t)
;  ("n" mc/mark-next-like-this)
;  ("N" mc/skip-to-next-like-this)
;  ("M-n" mc/unmark-next-like-this)
;  ("p" mc/mark-previous-like-this)
;  ("P" mc/skip-to-previous-like-this)
;  ("M-p" mc/unmark-previous-like-this)
;  ("q" nil)))
;
;
;;; ace-jump-mode
;
;(use-package ace-jump-mode
;  :ensure t
;  :bind ("C-c SPC" . ace-jump-mode))
;
;;; ivy
;
;(use-package ivy
;  :ensure t
;  :config
;  (ivy-mode 1))
;
;(use-package counsel
;  :ensure t
;  :after ivy
;  :config
;  (counsel-mode 1))
;
;;; git client
;
;(use-package magit
;  :ensure t)
;
;;; flycheck
;(use-package flycheck
;  :ensure t
;  :hook (lsp-mode . flycheck-mode))
;
;
;;; snippets
;
;(use-package yasnippet
;  :ensure t
;  :hook (lsp-mode . yas-minor-mode))
;
;;; completion framework
;
;(use-package company
;  :ensure t
;  :bind (:map company-active-map
;	      ("<tab>" . company-complete-selection))
;  :hook (lsp-mode . company-mode)
;  :custom
;  (company-backends '(company-capf))
;  :init
;  (setq company-idle-delay 0)
;  (setq company-minimum-prefix-length 2)
;  (setq company-require-match 'never))
;
;
;;; eglot / language server
;
; (use-package lsp-mode
;   :ensure t
;   :hook ((c++-mode c-mode) . lsp)
;   :config
;   (setq lsp-prefer-capf t))
;
;;; hydra
;
;(use-package hydra
;  :ensure t)
;
;;; mpd frontend
;
;(use-package simple-mpc
;  :ensure t
;  :bind ("C-c m" . simple-mpc)
;  :config
;  (setenv "MPD_HOST" "127.0.0.1")
;  (setenv "MPD_PORT" "6601"))
;
