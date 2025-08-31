# === CONTROLLO UTILIZZO DI AUDIO PER INATTIVITÀ ===

# Verifica se è in corso una riproduzione audio
if pactl list sink-inputs | grep -q 'State: RUNNING'; then
    # Audio in riproduzione: impedisce l'inattività
    hyprctl dispatch idleinhibit always
else
    # Nessun audio in riproduzione: consente l'inattività
    hyprctl dispatch idleinhibit none
fi