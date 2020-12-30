#!/bin/sh
if [ -f ~/.Xprofile ]; then
        . ~/.Xprofile
fi

xhost local:root

# Another solution is to symlink ~/.Xdefaults to ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap gb

exec i3 -V >> ~/.i3/logfile 2>&1
