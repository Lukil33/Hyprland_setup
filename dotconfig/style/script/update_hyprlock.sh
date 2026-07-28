#!/bin/bash

# === FILE CHE AGGIORNA HYPRLOCK ===

# File da modificare
CONFIG_FILE="$HOME/.config/hypr/hyprlock-bg.conf"

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

# Ripulisci completamente il file
truncate -s 0 "$CONFIG_FILE"

# Caso 1: Una sola immagine -> usala per tutti gli schermi
if [ "$IMAGE_COUNT" -eq 1 ]; then
    IMAGE_PATH="$1"
    echo -e "background {\n    monitor =\n    path = $IMAGE_PATH\n    blur_passes = 2\n}\n" >> "$CONFIG_FILE"

# Caso 2: Due immagini -> assegna la prima al primo schermo, la seconda a tutti gli altri schermi
elif [ "$IMAGE_COUNT" -eq 2 ]; then
    IMAGE_PATH1="$1"
    IMAGE_PATH2="$2"
    echo -e "background {\n    monitor =\n    path = $IMAGE_PATH2\n    blur_passes = 2\n}\n" >> "$CONFIG_FILE"
    echo -e "background {\n    monitor = eDP-1\n    path = $IMAGE_PATH1\n    blur_passes = 2\n}\n" >> "$CONFIG_FILE"
fi