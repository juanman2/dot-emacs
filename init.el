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
