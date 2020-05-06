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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company yasnippet flycheck magit magi counsel ace-jump-mode smartparens use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; config

;; Colortheme & display

(use-package darktooth-theme
  :ensure t
  :config (load-theme 'darktooth t))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 0)

;; Font

(set-face-attribute 'default nil :font "terminus-12")

;; line wrapping

(global-visual-line-mode 1)

;; highlight parentheses

(show-paren-mode 1)

;; backup setting

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
  '(("." . "~/.backups/"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; autoswitch to new window after split

(defadvice split-window (after move-point-to-new-window activate)
"Moves the point to the newly created window after splitting."
(other-window 1))

;; parentheses settings

(use-package smartparens
:ensure t
:config (smartparens-global-mode))

;; ace-jump-mode

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c SPC" . ace-jump-mode))

;; ivy

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode 1))

;; git client

(use-package magit
  :ensure t)

;; flycheck
(use-package flycheck
  :ensure t)

;; snippets

(use-package yasnippet
  :ensure t)

;; completion framework

(use-package company
  :ensure t
  :bind (:map company-active-map
	      ("<tab>" . company-complete-common-or-cycle)
	      ("<backtab>" . company-select-previous))
  :init
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match 'never))

;; eglot / language server

(use-package eglot
  :ensure t)

;; c/c++

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

