;;; projectile-head --- show project name in header
;;; Commentary:
;;; Show the name of the current projectile project in the header
;;; Code:

(defun half (number)
  "Divide a NUMBER by 2!"
  (/ number 2))

(defgroup projectile-head nil
  "Minor mode for showing projectile project name in header"
  :prefix "projectile-head-"
  :group :help
  :link '(url-link "https://github.com/chee/projectile-head"))

(defface projectile-head-face
  '((t
      (:height 1)
      (:family "fira code")
      (:background "#fcfffe")
      (:foreground "#ff4455")))
  "the face of the head")

(defun string-to-header-width
  (string)
  "Pad STRING to header width!"
  (half (string-width string)))

(defun projectile-head-name-string nil
  "Generate the projectile-head name string!"
  (let* ((project-name (projectile-project-name))
          (half-name-head-width (string-to-header-width project-name))
          (spaces (make-string (- (half (window-width)) half-name-head-width) 32)))
    (concat spaces (projectile-project-name) spaces)))

(defun projectile-head-on ()
  "Turn on projectile-head."
  (setq header-line-format
    '(:eval
         (propertize (projectile-head-name-string) 'face 'projectile-head-face))))

(defun projectile-head-off ()
  "Turn off projectile-head."
  ;; TODO make this not clear other header lines
  (setq header-line-format nil))

(define-minor-mode
  projectile-head-mode
  "A minor mode where there is a header showing you the active project"
  :lighter ""
  (if projectile-head-mode
    (projectile-head-on)
    (projectile-head-off)))

(provide 'projectile-head)
;;; projectile-head.el ends here
