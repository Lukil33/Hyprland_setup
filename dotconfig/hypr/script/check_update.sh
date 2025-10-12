# === CONTROLLO UTILIZZO DI UPDATE PER INATTIVITÀ ===
PROCESSI=("dnf" "dnf5" "rpm" "packagekitd" "pkcon" "flatpak" "snap" "pip3")
LOCK_FILE="/var/cache/dnf/metadata_lock.pid"
ACTIVE=0

# Controllo processi attivi
for proc in "${PROCESSI[@]}"; do
    if pgrep -x "$proc" > /dev/null; then
        ACTIVE=1
    fi
done

# Controllo file di lock
if [ -f "$LOCK_FILE" ]; then
    ACTIVE=1
fi
if [ "$ACTIVE" = "1" ]; then
    # Sono a conoscenza del fatto che il comando è sbagliato, però al contempo sembra funzionare, quindi chi sono io per andarlo a toccare
    systemd-inhibit --what=idle:sleep --why="Aggiornamento in corso" bash -c 'while [ -f '"$LOCK_FILE"' ]; do sleep 30; done'
fi