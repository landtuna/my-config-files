(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-mozilla-program "firefox")
 '(c-offsets-alist (quote ((statement-cont . c-lineup-assignments))))
 '(case-fold-search t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(doxymacs-doxygen-dirs (quote (("^/home/wecuser/work/src" "/home/wecuser/work/docs/tagfile.xml" "file:///home/wecuser/work/docs/html"))))
 '(doxymacs-doxygen-style "C++")
 '(dvc-tips-enabled nil)
 '(js-indent-level 2)
 '(explicit-bash-args (quote ("--noediting" "--login" "-i")))
 '(global-auto-composition-mode nil)
 '(global-auto-revert-mode t nil (autorevert))
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(iswitchb-case t)
 '(iswitchb-mode t nil (iswitchb))
 '(org-agenda-files (quote ("~/org/HWDDC.org")) t)
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode nil)
 '(user-full-name "Jim Hunziker")
 '(user-mail-address "jhunziker@bcisensors.com")
 '(visible-bell t)
 '(w3m-use-cookies t))

;

(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/share/emacs/site-lisp")

(defun my-c-mode-common-hook ()

  (c-toggle-hungry-state 1)

  (c-set-offset 'substatement-open 0)

  (auto-fill-mode))



(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



(global-set-key (read-kbd-macro "<C-;>") nil)



(defconst my-key-prefix    

  (kbd "C-;")

  "My prefix map keys")



(defvar my-map (lookup-key global-map my-key-prefix))

(unless (keymapp my-map)    ;not yet defined

  (setq my-map (make-sparse-keymap)))



(define-key global-map my-key-prefix my-map)



(define-key my-map (kbd "r") 'revert-buffer)

(define-key my-map (kbd "g") 'goto-line)

(define-key my-map (kbd "c") 'compile)

(define-key my-map (kbd "b") 'bury-buffer)


(fset 'yes-or-no-p 'y-or-n-p)



(defun yes-or-no-p (PROMPT)

  (beep)

  (y-or-n-p PROMPT))



(put 'upcase-region 'disabled nil)


(put 'narrow-to-region 'disabled nil)

(setq auto-mode-alist (cons '("\\.jsp\\'" . html-mode) auto-mode-alist))

;;(load "nxml-mode/rng-auto.el")



(setq auto-mode-alist
      
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
            
            auto-mode-alist))

(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

(server-start)
;(normal-erase-is-backspace-mode 1)
(prefer-coding-system 'utf-8)
;(require 'psvn)

(require 'doxymacs)

(add-hook 'c-mode-common-hook'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(add-to-list 'load-path "~/elisp/jxminor")
(autoload 'jxminor-mode-on "jx-mode" "" t)
(add-hook 'java-mode-hook 'jxminor-mode-on)
(add-hook
 'java-mode-hook
 '(lambda () "Treat Java 1.5 @-style annotations as comments."
    (setq c-comment-start-regexp "\\(@\\|/\\(/\\|[*][*]?\\)\\)")
    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))
;; (require 'mmm-mode)

;; (setq mmm-global-mode 'maybe)

;; (mmm-add-group 'jsp
;; 	       `((jsp-code
;; 		  :submode java-mode
;; 		  :match-face (("<%!" . mmm-declaration-submode-face)
;; 			       ("<%=" . mmm-output-submode-face)
;; 			       ("<%"  . mmm-code-submode-face))
;; 		  :front "<%[!=]?"
;; 		  :back "%>"
;; 		  :insert ((?% jsp-code nil  <at>  "<%"  <at>  " " _ " "  <at>  "%>"  <at> )
;; 			   (?! jsp-declaration nil  <at>  "<%!"  <at>  " " _ " "  <at>  "%>"  <at> )
;; 			   (?= jsp-expression nil  <at>  "<%="  <at>  " " _ " "  <at>  "%>"  <at> ))
;; 		  )
;; 		 (jsp-directive
;; 		  :submode text-mode
;; 		  :face mmm-special-submode-face
;; 		  :front "<% <at> "
;; 		  :back "%>"
;; 		  :insert ((? <at>  jsp-directive nil  <at>  "<% <at> "  <at>  " " _ " "  <at>  "%>"  <at> ))
;; 		  )))

;; (setq mmm-mode-ext-classes-alist nil)
;; (add-to-list 'mmm-mode-ext-classes-alist '(nil "\\.asp\\'" asp-code))
;; (add-to-list 'mmm-mode-ext-classes-alist '(nil "\\.jsp\\'" jsp-code))
;; (add-to-list 'mmm-mode-ext-classes-alist '(nil "\\.js\\'" html-js))

 
;(require 'mmm-auto)
; (setq mmm-global-mode 'maybe)
;(mmm-add-mode-ext-class nil "\\.jsp?\\'" 'jsp)

;(mmm-add-classes
; '((jsp
;    :submode java-mode
;    :front "<%"
;    :back "%>")))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(autoload 'longlines-mode
  "longlines.el"
  "Minor mode for automatically wrapping long lines." t)

(setq outline-minor-mode-prefix (kbd "C-c C-k"))

(setq number-outline-regexp "\\([0-9]+\\.\\)+")

(defun number-outline-level ()
  (save-excursion
    (looking-at outline-regexp)
    (let ((match (match-string 0))
          (counter 0))
      (dotimes (i (length match))
        (when (char-equal ?. (aref match i))
          (setq counter (1+ counter))))
      counter)))

(defun number-outline-minor-mode ()
  (interactive)
  (outline-minor-mode)
  (setq outline-regexp number-outline-regexp)
  (fset outline-level (symbol-function 'number-outline-level)))

(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(setq ansi-color-names-vector
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))
(add-to-list 'auto-mode-alist '("\\.wsgi$" . python-mode))

(load "~/elisp/haskell-mode-2.4/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(load-file "/usr/local/share/emacs/site-lisp/dvc/dvc-load.el")
(autoload 'd-mode "~/elisp/d-mode/d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;; org-mode settings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-agenda-files (list "~/org/HWDDC.org"))

(autoload 'lout-mode "lout-mode" "Major mode for editing Lout text" t)
(setq auto-mode-alist
      (append '(("\\.lout\\'" . lout-mode)) auto-mode-alist))

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  ...insert your code here...
  ...most commonly, your custom key bindings ...
  )
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(add-to-list 'auto-mode-alist '("\\.pde$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.proto$" . c++-mode))

;;(require 'ipython)
(put 'downcase-region 'disabled nil)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(add-to-list 'load-path "~/elisp/rust-mode")
(require 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))

;;(add-to-list 'load-path "~/elisp/evil")
;;(require 'evil)
;;(evil-mode 1)
