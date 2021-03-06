;; install and load packages via https://github.com/dimitri/el-get
;; (el-get 'sync
;;         '(go-mode
;;           go-autocomplete
;;           go-def
;;           go-flymake
;;           go-imports
;;           go-lint))
;;
;; Sadly el-get was blowing up while trying to run 'go get' and 'go build'
;; Try as I may to fix this, I was not able to, so once the packages were
;; loaded and compiled .. and the go code was fetched either from github or code.google.com
;; I just turned it off and replaced it with a series of load-path and requires
;; commands below


(setenv "GOPATH" "/Users/juanman2/go")

(add-to-list 'load-path "~/.emacs.d/el-get/go-mode")
(require 'go-mode)

(add-to-list 'load-path "~/.emacs.d/el-get/go-autocomplete/emacs")
(require 'go-autocomplete)

(add-to-list 'load-path "~/.emacs.d/el-get/oracle")
(add-to-list 'load-path "~/.emacs.d/el-get/go-def/deps/src/github.com/golang/lint/misc/emacs/")
(add-to-list 'load-path "~/.emacs.d/el-get/go-flymake")
(require 'go-flymake)

;;
;;
;;
(load "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
(add-hook 'go-mode-hook 'go-oracle-mode)


;; ignore 'go test -c' files
(push ".test" completion-ignored-extensions)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (setq whitespace-line-column 120)
                          (setq default-tab-width 2)))

(add-hook 'go-mode-hook
          (lambda ()
            (idle-highlight-mode t)
            (local-set-key (kbd "C-c o") 'godef-jump)
            (local-set-key (kbd "C-c d") 'godef-describe)
            (local-set-key (kbd "C-c l") 'golint)
            (local-set-key (kbd "C-c a") 'go-test-all)
            (local-set-key (kbd "C-c m") 'go-test-module)
            (local-set-key (kbd "C-c .") 'go-test-one)))

(defun go-build ()
  "compile project"
  (interactive)
  (compile "go build"))

(defun go-test-all ()
  "test project"
  (interactive)
    (compile "go test -v"))

(defun go-test-one ()
  "run a single test, closest to current point"
  (interactive)
    (compile (concat "go test -v -test.run " (go-current-test))))

(defun go-test-module ()
  "test module"
  (interactive)
    (compile (concat "go test -v -test.run '" (go-grep-tests) "'")))

(defun go-chk ()
  "gocheck project"
  (interactive)
    (compile "go test -gocheck.vv"))

(defun go-run ()
  "go run current buffer"
  (interactive)
    (compile (concat "go run " buffer-file-name)))

(defun go-current-test ()
  (save-excursion
    (re-search-backward
     "^func \\(Test[a-zA-Z0-9_]+\\)" nil t)
    (buffer-substring-no-properties (match-beginning 1) (match-end 1))))

;;; generate regex for all Tests in the current buffer
;;; note that go test has a '-file' flag that does not work as expected
(defun go-grep-tests ()
  (car (process-lines "bash" "-c"
                      (concat "egrep -o 'func Test[^(]+' " buffer-file-name " | awk '{print $2}' | paste -sd '|'"))))

;; FIXME: need to call go-oracle-set-scope
;; (defun go-set-ora ()
;;  (car (process-lines "bash" "-c"
;;                      (concat "find . -name "*.go" | xargs awk '/^package/{ print $2 }' | sort -u"))))
