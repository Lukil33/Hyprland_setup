# === CONTROLLO BATTERIA PER NOTIFICA ===

# Dispositivo batteria (adatta se necessario)
PREV_LEVEL=100

upower --monitor-detail | while read -r line; do
    if [[ $line =~ percentage ]]; then
        LEVEL=$(echo $line | grep -oP '[0-9]+(?=%)')
        if (( (LEVEL <= 20 && PREV_LEVEL > 20) || (LEVEL <= 10 && PREV_LEVEL > 10) || (LEVEL <= 5 && PREV_LEVEL > 5) )); then
            notify-send -u critical "Batteria" "Percentuale: $LEVEL%"
        fi
        PREV_LEVEL=$LEVEL
    fi
done