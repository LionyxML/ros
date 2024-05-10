;;; org-ros.el --- Rahul's Org-Mode Screenshot -*- lexical-binding: t; -*-

;; Author: Rahul Martim Juliato <rahul.juliato@gmail.com>
;; Version: 0.1.0
;; URL: https://github.com/LionyxML/ros
;; Package-Requires: ((emacs "24.1"))
;; SPDX-License-Identifier: GPL-2.0-or-later

;;; Commentary:
;;  ros is invoked with "M-x org-ros", then it waits for your selection, takes a
;; screenshot and saves it as orgfileopened.org_YYYYMMDD_hhmmss.png.
;;
;;  It then adds a link to your org file and turns ON display-inline-images
;; showing you the recently screenshoted image.
;;
;;  By default it tries to use system "scrot" software (you need to install it
;; on your system), and if it fails "screencapture" is used (for MacOS users
;; it is installed by default). You can change this defaults and its switches
;; by editing org-ros-* variables.
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

(defcustom org-ros-primary-screencapture-switch "-s"
  "Primary screencapture software selection switch."
  :type 'string)

(defcustom org-ros-secondary-screencapture "screencapture"
  "Secondary screencapture software, if first fails to load (usually set to MacOS systems)."
  :type 'string)

(defcustom org-ros-secondary-screencapture-switch "-s"
  "Secondary screencapture software selection switch."
  :type 'string)

(defcustom org-ros-windows-screencapture "powershell.exe"
  "Powershell screencapture software (for people using wsl2)."
  :type 'string)

(defcustom org-ros-subdirectory ""
  "Subdirectory to store screenshots."
  :type 'string)

(defconst org-ros-dir (file-name-directory (or load-file-name buffer-file-name)))


;;;###autoload
(defun org-ros ()
  "Screenshots an image to an org-file."
  (interactive)
  (if buffer-file-name
      (progn
        (message "Waiting for region selection with mouse...")
        (if org-ros-subdirectory
            (make-directory org-ros-subdirectory t))
        (let* ((default-filename (concat
                                  (file-name-nondirectory buffer-file-name)
                                  "_"
                                  (format-time-string "%Y%m%d_%H%M%S")
                                  ".png"))
               (display-name (read-string
                              (format "Name the screenshot (default: \"%s\"): " default-filename)
                              nil nil default-filename))
               (filepath (file-name-concat (file-name-directory buffer-file-name)
                                           org-ros-subdirectory
                                           default-filename)))

          (cond ((executable-find org-ros-primary-screencapture)
                 (call-process org-ros-primary-screencapture nil nil nil org-ros-primary-screencapture-switch filepath))
                ((executable-find org-ros-secondary-screencapture)
                 (call-process org-ros-secondary-screencapture nil nil nil org-ros-secondary-screencapture-switch filepath))
                ((executable-find org-ros-windows-screencapture)
                 (start-process "powershell" "*PowerShell*" "powershell.exe" "-File" (expand-file-name "./printsc.ps1" org-ros-dir) filepath)))

          (insert "[[" filepath "]" "[" display-name "]]")
          (org-display-inline-images t t))
        (message "File created and linked..."))
    (message "You're in a not saved buffer! Save it first!")))

(provide 'org-ros)

;;; org-ros.el ends here
