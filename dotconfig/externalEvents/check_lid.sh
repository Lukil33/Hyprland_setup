# === CONTROLLO MONITOR ESTERNO E CHIUSURA PER SPEGNIMENTO SCHERMO PRICIPALE ===

# Nomi monitor - cambiali se necessario
INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

# Funzione per leggere lo stato del coperchio
lid_closed() {
    grep -q closed /proc/acpi/button/lid/LID*/state
}

# Funzione per verificare se il monitor esterno è collegato
external_connected() {
    hyprctl monitors | grep -q "$EXTERNAL"
}

if lid_closed; then # Se il coperchio viene chiuso
    if external_connected; then # Se sono collegato ad un secondo schermo
        exec firefox
        hyprctl keyword monitor "$INTERNAL,disable" # Disabilita il primo schermo
    else  # Se non sono collegato ad un secondo schermo
        hyprlock & # Attiva Hyprlock
        sleep 1
        systemctl suspend # Sospendi il pc
    fi
else # Se il coperchio viene aperto riattiva lo schermo eDP-1
    hyprctl keyword monitor "HDMI-A-1,preferred,auto,1"
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
    hyprctl reload
fi