
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; fix for elpa bad request
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; open symlink files without the prompt
(setq vc-follow-symlinks t)

;; loads the config file
(require 'org)
(org-babel-load-file
 (expand-file-name "dotemacs.org"
                   user-emacs-directory))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
