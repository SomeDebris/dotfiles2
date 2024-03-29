 ;; (add-to-list 'load-path' "~/.emacs.d/evil")

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq evil-undo-system 'undo-tree)

(use-package markdown-mode
  :ensure t)
(use-package magit
  :ensure t)
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package solarized-theme
  :ensure t)
(use-package helm
  :ensure t)
(use-package evil-commentary
  :ensure t)
(use-package evil-collection
  :ensure t)
(use-package undo-tree
  :ensure t)
(use-package undo-fu
  :ensure t)
(use-package tex
  :ensure auctex)

(require 'evil)
(evil-mode t)
(evil-set-initial-state 'Custom-mode 'normal)

(require 'undo-tree)
(global-undo-tree-mode)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 158 :width normal)))))

(load-theme 'solarized-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/magnus/Documents/college-notes/DBF.org" "/home/magnus/Documents/college-notes/AE-220-DYNAMICS.org" "/home/magnus/Documents/college-notes/PERSONAL.org"))
 '(package-selected-packages
   '(auto-complete-auctex auto-complete ghost-blog pdf-tools auctex-lua auctex lua-mode undo-fu undo-tree evil-collection evil-commentary helm markdown-mode use-package solarized-theme magit evil)))

(evil-collection-init '(magit calendar calc ediff dired org undo eww auctex))

(setq path-to-ctags "/usr/bin/ctags")

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(defun create-ctags (dir-name)
  "Create tags file."
  (interactive "Directory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
)	

