;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS.

(use-modules (gnu) (gnu system nss)
	     ;;(nongnu packages linux)
	     )
(use-service-modules desktop xorg ssh)
(use-package-modules certs gnome openbox vim xorg fonts emacs llvm commencement cmake)


(operating-system
  (host-name "Navi")
  (timezone "Europe/Lisbon")
  (locale "en_US.utf8")
 ;; (kernel linux)
 ;; (firmware (list linux-firmware))

  ;; Choose US English keyboard layout.  The "altgr-intl"
  ;; variant provides dead keys for accented characters.
  (keyboard-layout (keyboard-layout "pt" "altgr-intl"))

  ;; Use the UEFI variant of GRUB with the EFI System
  ;; Partition mounted on /boot/efi.
  ;; (bootloader (bootloader-configuration
  ;;              (bootloader grub-efi-bootloader)
  ;;              (target "/boot/efi")))
  
  (bootloader (bootloader-configuration
		(bootloader grub-bootloader)
		(target "/dev/sda")))

  (file-systems (cons (file-system
                         (device (file-system-label "my-root"))
                         (mount-point "/")
                         (type "ext4"))
                      ;; (file-system
                        ;; (device "/dev/sda1")
                         ;;(mount-point "/boot/efi")
                         ;;(type "vfat")))
                 %base-file-systems))

  (users (cons (user-account
                (name "bliss")
                (comment "bliss")
                (group "users")
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video")))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (cons*   openbox ;; desktop
		     xrandr
		     setxkbmap
		     font-dejavu
		     arc-theme
		     ;; editors
		     vim
		     emacs
                     ;; for HTTPS access
                     nss-certs
		     ;; for development
		     cmake
		     llvm
		     gcc-toolchain
		     ;;libcxx
		     glibc
		     ;;libstdc++
		     clang
                     ;; for user mounts
		     gvfs
                     %base-packages))


  ;; Add GNOME and Xfce---we can choose at the log-in screen
  ;; by clicking the gear.  Use the "desktop" services, which
  ;; include the X11 log-in service, networking with
  ;; NetworkManager, and more.
  (services (append (list (service openssh-service-type (openssh-configuration (port-number 2222)))) %desktop-services)))

  ;; Allow resolution of '.local' host names with mDNS.
  ;; (name-service-switch %mdns-host-lookup-nss))
