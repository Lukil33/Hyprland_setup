#!/bin/bash

# === FILE WRAPPER CHE CAMBIA LO SFONDO E APPLICA I RELATIVI TEMI ===

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

# Cartella nella quale verranno salvate le copie delle immagini
WALLPAPER_DIR="$HOME/.local/share/wallpapers"

# Controllo il numero di file passati e se esistono
if [[ "$IMAGE_COUNT" -lt 1 ]]; then
  echo "Usage: $0 image1 [image2]"
  exit 1;
fi
if [ ! -f "$1" ]; then
  echo "[ERRORE] File immagine non trovato: $1"
  exit 1
fi

# Creo la cartella di destinazione se non esiste e la pulisco
mkdir -p "$WALLPAPER_DIR" || {
  echo "[ERRORE] Impossibile creare la cartella: $WALLPAPER_DIR"
  exit 1
}
rm -f -- "$WALLPAPER_DIR"/*

# Ricavo il path assoluto del file originale
source=$(realpath "$1") || exit 1

# Copio l'immagine come main_wallpaper
ext="${source##*.}"
dest="$WALLPAPER_DIR/main_wallpaper.$ext"

if ! cp -f -- "$source" "$dest"; then
  echo "[ERRORE] Impossibile copiare l'immagine principale"
  exit 1
fi

path=$(realpath "$dest") || exit 1

# Modifica le impostazioni dello sfondo su hyprpaper.conf e hyprlock.conf
$HOME/.config/style/script/update_hyprpaper.sh "$path"
$HOME/.config/style/script/update_hyprlock.sh "$path"

# Applica Matugen allo sfondo selezionato
matugen image "$source" --show-colors --mode smart --source-color-index 0

# Modifico il file style di SDDM
sudo $HOME/.config/style/script/update_sddm.sh "$path"

# Rimuovi lo sfondo ativo
pkill hyprpaper

# Attendi che lo sfondo sia effettivamente stato eliminato
while pgrep hyprpaper > /dev/null; do
    sleep 0.1
done

# Ricarica Hyprland, Hyprpaper, Waybar e swaync
hyprpaper &
hyprctl reload
pkill waybar && waybar &
swaync-client -rs