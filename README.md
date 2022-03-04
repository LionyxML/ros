# ros - Rahul's Org-mode Screenshot

My implementation for the **"how do I copy-paste images into an org file?"** question.

ros is invoked with "M-x ros", then it waits for your selection, takes a screenshot and saves it as orgfileopened.org_YYYYMMDD_hhmmss.png.

Finally, it adds a link to the saved image and turns on the display-inline-images flag, showing the taken screenshot directly into your file (take a look at the screenshot below).


## Requirements
- Linux: scrot (for taking screenshots); 
- MacOS: screencapture (built-in for Mojave and Catalina...)
- Emacs: Any version with org-mode

## Manual Install
Clone or download this repository.

Copy the `ros.el` file to a folder, like `~/.emacs.d/lisp/`.

Add this folder to your `.emacs` file:
```
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'ros)
```

## Usage

Use `M-x ros RET`, select the part of the screen you want to sreenshot, and a picture file should be created and linked into your document.

## Screenshot

Here it's what it does.

![ros in action](images/ros.gif)


