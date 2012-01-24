;;User information
(setq user-full-name "My Name")
(setq user-mail-address "myname@gmail.com")

;;Using aspectj-mode
;;(require 'aspectj-mode)

;;Using ropemacs
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

;;Using line-num mode
;; (require 'linum)
;; (global-linum-mode 1)
;; (setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) 
;; 														(concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;;Using xcscope in emacs
(require 'xcscope)

;; using matlab-mode
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq matlab-indent-function-body t)  ; if you want function bodies indented
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 76))		; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
  '())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
;; (add-to-list 'load-path "/etc/emacs23/site-start.d/")
;; (load-library "matlab-load")
;; (require 'matlab-load)

;;Setting Doxymacs mode
(require 'doxymacs)
(add-hook 'c-mode-common-hook'doxymacs-mode)

;; (require 'w3m-load)
;; (require 'mime-w3m)

;;Customized syntax highlighting colors
;(set-foreground-color "#ffffff")
;(set-background-color "#000000")
;(set-cursor-color "#ffffff")
;(custom-set-variables '(load-home-init-file t t))

;;Setting AUCTex mode
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)

;;Diable back up files option
(setq make-backup-files nil)

;;Display time options
(setq display-time t
	  display-time-24hr-format t)
(display-time)

;;Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)

;;Keyboard scroll one line at a time
;;(setq scroll-step 1)

;;Show column number
(column-number-mode t)

;;Setting Language Environment
;;(set-language-environment 'UTF-8)
;; (set-language-environment 'euc-kr)
;; (modify-coding-system-alist 'file "\\.tex\\'" 'euc-kr)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))

;; Add .fx to c-mode
;; Add .h to c++-mode
(add-to-list 'auto-mode-alist '("\\.fx\\'" . c++-mode))		;; HLSL shader source code
(add-to-list 'auto-mode-alist '("\\.cl\\'" . c++-mode))		;; OpenCL source code
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))		;; CUDA source code
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c++-mode))	;; OpenGL shader source code
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;Using [F5] to refresh file list
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))
(global-set-key [f5] 'refresh-file)
(global-set-key [f9] 'compile)

;;Setting startup screen mode
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "evince %o") ("^html?$" "." "netscape %o"))))
 '(column-number-mode t)
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; This is the logic, and can be used in a program.  The other
;; functions use this interactively in various ways.
(defun wc-non-interactive (start end)
  "Count the number of words in the current region."
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (count-matches "\\sw+"))))
;;;###autoload
(defun count-words-region (start end)
  "Display number of words in the region."
  (interactive "r")
  (message (concat "The current region contains "
				      (number-to-string
					       (wc-non-interactive start end))
					     " words.")))


;;-------------------------------------------------------
;; C/C++ mode fix
(defun c++-mode-fix ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
		 ;(let ((file (file-name-nondirectory buffer-file-name)))
		 ;(let ((file (file-name-sans-extension buffer-file-name)))
		 (let ((file (file-name-sans-extension file-name-nodirectory buffer-file-name)))
           (concat "g++ -Wall" file))
		 )
	)
  (setq c++-empty-arglist-indent 4)
  )
(add-hook 'c++-mode-hook 'c++-mode-fix)

(defun c-mode-common-fix ()
  (setq tab-width 4)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-tab-always-indent t)
  (setq c-indent-level 4)
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset -4)
  (setq c-label-offset -4)
  (setq indent-tabs-mode t))
(add-hook 'c-mode-common-hook 'c-mode-common-fix)

;;-------------------------------------------------------
;; Python support
(defun python-mode-fix ()
  (setq py-smart-indentation nil
        py-indent-offset 4
        tab-width 4
        indent-tabs-mode nil
        current-language-environment "UTF-8"
        )
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
         (let ((file (file-name-nondirectory buffer-file-name)))
           (concat "python " file))))
  )
(add-hook 'python-mode-hook 'python-mode-fix)
