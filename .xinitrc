#!/usr/bin/env sh

# xinitrc runs automatically when you run startx.

# Source the xResources file
[[ -f ~/.config/Xresources ]] && xrdb ~/.config/Xresources

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/.xprofile because that
# file is run automatically if someone uses a display manager (login screen)
# and so they are needed there. To prevent doubling up commands, I source them
# here with the line below.

[ -f ~/.xprofile ] && . ~/.xprofile

# Start dwm in a loop so that it can be restarted without _much_ hassle

while true
do
	ssh-agent dwm || break
done
