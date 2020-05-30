setxkbmap pt &&
#while true; do
#	xsetroot -name "[$(xkblayout-state print "%s")] $(date +\[%H\:%M\]\ \[%D\]) "
#	sleep 60
#done &
dwmblocks &
pulseaudio &
sxhkd &
feh --bg-fill -z wallpapers/wallpapers &
exec dwm
