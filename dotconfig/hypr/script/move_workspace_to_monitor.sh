# === GESTIONE SPOSTAMENTO WORKSPACE AL PROSSIMO MONITOR ===

# Ottieni nome del monitor corrente (dove c'è il workspace attivo)
current_monitor=$(hyprctl activeworkspace -j | jq -r '.monitor')

# Ottieni lista dei monitor attivi
readarray -t monitors < <(hyprctl monitors -j | jq -r '.[].name')

# Trova l'indice del monitor corrente
for i in "${!monitors[@]}"; do
    if [[ "${monitors[$i]}" == "$current_monitor" ]]; then
        current_index=$i
        break
    fi
done

# Calcola l'indice del monitor successivo (ciclico)
next_index=$(( (current_index + 1) % ${#monitors[@]} ))
next_monitor="${monitors[$next_index]}"

# Sposta il workspace attivo sul monitor successivo
hyprctl dispatch movecurrentworkspacetomonitor "$next_monitor"
