while true; do
	xsetroot -name "$(date +\[%H\:%M\]\ \[%D\]\ )"
	sleep 60
done &
pulseaudio &
setxkbmap pt &
sxhkd &
feh --bg-fill -z wallpapers/ &
exec dwm
