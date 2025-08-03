# === AGGIORNA CONFIG FILE DI HYPRPAPER ===

# File da modificare
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

# Pulisci la configurazione precedente
> "$CONFIG_FILE"

# Caso 1: Una sola immagine -> usala per tutti gli schermi
if [ "$IMAGE_COUNT" -eq 1 ]; then
  IMAGE_PATH="$1"
  echo "preload = $IMAGE_PATH" >> "$CONFIG_FILE"
  echo "wallpaper = eDP-1,$IMAGE_PATH" >> "$CONFIG_FILE"
  echo "wallpaper = HDMI-A-1,$IMAGE_PATH" >> "$CONFIG_FILE"

# Caso 2: Due immagini -> assegna la prima al primo schermo, la seconda al secondo
elif [ "$IMAGE_COUNT" -eq 2 ]; then
  IMAGE_PATH1="$1"
  IMAGE_PATH2="$2"
  echo "preload = $IMAGE_PATH1" >> "$CONFIG_FILE"
  echo "preload = $IMAGE_PATH2" >> "$CONFIG_FILE"
  echo "wallpaper = eDP-1,$IMAGE_PATH1" >> "$CONFIG_FILE"
  echo "wallpaper = HDMI-A-1,$IMAGE_PATH2" >> "$CONFIG_FILE"
fi