# === CONTROLLO BATTERIA PER NOTIFICA ===

# Dispositivo batteria (adatta se necessario)
BAT="/sys/class/power_supply/BAT0"
PREV_LEVEL=100

while true; do
    LEVEL=$(cat "$BAT/capacity")

    # Notifica se scende sotto il 20% e prima era sopra
    if (( (LEVEL <= 20 && PREV_LEVEL > 20) || (LEVEL <= 10 && PREV_LEVEL > 10) || (LEVEL <= 5 && PREV_LEVEL > 5) )); then
        notify-send -u critical "Batteria" "Percentuale: $LEVEL%"
    fi

    PREV_LEVEL=$LEVEL
done