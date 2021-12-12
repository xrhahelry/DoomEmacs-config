(setq doom-font (font-spec :family "FiraCode NF" :size 20 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'doom-monokai-octagon)

(setq doom-line-numbers-relative t)

(setq org-ellipsis " ▾")

(setq org-directory "~/Desktop/Org/")

(add-hook 'org-mode-hook #'org-bullets-mode)
(setq inhibit-compacting-font-caches t)
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.1))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.05))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)
)))
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
 "t /" #'comment-line)

(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; █
(setq evil-emacs-state-cursor  'hbar) ; _
