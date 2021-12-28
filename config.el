(setq doom-font (font-spec :family "Fira Code Retina" :size 20 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'gruber-darker)

(set-cursor-color "#ffdd33")
(evil-set-cursor-color "#ffdd33")
(setq +evil--default-cursor-color "#ffdd33")
(setq +evil--emacs-cursor-color "#ffdd33")
(custom-set-faces '(cursor ((t (:background "#ffdd33")))))
(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'box)  ; █
(setq evil-emacs-state-cursor  'hbar) ; _

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window" "b c" #'clone-indirect-buffer-other-window)

(map! :leader
      (:prefix ("w" . "window")
       :desc "Winner redo" "<right>" #'winner-redo
       :desc "Winner undo" "<left>" #'winner-undo))

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)

(setq org-ellipsis " ▼ ")

(setq org-directory "~/Desktop/Org/")

(add-hook 'org-mode-hook #'org-bullets-mode)
(setq inhibit-compacting-font-caches t)
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(setq org-agenda-files
      '("~/Desktop/Org/Agenda/Tasks.org"
        "~/Desktop/Org/Agenda/Urgent.org"
        "~/Desktop/Org/Agenda/Events.org"))

(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(map!
 :leader
 :desc "Comment line"
 "TAB TAB" #'comment-line)

(use-package dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.doom.d/doom-emacs-dash.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))

(setq doom-fallback-buffer "*dashboard*")

(set-face-attribute 'mode-line nil :font "Ubuntu Mono-14")
(setq doom-modeline-height 30     ;; sets modeline height
      doom-modeline-bar-width 3)  ;; sets right bar width

(map! :leader
      :desc "Switch to perspective NAME" "DEL" #'persp-switch
      :desc "Switch to buffer in perspective" "," #'persp-switch-to-buffer
      :desc "Switch to next perspective" "]" #'persp-next
      :desc "Switch to previous perspective" "[" #'persp-prev
      :desc "Add a buffer current perspective" "+" #'persp-add-buffer
      :desc "Remove perspective by name" "-" #'persp-remove-by-name)

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode 1 )

(use-package emojify
  :hook (after-init . global-emojify-mode))
