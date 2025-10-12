# === CONTROLLO UTILIZZO DI AUDIO PER INATTIVITÀ ===

# Verifica se è in corso una riproduzione audio
if pactl list sink-inputs | grep -q 'pulse.corked = "false"'; then
    # Audio in riproduzione: impedisce l'inattività
    systemd-inhibit --what=idle:sleep --why="Audio attivo" bash -c "while pactl list sink-inputs | grep -q 'pulse.corked = \"false\"'; do sleep 10; done"
fi