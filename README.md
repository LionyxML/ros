# org-ros - Rahul's Org-mode Screenshot

[![MELPA](https://melpa.org/packages/org-ros-badge.svg)](https://melpa.org/#/org-ros)

My implementation for **"how do I copy-paste images into an org file?"** issue.

ros is invoked with <kbd>M-x</kbd> `org-ros` <kbd>RET</kbd>, it waits for your selection, takes a screenshot and saves it as `orgfileopened.org_YYYYMMDD_hhmmss.png`.

It then adds a link into your org file and turns ON `display-inline-images` showing you your image.

## Requirements

- Linux: scrot (for taking screenshots);
- MacOS: screencapture (built-in for Mojave, Catalina, Big Sur, Monterey...)
- Powershell: Powershell executable is found as `powershell.exe` within wsl2 installations
- Emacs: 24.1

## Install

`org-ros` is available on [MELPA](https://melpa.org/#/org-ros).

Alternatively, you can download `org-ros.el`, copy this file to a folder, like `~/.emacs.d/org-ros/`,
and add to your `.emacs` file:

```
(add-to-list 'load-path "~/.emacs.d/org-ros/")
(require 'org-ros)
```

## Usage

Use <kbd>M-x</kbd> `org-ros` <kbd>RET</kbd>, select the part of the screen you want to screenshot, and a picture file should be created and linked into your document.

## Screenshot

Here it's what it does.

![ros in action](images/ros.gif)
