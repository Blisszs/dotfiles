(use-package exwm
  :straight t
  :config
  (require 'exwm-config)
  (server-start)
  (setq exwm-workspace-number 1)

  ;;tray
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  ;; exwm binds
  (exwm-input-set-key (kbd "s-r") #'exwm-reset)
  (exwm-input-set-key (kbd "s-x") #'exwm-workspace-delete)
  (exwm-input-set-key (kbd "s-w") #'exwm-workspace-swap)
  (exwm-input-set-key (kbd "s-Q") 'kill-current-buffer)
  (exwm-input-set-key (kbd "s-b") 'exwm-workspace-switch-to-buffer)

  ;; simulation keys the emacs way inside X programs 
  (exwm-input-set-simulation-keys
   '(
     ;; movement
     ([?\C-b] . left)
     ([?\M-b] . C-left)
     ([?\C-f] . right)
     ([?\M-f] . C-right)
     ([?\C-p] . up)
     ([?\C-n] . down)
     ([?\C-a] . home)
     ([?\C-e] . end)
     ([?\M-v] . prior)
     ([?\C-v] . next)
     ([?\C-d] . delete)
     ([?\C-k] . (S-end delete))
     ;; cut/paste
     ([?\C-w] . ?\C-x)
     ([?\M-w] . ?\C-c)
     ([?\C-y] . ?\C-v)
     ;; search
     ([?\C-s] . ?\C-f)))

  ;; automaticly binds super + number for all desktops
  (setq exwm-workspace-index-map
	(lambda (index) (number-to-string (1+ index))))

  (dotimes (i 10)
    (exwm-input-set-key (kbd (format "s-%d" i))
			`(lambda ()
			   (interactive)
			   (exwm-workspace-switch-create (1- ,i)))))

  (dotimes (i 10)
    (exwm-input-set-key (kbd (format "C-s-%d" i))
			`(lambda ()
			   (interactive)
			   (exwm-workspace-move-window (1- ,i)))))

  ;; update the X11 window and class name
  (add-hook 'exwm-update-class-hook
	    (lambda ()
	      (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
			  (string= "gimp" exwm-instance-name))
		(exwm-workspace-rename-buffer exwm-class-name))))

  (add-hook 'exwm-update-title-hook
	    (lambda ()
	      (when (or (not exwm-instance-name)
			(string-prefix-p "sun-awt-X11-" exwm-instance-name)
			(string= "gimp" exwm-instance-name))
		(exwm-workspace-rename-buffer exwm-title))))


  ;; program launcher (in the event of dmenu not working)
  (exwm-input-set-key (kbd "s-&")
		      (lambda (command)
			(interactive (list (read-shell-command "$ ")))
			(start-process-shell-command command nil command)))

  )

(use-package dmenu
  :straight t
  :config
  (exwm-input-set-key (kbd "s-SPC") 'dmenu))

(exwm-enable)
