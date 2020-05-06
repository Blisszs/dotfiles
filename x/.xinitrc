while true; do
	xsetroot -name "$(date)"
	sleep 60
done &
pulseaudio &
setxkbmap pt &
sxhkd &
feh --bg-fill -z wallpapers/
exec dwm 
