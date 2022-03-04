;;; ros.el --- Rahul's Org-Mode Screenshot -*- lexical-binding: t; -*-
;;
;;    ros is invoked with "M-x ros", then it waits for your selection, takes a
;; screenshot and saves it as orgfileopened.org_YYYYMMDD_hhmmss.png.
;;
;;    Finally, it keeps working by inserting a link and turning ON the
;; display-inline-images, showing the taken screenshot directly into
;; your file.
;;
;;    Track updates, contact the author and see a demo on github.com/Lionyx/ros
;;    License: GPL2

(require 'org)

(defgroup ros nil
  "Screenshot tool for org-mode."
  :group 'tools
  :prefix "ros-*")

(defcustom ros-primary-screencapture "scrot"
  "Primary screencapture software (usually set to Linux systems)"
  :type 'string)

(defcustom ros-secondary-screencapture "screencapture"
  "Secondary screencapture software, if first fails to load (usually set to MacOS systems)"
  :type 'string)

;;;###autoload
(defun ros ()
  "Screenshots an image to an org-file"
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
          (if (executable-find ros-primary-screencapture)
              (call-process ros-primary-screencapture nil nil nil "-s" filename)
            (call-process ros-secondary-screencapture nil nil nil "-s" filename))
          (insert (concat "[[" filename "]]"))
          (org-display-inline-images t t)
          )
        (message "File created and linked...")
        )
    (message "You're in a not saved buffer! Save it first!")
    )
  )

(provide 'ros)

;;; ros.el ends here
