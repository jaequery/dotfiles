;; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa". "http://melpa.milkbox.net/packages/")
             )
(package-initialize)

;; global
(setq ns-command-modifier (quote meta)) ;; command as meta
(setq inhibit-startup-message t) ; disable startup screen
(setq auto-save-default nil) ; disable auto save
(defalias 'yes-or-no-p 'y-or-n-p) ; y/n prompts
(show-paren-mode t) ; show matching parenthesis
(setq delete-selection-mode t)
(setq transient-mark-mode t)
(setq backup-directory-alist '(("." . "~/.emacs.backups"))) ;; save backups to ~/.emacs.backups

;; delete trailing whitespace upon save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;;;; not in use  ;;;;;
;; show line number
;;(global-linum-mode t) ; show line number
;;(setq linum-format "%d ")
;;(setq backup-inhibited t) ; disable backup

;; web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jade\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("php"    . "\\.html\\'")
        ("php"    . "\\.php\\'")
        ("php"    . "\\.inc\\'")
        ("blade"  . "\\.blade\\."))
      )
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-style-padding 0)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-enable-current-element-highlight t)
  ;;   (setq web-mode-enable-heredoc-fontification t)
  (setq web-mode-disable-auto-pairing t)
  (local-set-key (kbd "RET") 'newline-and-indent)
  )
(add-hook 'web-mode-hook  'web-mode-hook)
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
               ))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-current-column-highlight t)

(add-hook 'php-mode-hook 'my-php-mode-hook)
(defun my-php-mode-hook ()
  "My PHP mode configuration."
  (setq indent-tabs-mode nil
        tab-width 4
                c-basic-offset 4))

;; autocomplete
;(require 'auto-complete-config)
;(ac-config-default)
;(setq ac-ignore-case nil)
;(add-to-list 'ac-modes 'enh-ruby-mode)
;(add-to-list 'ac-modes 'web-mode)

;; powerline theme
;;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;;(require 'powerline)

;; undo-tree (C-x u to show tree)
(require 'undo-tree)
(global-undo-tree-mode)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)
(setq ido-ignore-buffers '("^\*Messages\*"))
(setq ido-ignore-buffers '("^\*scratch\*"))
(setq ido-everywhere t)
(ido-mode t)
(defalias 'list-buffers 'ibuffer)
(ido-vertical-mode t)

;; escreen - tab manager
;;(load "escreen")
;;(escreen-install)

;; smex
;;(setq smex-save-file "~/.emacs.d/.cache/smex.save") ;; keep my ~/ clean
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

;;;;; shortcut commands ;;;;;

;; kill buffer
(global-set-key (kbd "C-M-k")
                '(lambda () (interactive)
                   (let (kill-buffer-query-functions) (kill-buffer))))

;; move between buffers
(defun next-user-buffer ()
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))
(global-set-key "\M-N" 'next-user-buffer)
(global-set-key "\M-P" 'previous-user-buffer)

;; join line
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Move more quickly
(global-set-key (kbd "C-M-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-M-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

;; magit
(global-set-key (kbd "M-G")  'magit-status)

;; window jump
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(org-agenda-files nil))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )

;; expand region
(global-set-key (kbd "C-c [") 'er/expand-region)

;; multiple-cursors
(global-set-key (kbd "C-c m") 'mc/mark-all-like-this)

;; no confirm on kill buffer
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; enable tabbar
(tabbar-mode 1)


;; helm
(setq helm-M-x-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match    t)
(semantic-mode 1)
(global-set-key "\M-B" 'helm-buffers-list)
(global-set-key "\M-F" 'helm-semantic-or-imenu)
(global-set-key "\M-S" 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\M-O" 'helm-projectile)

;; neotree
(global-set-key "\M-L" 'neotree)

;; disable messages-buffer
(setq initial-scratch-message "")
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))
(setq inhibit-startup-buffer-menu t)
(add-hook 'window-setup-hook 'delete-other-windows)

;; ci'
(defun seek-backward-to-char (chr)
  "Seek backwards to a character"
  (interactive "cSeek back to char: ")
  (while (not (= (char-after) chr))
    (forward-char -1)))

(setq char-pairs
      '(( ?\" . ?\" )
        ( ?\' . ?\' )
        ( ?\( . ?\) )
        ( ?\[ . ?\] )
        ( ?\{ . ?\} )
        ( ?<  . ?>  )))

(defun get-char-pair (chr)
  (let ((result ()))
    (dolist (x char-pairs)
      (setq start (car x))
      (setq end (cdr x))
      (when (or (= chr start) (= chr end))
        (setq result x)))
    result))

(defun get-start-char (chr)
  (car (get-char-pair chr)))
(defun get-end-char (chr)
  (cdr (get-char-pair chr)))

(defun seek-to-matching-char (start end count)
  (while (> count 0)
    (if (= (following-char) end)
        (setq count (- count 1))
      (if (= (following-char) start)
          (setq count (+ count 1))))
    (forward-char 1)))

(defun seek-backward-to-matching-char (start end count)
  (if (= (following-char) end)
      (forward-char -1))
  (while (> count 0)
    (if (= (following-char) start)
        (setq count (- count 1))
      (if (= (following-char) end)
          (setq count (+ count 1))))
    (if (> count 0)
        (forward-char -1))))

(defun delete-between-pair (char)
  "Delete in between the given pair"
  (interactive "cDelete between char: ")
  (seek-backward-to-matching-char (get-start-char char) (get-end-char char) 1)
  (forward-char 1)
  (setq mark (point))
  (seek-to-matching-char (get-start-char char) (get-end-char char) 1)
  (forward-char -1)
  (kill-region mark (point)))
(global-set-key (kbd "C-c i") 'delete-between-pair)

;; move by paragraph
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "M-[") 'backward-paragraph)

;; better windows
(global-set-key (kbd "M-!") 'delete-other-windows)
(global-set-key (kbd "M-@") 'split-window-below)
(global-set-key (kbd "M-#") 'split-window-right)

;; replace string
(global-set-key (kbd "C-c r") 'replace-string)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; ac
(add-hook 'after-init-hook 'global-company-mode)
