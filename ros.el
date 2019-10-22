;;    ros - Rahul's Org-Mode Screenshot
;;
;;    ros is invoked with "M-x ros", then it waits for your selection, takes a
;; screenshot and saves it as orgfileopened.org_YYYYMMDD_hhmmss.png.
;;
;;    Finally, it keeps working by inserting a link and turning ON the
;; display-inline-images, showing the taken screenshot directly into
;; your file.
;;
;;    Track updates, contact the author and see a demo on github.com/Lionyx/ros
;; or http://rahuljuliato.com
;;
(add-hook 'org-mode-hook
	  (lambda ()
	  (defun ros ()
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
		    (if (executable-find "scrot")
			(call-process "scrot" nil nil nil "-s" filename)
		      (call-process "screencapture" nil nil nil "-s" filename))
		    (insert (concat "[[" filename "]]"))
		    (org-display-inline-images t t)
		    )
		  (message "File created and linked...")
		  )
	      (message "You're in a not saved buffer! Save it first!")
	      )
	    )
	  )
	  )


