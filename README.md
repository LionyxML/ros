ros - screenshot for org-mode
-----------------------------
My implementation for the "how do I paste images into an org file?" question.

Rahul Org-mode Screenshot takes a screenshot with scrot -s (waits for screen selection), saves it as orgfileopened.org_YYYYMMDD_hhmmss.png, inserts the link and turns on the display-inline-images, showing your screenshot directly to the org-file" 


Install
-------
Simply copy the ros.el file contents to your ~/.emacs file and restart emacs or eval the dot file. Note that you should have scrot installed in your system.

Usage
-----
Use M-x ros RET, select the part of the screen you want to cut. And a picture file should be created and linked to your document.

Screenshot
----------
Here it's what it does.

![ros in action](images/ros.gif)


