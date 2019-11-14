# Statusbar loop
#while true; do
#   xsetroot -name "$(date +%d && date +%B\ %A && echo '|' && date +%H:%M)"
#   sleep 1m    # Update time every minute
#done &

# programs
exec feh --bg-fill -z wallpapers &
exec setxkbmap pt &
exec pulseaudio &
exec sxhkd
