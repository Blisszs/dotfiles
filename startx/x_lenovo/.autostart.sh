# Statusbar loop
#while true; do
#   xsetroot -name "$(date +%d && date +%B\ %A && echo '|' && date +%H:%M)"
#   sleep 1m    # Update time every minute
#done &
# programs
exec python /home/bliss/lenovo-miix-320/auto_rotate.py &
exec setxkbmap pt &
exec start-pulseaudio-x11 &
exec sxhkd &
sleep 2.7s && nitrogen --random --set-scaled ~/wallpapers/ &
exec setxkbmap -option ctrl:nocaps
