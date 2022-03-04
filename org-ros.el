;;; org-ros.el --- Rahul's Org-Mode Screenshot -*- lexical-binding: t; -*-

;; Author: Rahul Martim Juliato <rahul.juliato@gmail.com>
;; Version: 0.1.0
;; URL: https://github.com/LionyxML/ros
;; Package-Requires: ((emacs "24.1"))
;; License: GPL2

;;; Commentary:
;;  ros is invoked with "M-x ros", then it waits for your selection, takes a
;; screenshot and saves it as orgfileopened.org_YYYYMMDD_hhmmss.png.
;;
;;  It then adds a link to your org file and turns ON display-inline-images
;; showing you the recently screenshoted image.
;;
;;  Track updates, contact the author, see contributors and a demo on Github.

;;; Code:
(require 'org)

(defgroup org-ros nil
  "Screenshot tool for org-mode."
  :group 'tools
  :prefix "org-ros-*")

(defcustom org-ros-primary-screencapture "scrot"
  "Primary screencapture software (usually set to Linux systems)."
  :type 'string)

(defcustom org-ros-secondary-screencapture "screencapture"
  "Secondary screencapture software, if first fails to load (usually set to MacOS systems)."
  :type 'string)

;;;###autoload
(defun org-ros ()
  "Screenshots an image to an org-file."
  (interactive)
  (if buffer-file-name
      (progn
        (message "Waiting for region selection with mouse...")
        (let ((filename
               (concat "./"
                       (file-name-nondirectory buffer-file-name)
                       "_"
                       (format-time-string "%Y%m%d_%H%M%S")
                       ".png")))
          (if (executable-find org-ros-primary-screencapture)
              (call-process org-ros-primary-screencapture nil nil nil "-s" filename)
            (call-process org-ros-secondary-screencapture nil nil nil "-s" filename))
          (insert (concat "[[" filename "]]"))
          (org-display-inline-images t t))
        (message "File created and linked..."))
    (message "You're in a not saved buffer! Save it first!")))

(provide 'org-ros)

;;; org-ros.el ends here
