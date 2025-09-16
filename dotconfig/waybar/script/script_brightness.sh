if pgrep -x "wlsunset" > /dev/null; then
    pkill "wlsunset"
else
    # Trick ammetto molto brutto ma funzionante per poter avere una luce notturna che si attiva quando si vuole
    wlsunset -t 3999 -T 4000 -d 0 -S 08:00 -s 17:59 > /dev/null 2>&1 &
fi