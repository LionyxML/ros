# ros - Rahul's Org-mode Screenshot

My implementation for the **"how do I copy-paste images into an org file?"** question.

ros is invoked with "M-x ros", then it waits for your selection, takes a screenshot and saves it as orgfileopened.org_YYYYMMDD_hhmmss.png.

Finally, it keeps working by inserting a link and turning on the display-inline-images, showing the taken screenshot directly into your file (take a look at the screenshot below).


## Requirements

- Linux: scrot (for taking screenshots); 
- MacOS: screencapture (built-in for Mojave and Catalina...)

## Install

Simply copy the ros.el file contents to your ~/.emacs file, restart emacs or eval the dot file.

## Usage

Use M-x ros RET, select the part of the screen you want to sreenshot, and a picture file should be created and linked to your document.

## Screenshot

Here it's what it does.

![ros in action](images/ros.gif)


