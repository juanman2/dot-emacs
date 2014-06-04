((ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (autopair status "installed" recipe
           (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (buffer-move status "installed" recipe
              (:name buffer-move :description "Swap buffers without typing C-x b on each window" :type emacswiki :features buffer-move))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :load "el-get.el"))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (flymake-cursor status "installed" recipe
                 (:name flymake-cursor :type github :pkgname "illusori/emacs-flymake-cursor" :description "displays flymake error msg in minibuffer after delay (illusori/github)" :website "http://github.com/illusori/emacs-flymake-cursor"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (go-autocomplete status "installed" recipe
                  (:name go-autocomplete :description "An autocompletion daemon for the Go programming language" :type github :pkgname "nsf/gocode" :depends
                         (auto-complete)
                         :features
                         (go-autocomplete)
                         :build
                         (("go" "build" "-o" "bin/gocode"))
                         :build/windows-nt
                         (("go" "build" "-o" "gocode.exe"))
                         :load-path
                         ("emacs")
                         :prepare
                         (progn
                           (add-to-list 'exec-path
                                        (el-get-package-directory "go-autocomplete/bin")))))
 (go-def status "required" recipe nil)
 (go-flymake status "installed" recipe
             (:name go-flymake :description "Flymake for the Go programming language" :type github :pkgname "dougm/goflymake" :features
                    (go-flymake)
                    :build
                    (("go" "build" "-o" "bin/goflymake"))
                    :prepare
                    (progn
                      (add-to-list 'exec-path
                                   (el-get-package-directory "go-flymake/bin")))))
 (go-imports status "required" recipe nil)
 (go-mode status "installed" recipe
          (:name go-mode :description "Major mode for the Go programming language" :type github :pkgname "dominikh/go-mode.el"))
 (idle-highlight-mode status "installed" recipe
                      (:name idle-highlight-mode :description "Idle Highlight Mode." :website "https://github.com/nonsequitur/idle-highlight-mode" :type github :pkgname "nonsequitur/idle-highlight-mode"))
 (json status "installed" recipe
       (:name json :description "JavaScript Object Notation parser / generator" :type http :builtin "23" :url "http://edward.oconnor.cx/elisp/json.el" :features json))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (railscasts-theme status "installed" recipe
                   (:name railscasts-theme :description "Railscasts color theme for GNU Emacs" :website "https://github.com/itiut/railscasts-theme" :type github :pkgname "itiut/railscasts-theme" :minimum-emacs-version 24 :post-init
                          (add-to-list 'custom-theme-load-path default-directory))))
