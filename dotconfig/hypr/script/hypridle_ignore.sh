# === CONTROLLO APPLICAZIONE ATTIVA PER BLOCCO SPEGNIMENTO SCHERMO ===

IGNORE_FILE="$HOME/.config/hypr/script/ignored_apps.txt"
SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

INHIBIT_PID=""

start_inhibit() {
    [ -n "$INHIBIT_PID" ] && return
    systemd-inhibit --what=idle --why="coding" sleep infinity &
    INHIBIT_PID=$!
}

stop_inhibit() {
    [ -z "$INHIBIT_PID" ] && return
    kill "$INHIBIT_PID"
    INHIBIT_PID=""
}

socat -U - UNIX-CONNECT:$SOCKET | while read -r event; do
    [[ "$event" != activewindow* ]] && continue

    WIN=$(hyprctl activewindow -j)
    CLASS=$(echo "$WIN" | jq -r '.class')
    TITLE=$(echo "$WIN" | jq -r '.title')

    if grep -Ei "$CLASS|$TITLE" "$IGNORE_FILE" >/dev/null; then
        start_inhibit
    else
        stop_inhibit
    fi
done