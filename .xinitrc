logfile="$HOME/.xorg.log"

if [ -f "$logfile" ]
then
    mv "$logfile" "$logfile.old"
fi

exec bspwm > "$logfile" 2>&1
