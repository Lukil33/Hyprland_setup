# === FILE CHE AGGIORNA HYPRPAPER ===

# File da modificare
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

# Pulisci la configurazione precedente
> "$CONFIG_FILE"

# Caso 1: Una sola immagine -> usala per tutti gli schermi
if [ "$IMAGE_COUNT" -eq 1 ]; then
  IMAGE_PATH="$1"
  echo "wallpaper {" >> "$CONFIG_FILE"
  echo " monitor = " >> "$CONFIG_FILE"
  echo " path = $IMAGE_PATH" >> "$CONFIG_FILE"
  echo " fit_mode = cover" >> "$CONFIG_FILE"
  echo "}" >> "$CONFIG_FILE"

# Caso 2: Due immagini -> assegna la prima al primo schermo, la seconda al secondo
elif [ "$IMAGE_COUNT" -eq 2 ]; then
  IMAGE_PATH1="$1"
  IMAGE_PATH2="$2"
  echo "wallpaper {" >> "$CONFIG_FILE"
  echo " monitor = eDP-1" >> "$CONFIG_FILE"
  echo " path = $IMAGE_PATH1" >> "$CONFIG_FILE"
  echo " fit_mode = cover" >> "$CONFIG_FILE"
  echo "}" >> "$CONFIG_FILE"
  echo "" >> "$CONFIG_FILE"
  echo "wallpaper {" >> "$CONFIG_FILE"
  echo " monitor = HDMI-A-1" >> "$CONFIG_FILE"
  echo " path = $IMAGE_PATH2" >> "$CONFIG_FILE"
  echo " fit_mode = cover" >> "$CONFIG_FILE"
  echo "}" >> "$CONFIG_FILE"
fi
echo "" >> "$CONFIG_FILE"
echo "splash = false" >> "$CONFIG_FILE"