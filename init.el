(setq default-directory "~")

(defun load-dir (dir)
  (mapc 'load (directory-files dir t "^[^#].*el$")))

;;(setenv "GOPATH" "~/go")

(load-file "~/.emacs.d/el-get.el")
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-initialize)

(push (concat user-emacs-directory "bin") exec-path)

(load-file "~/.emacs.d/custom.el")
(load-dir (concat user-emacs-directory "custom/"))

;;(set-face-attribute 'default nil :family "Source Code Pro" :height 140 :weight 'normal)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (adwaita))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "#333")))))
