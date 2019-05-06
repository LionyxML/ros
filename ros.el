;; Rahul Org-mode Screenshot takes a screenshot with scrot -s (waits for screen
;; selection), saves it as orgfileopened.org_YYYYMMDD_hhmmss.png, inserts 
;; the link and turns on the display-inline-images, showing your screenshot directly
;; to the org-file" 
(add-hook 'org-mode-hook
	  (lambda ()
	  (defun ros ()
	  (interactive)
	  (let ((filename
		 (concat "./"
			 (file-name-nondirectory buffer-file-name)
			 "_"
			 (format-time-string "%Y%m%d_%H%M%S")
			 ".png")))
	    (call-process "scrot" nil nil nil "-s" filename)
	    (insert (concat "[[" filename "]]"))
	    (org-display-inline-images t t)))))

