[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# set the cursor
xsetroot -cursor_name lft_ptr
# set ABNT layout
setxkbmap -model abnt2 -layout br -variant abnt2
# iniciar xmonad
exec xmonad
