# === FILE CHE AGGIORNA HYPRLOCK ===

# File da modificare
CONFIG_FILE="$HOME/.config/hypr/hyprlock.conf"

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

# Pulisci la configurazione precedente e aggiungi la prima parte del file
cat > "$CONFIG_FILE" <<'EOF'
#COLORI
$foreground = rgba(255, 255, 255, 1.0)
$background = rgba(0, 0, 0, 1.0)

# IMPOSTAZIONI GENERALI
general {
    ignore_empty_input = true
}

EOF

# Caso 1: Una sola immagine -> usala per tutti gli schermi
if [ "$IMAGE_COUNT" -eq 1 ]; then
  IMAGE_PATH="$1"
  echo -e "background {\n    monitor =\n    path = $IMAGE_PATH\n    blur_passes = 2\n}\n" >> "$CONFIG_FILE"

# Caso 2: Due immagini -> assegna la prima al primo schermo, la seconda al secondo
elif [ "$IMAGE_COUNT" -eq 2 ]; then
  IMAGE_PATH1="$1"
  IMAGE_PATH2="$2"
  echo -e "background {\n    monitor = eDP-1\n    path = $IMAGE_PATH1\n    blur_passes = 2\n}\n" >> "$CONFIG_FILE"
  echo -e "background {\n    monitor = HDMI-A-1\n    path = $IMAGE_PATH2\n    blur_passes = 2\n}\n" >> "$CONFIG_FILE"
fi

#inserisci la restante parte del config file
cat >> "$CONFIG_FILE" <<'EOF'
# ORA - in grande, centrata in alto
label {
    monitor = 
    text = cmd[update:1000] date +"%H:%M"
    color = $foreground
    font_size = 63
    font_family = Fira Semibold
    position = 0,-170
    halign = center
    valign = top
    shadow_passes = 5
    shadow_size = 10
}

# DATA - in piccolo, sotto l'orario
label {
    monitor = 
    text = cmd[update:60000] date +"%A %d %B %Y"
    color = $foreground
    font_size = 15
    font_family = Fira Semibold
    position = 0,-280
    halign = center
    valign = top
    shadow_passes = 3
    shadow_size = 5
}

# INPUT - centrale leggermente in basso
input-field {
    monitor =
    size = 250, 40
    dots_size = 0.33
    dots_spacing = 0.15
    dots_center = true
    dots_rounding = -1
    inner_color = $foreground
    font_color = $background
    font_family = Fira Semibold
    outer_color = $foreground
    outline_thickness = 1
    fade_on_empty = true
    fade_timeout = 1500

    placeholder_text = <i>Input Password...</i>
    hide_input = false
    rounding = 10

    check_color = $foreground
    fail_color = $background
    fail_text = <i>$FAIL</i>
    #fail_timeout = 5000 -> per la versione che sto utilizzando attualmente di hyprlock questo comando non funziona a prescindere perchè in realtà il tempo di fail è hardcodato quindi... stacce

    capslock_color = -1
    numlock_color = -1
    bothlock_color = -1
    invert_numlock = false
    swap_font_color = false

    position = 0,0
    halign = center
    valign = center
}

# CAPS LOCK WARNING - piccolo, centrale sotto all'input line
label {
    monitor =
    text = cmd[update:200] bash -c 'if [ "$(cat /sys/class/leds/input*::capslock/brightness | head -n 1)" -eq 1 ]; then echo "Caps Lock attivo"; else echo ""; fi'
    color = $foreground
    font_size = 10
    font_family = Fira Semibold
    position = 0, -40
    halign = center
    valign = center
    shadow_passes = 3
    shadow_size = 8
}

# NOME UTENTE - in piccolo, in basso al centro
label {
    monitor =
    text = $USER
    color = $foreground
    font_size = 20
    font_family = Fira Semibold
    position = 0,40
    halign = center
    valign = bottom
    shadow_passes = 5
    shadow_size = 10
}
EOF