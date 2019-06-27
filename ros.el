;; Rahul Org-mode Screenshot takes a screenshot with scrot -s (waits for screen
;; selection), saves it as orgfileopened.org_YYYYMMDD_hhmmss.png, inserts 
;; the link and turns on the display-inline-images, showing your screenshot directly
;; to the org-file" 
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


