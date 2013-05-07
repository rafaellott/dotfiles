#!/bin/bash

# Load resources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Load trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
	--expand true --width 10 --transparent true --tint 0x002b36 --height 12 &

# set the cursor
xsetroot -cursor_name lft_ptr
xsetroot -solid "#002b36"
# set ABNT layout
setxkbmap -model abnt2 -layout br -variant abnt2

# iniciar xmonad
exec xmonad
