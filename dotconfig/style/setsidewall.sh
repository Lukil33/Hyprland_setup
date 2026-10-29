#!/bin/bash

# === FILE WRAPPER CHE CAMBIA LO SFONDO E APPLICA I RELATIVI TEMI ===

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

# Cartella nella quale verranno salvate le copie delle immagini
WALLPAPER_DIR="$HOME/.local/share/wallpapers"

# Controllo il numero di file passati e se esistono
if [[ "$IMAGE_COUNT" -lt 1 ]]; then
  echo "Usage: $0 image2"
  exit 1;
fi
if [ ! -f "$1" ]; then
  echo "[ERRORE] File immagine non trovato: $1"
  exit 1
fi

# Controllo se il file main_wallpaper esiste
if ! compgen -G "$WALLPAPER_DIR/main_wallpaper.*" > /dev/null; then
  echo "[ERRORE] La seguente cartella non esiste: $WALLPAPER_DIR"
  exit 1
fi

rm -f -- "$WALLPAPER_DIR"/side_wallpaper.*

# Ricavo il path assoluto del file originale
source2=$(realpath "$1") || exit 1

# Ricavo il path del main_wallpaper
main_file=$(compgen -G "$WALLPAPER_DIR/main_wallpaper.*" | head -n 1)

# Copio la seconda immagine come side_wallpaper, se presente
ext2="${source2##*.}"
dest2="$WALLPAPER_DIR/side_wallpaper.$ext2"

if ! cp -f -- "$source2" "$dest2"; then
    echo "[ERRORE] Impossibile copiare l'immagine principale"
    exit 1
fi

path1=$(realpath "$main_file") || exit 1
path2=$(realpath "$dest2") || exit 1

# Modifica le impostazioni dello sfondo su hyprpaper.conf e hyprlock.conf
$HOME/.config/style/script/update_hyprpaper.sh "$path1" "$path2"
$HOME/.config/style/script/update_hyprlock.sh "$path1" "$path2"

# Ricarica Hyprland, Hyprpaper, Waybar e swaync
hyprpaper &