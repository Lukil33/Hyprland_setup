# === CONTROLLO PRESENZA DI UPDATE PER INATTIVITÀ ===

# Verifica se è in corso un update
if [ -f /var/lib/pacman/db.lck ]; then
    # Update in corso: impedisce l'inattività
    systemd-inhibit --what=idle --why="Update in corso" bash -c 'while [ -f /var/lib/pacman/db.lck ]; do sleep 20; done' &
fi