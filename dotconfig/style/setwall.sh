#!/bin/bash

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

if [ "$IMAGE_COUNT" -lt 1 || "$IMAGE_COUNT" -gt 2 ]; then
  exit 1;
fi

# Modifica le impostazioni dello sfondo su hyprpaper.conf
if [ "$IMAGE_COUNT" -eq 1 ]; then
  update_hyprpaper.sh "$1"
elif [ "$IMAGE_COUNT" -eq 2 ]; then
  update_hyprpaper.sh "$1" "$2"
fi

# Applica PyWal al primo sfondo selezionato
wal -i "$1"

# Genero il file color per Hyprland
update_hyprland.sh

# Modifico il file style di SwayNC
update_swaync.sh

# Ricarica Hyprland, Hyprpaper, Waybar e swaync
pkill hyprpaper && hyprpaper &
hyprctl reload
pkill waybar && waybar &
swaync-client -rs