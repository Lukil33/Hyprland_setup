# === CONTROLLO BATTERIA PER NOTIFICA ===

# Dispositivo batteria (adatta se necessario)
BAT="/sys/class/power_supply/BAT0"
PREV_STATE="Discharging"
PREV_LEVEL=100

while true; do
    STATE=$(cat "$BAT/status")
    LEVEL=$(cat "$BAT/capacity")

    if [[ "$STATE" != "$PREV_STATE" ]]; then
        notify-send "Batteria" "$STATE"
    fi

    # Notifica se scende sotto il 20% e prima era sopra
    if (( (LEVEL <= 20 && PREV_LEVEL > 20) || (LEVEL <= 10 && PREV_LEVEL > 10) || (LEVEL <= 5 && PREV_LEVEL > 5) )); then
        notify-send -u critical "Batteria" "Percentuale: $LEVEL%"
    fi

    PREV_STATE="$STATE"
    PREV_LEVEL=$LEVEL

    sleep 30  # controlla ogni 30 secondi
done