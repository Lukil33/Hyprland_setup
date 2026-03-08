# === CONTROLLO UTILIZZO DI AUDIO PER INATTIVITÀ ===

# Verifica se è in corso una riproduzione audio
if pactl list sink-inputs | grep -q 'Corked: no'; then
    # Audio in riproduzione: impedisce l'inattività
    systemd-inhibit --what=idle --why="Audio attivo" bash -c "while pactl list sink-inputs | grep -q 'Corked: no'; do sleep 20; done"
fi