; The Emacs startup file ~/.emacs

(load "cc-mode")
(require 'paren)
(require 'magit)

;****************************************
;* Define the general look and feel
;****************************************
;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

(setq auto-fill-mode 1)
(set-face-attribute 'default nil :height 120)

(toggle-uniquify-buffer-names)
(set-frame-position (selected-frame) 200 30)

(set-frame-height (selected-frame) 60)
(set-frame-width (selected-frame) 80)

(setq x-select-enable-clipboard t)

(set-cursor-color "Black")
(set-mouse-color "dark blue")
(set-background-color "beige")       ; set the background color
(set-foreground-color "dark blue")       ; set the foreground color
(setq display-time-day-and-date t)  ; set the variable to display time
(display-time)                      ; call the display time routine

(setq scroll-step 1)                ; scroll line by line, dont jump
(setq next-line-add-newlines nil)   ; dont add new-lines at the end of buffer

(setq default-major-mode 'text-mode)
(setq-default fill-column 75)
(setq-default search-highlight t)
(setq-default comint-scroll-show-maximum-output t) ; show max output in shell mode

;Turn on the Font Lock
;Let Emacs to perform syntax highlight
(global-font-lock-mode t)
(setq-default font-lock-maximum-decoration t)
(font-lock-mode)

;****************************************
;* Define the short cut key
;****************************************
(global-set-key [home]      'beginning-of-line)
(global-set-key [end]       'end-of-line)
(global-set-key [f1]        'find-file)
(global-set-key [f2]        'write-file)
(global-set-key [f3]        'revert-buffer)
(global-set-key [f4]        'buffer-menu-other-window)
(global-set-key [f5]        'fixup-whitespace)
(global-set-key [f6]        'goto-line)
(global-set-key [f7]        'start-kbd-macro)
(global-set-key [f8]        'end-kbd-macro)
(global-set-key [f9]        'kill-ring-save)
(global-set-key [f10]       'save-buffer)
(global-set-key [f11]       'magit-status)
(global-set-key [f12]       'shell)
(global-set-key [C-home]    'beginning-of-buffer)
(global-set-key [C-end]     'end-of-buffer)
(global-set-key [pause]     'save-buffers-kill-emacs)

(global-set-key [C-f1]     'java-function-comment)
(global-set-key [C-f2]     'java-property-comment)
(global-set-key [C-f3]     'java-accessor-comment)
(global-set-key [C-f4]     'java-mutator-comment)
(global-set-key [C-f5]     'java-class-comment)
(global-set-key [C-f6]     'add-message-txt)
(global-set-key [C-f7]     'java-defmethod)

(setq tcl-mode-map (make-sparse-keymap))
(define-key tcl-mode-map [?}] 'tcl-electric-brace)
(define-key tcl-mode-map "\C-m" 'newline-and-indent)
(define-key c-mode-map "\C-m" 'newline-and-indent)

(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

(add-hook 'dired-load-hook
    (function (lambda ()
        (load "dired-x"))))

(add-hook 'f90-mode-hook 'turn-on-font-lock)
(add-hook 'fortran-mode-hook 'turn-on-font-lock)
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'lisp-mode-hook 'turn-on-font-lock)
(add-hook 'info-mode-hook 'turn-on-font-lock)
(add-hook 'dired-mode-hook 'turn-on-font-lock)
(add-hook 'shell-mode-hook 'turn-on-font-lock)
(add-hook 'tcl-mode-hook 'turn-on-font-lock)
(add-hook 'perl-mode-hook 'turn-on-font-lock)

(defun my-c-mode-hook()
    (turn-on-font-lock)
    (setq c-basic-offset 4)
    (c-set-offset 'case-label '*)
    (c-set-offset 'statement-case-open 0)
    (c-set-offset 'statement-case-intro '*)
;    (define-key c-mode-map "\C-m" 'newline-and-indent)
    )
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

; use % key to show the matching paren, like in vi mode
;
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching prenthesis if on parenthesis, otherwise insert %."
   (interactive "p")
   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
         ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
         (t (self-insert-command (or arg 1)))))

(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)

