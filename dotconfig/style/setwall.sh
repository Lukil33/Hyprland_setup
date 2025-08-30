# === FILE WRAPPER CHE CAMBIA LO SFONDO E APPLICA I RELATIVI TEMI ===

# Numero di immagini fornite come argomento
IMAGE_COUNT=$#

if [[ "$IMAGE_COUNT" -lt 1 || "$IMAGE_COUNT" -gt 2 ]]; then
  echo "Usage: $0 image1 [image2]"
  exit 1;
fi

# Modifica le impostazioni dello sfondo su hyprpaper.conf e hyprlock.conf
if [ "$IMAGE_COUNT" -eq 1 ]; then
  $HOME/.config/style/script/update_hyprpaper.sh "$1"
  $HOME/.config/style/script/update_hyprlock.sh "$1"
elif [ "$IMAGE_COUNT" -eq 2 ]; then
  $HOME/.config/style/script/update_hyprpaper.sh "$1" "$2"
  $HOME/.config/style/script/update_hyprlock.sh "$1" "$2"
fi

# Applica PyWal al primo sfondo selezionato
wal -i "$1"

# Genero il file color per Hyprland
$HOME/.config/style/script/update_hyprland.sh

# Modifico il file style di SwayNC
$HOME/.config/style/script/update_swaync.sh

# Modifico il file style di Wlogout
$HOME/.config/style/script/update_wlogout.sh

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