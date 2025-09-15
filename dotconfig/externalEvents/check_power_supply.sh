# === CONTROLLO COLLEGAMENTO CAVO BATTERIA PER NOTIFICA ===

# Invia una notifica desktop (serve DISPLAY e DBUS_SESSION_BUS_ADDRESS)
export DISPLAY=:0
export XAUTHORITY=/home/lukil/.Xauthority

# Trova DBUS address
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u lukil gnome-session | head -n1)/environ | cut -d= -f2-)

notify-send "Batteria" "$(cat /sys/class/power_supply/BAT0/status)"