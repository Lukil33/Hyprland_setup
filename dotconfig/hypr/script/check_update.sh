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
    hyprctl dispatch idleinhibit always
else
    hyprctl dispatch idleinhibit none
fi
