setxkbmap pt &&
while true; do
	xsetroot -name "[$(acpi | awk '{print "Battery: " $4 }' | sed 's/,/ /')] [$(xkblayout-state print "%s")] $(date +\[%H\:%M\]\ \[%D\]) "
	sleep 60
done &
pulseaudio --start &
sxhkd &
feh --bg-fill -z wallpapers/ &
setxkbmap -option "ctrl:swapcaps" &
exec dwm

