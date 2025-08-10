# === AGGIORNA STILE PER SWAYNC ===

COLORS="$HOME/.cache/wal/colors.json"
STYLE_PATH="$HOME/.config/swaync/style.css"

# Funzione per convertire HEX in rgba
hex_to_rgba() {
  hex=${1#"#"}
  r=$((16#${hex:0:2}))
  g=$((16#${hex:2:2}))
  b=$((16#${hex:4:2}))
  echo "rgba($r, $g, $b, 1.0)"
}

hex_to_rgba_dark(){
  hex=${1#"#"}
  r=$((16#${hex:0:2}))
  g=$((16#${hex:2:2}))
  b=$((16#${hex:4:2}))
  echo "rgba($r, $g, $b, 0.5)"
}

# Controlla che il file esista
if [ -f "$STYLE_PATH" ]; then
  # Carica alcuni colori principali da wal
  BG=$(hex_to_rgba "$(jq -r ".special.background" "$COLORS")") # background
  FG=$(hex_to_rgba "$(jq -r ".special.foreground" "$COLORS")") # foreground
  CRS=$(hex_to_rgba "$(jq -r ".special.cursor" "$COLORS")") # cursor
  COLOR0=$(hex_to_rgba "$(jq -r ".colors.color0" "$COLORS")")
  COLOR1=$(hex_to_rgba "$(jq -r ".colors.color1" "$COLORS")")
  COLOR2=$(hex_to_rgba "$(jq -r ".colors.color2" "$COLORS")")
  DCOLOR2=$(hex_to_rgba_dark "$(jq -r ".colors.color2" "$COLORS")")
  COLOR3=$(hex_to_rgba "$(jq -r ".colors.color3" "$COLORS")")
  COLOR4=$(hex_to_rgba "$(jq -r ".colors.color4" "$COLORS")")
  COLOR5=$(hex_to_rgba "$(jq -r ".colors.color5" "$COLORS")")
  COLOR6=$(hex_to_rgba "$(jq -r ".colors.color6" "$COLORS")")
  COLOR7=$(hex_to_rgba "$(jq -r ".colors.color7" "$COLORS")")
  COLOR8=$(hex_to_rgba "$(jq -r ".colors.color8" "$COLORS")")
  COLOR9=$(hex_to_rgba "$(jq -r ".colors.color9" "$COLORS")")
  COLOR10=$(hex_to_rgba "$(jq -r ".colors.color10" "$COLORS")")
  COLOR11=$(hex_to_rgba "$(jq -r ".colors.color11" "$COLORS")")
  COLOR12=$(hex_to_rgba "$(jq -r ".colors.color12" "$COLORS")")
  COLOR13=$(hex_to_rgba "$(jq -r ".colors.color13" "$COLORS")")
  COLOR14=$(hex_to_rgba "$(jq -r ".colors.color14" "$COLORS")")
  COLOR15=$(hex_to_rgba "$(jq -r ".colors.color15" "$COLORS")")

# Svuota il file Style e inserisce il nuovo stile
cat > "$STYLE_PATH" <<EOF
@define-color bg $BG;
@define-color fg $FG;
@define-color crs $CRS;
@define-color color0 $COLOR0;
@define-color color1 $COLOR1;
@define-color color2 $COLOR2;
@define-color dark_color2 $DCOLOR2;
@define-color color3 $COLOR3;
@define-color color4 $COLOR4;
@define-color color5 $COLOR5;
@define-color color6 $COLOR6;
@define-color color7 $COLOR7;
@define-color color8 $COLOR8;
@define-color color9 $COLOR9;
@define-color color10 $COLOR10;
@define-color color11 $COLOR11;
@define-color color12 $COLOR12;
@define-color color13 $COLOR13;
@define-color color14 $COLOR14;
@define-color color15 $COLOR15;

/* Font settings */
* {
    font-family: "Symbols Nerd Font", "JetBrainsMono NFP", sans-serif;
    font-weight: bold;
    font-size: 14px;
}

/* Notification styling */
.control-center .notification-row:focus,
.control-center .notification-row:hover {
    opacity: 1;
    background: @bg;
}
.notification-row {
    outline: none;
    margin: 10px;
    padding: 0;
}
.notification {
    background: transparent;
    margin: 0px;
}
.notification-content {
    background: @bg;
    padding: 7px;
    border-radius: 5px;
    border: 1px solid @color2;
    margin: 0;
}
.close-button:hover,
.close-button {
    background: @bg;
    color: @color7;
    text-shadow: none;
    padding: 0;
    border-radius: 0px;
    margin-top: 5px;
    margin-right: 5px;
}
.notification-default-action:hover,
.notification-action:hover,
.notification-action {
    color: @color7;
    border: 2px solid @color2;
    border-top: none;
    border-radius: 5px;
    background: @color2;
}
.summary {
    padding-top: 7px;
    font-size: 13px;
    color: @color2;
}
.time {
    font-size: 11px;
    color: @color7;
    margin-right: 24px;
}
.body {
    font-size: 12px;
    color: @color7;
}

/* Control center styling */
.control-center {
    background: @bg;
    border: 2px solid @color2;
    border-radius: 5px;
}
.control-center-list {
    background: transparent;
}
.control-center-list-placeholder {
    opacity: .5;
}
.floating-notifications {
    background: transparent;
}
.blank-window {
    background: alpha(black, 0.1);
}

/* Widgets styling */
.widget-title {
    color: @color7;
    background: @bg;
    padding: 5px 10px;
    margin: 10px 10px 5px 10px;
    font-size: 1.5rem;
}
.widget-title > button {
    font-size: 1rem;
    color: @color2;
    text-shadow: none;
    background: @bg;
    box-shadow: none;
    border: 1px solid @color2;
    border-radius: 5px;
}
.widget-title > button:hover {
    background: @color2;
    color: @bg;
}

.widget-dnd {
    background: @bg;
    padding: 5px 10px;
    margin: 5px 10px 10px 10px;
    border-radius: 5px;
    font-size: large;
    color: @color7;
}
.widget-dnd > switch{
    background: @bg;
    color: @color2;
    border: 1px solid @color2;
    border-radius: 5px;
}
.widget-dnd > switch:checked {
    background: @dark_color2;
}
.widget-dnd > switch slider,
.widget-dnd > switch:checked slider {
    background: @color2;
    border: 1px solid @color2;
    border-radius: 5px;
}

.widget-mpris {
    color: @color7;
    background: @bg;
    padding: 0px 0px 0px 0px;
    margin: 0px 10px 0px 10px;
}
.widget-mpris button {
    color: @color2;
    background: @bg;
    border: 1px solid @color2;
    border-radius: 5px;
}
.widget-mpris button:hover {
    color: @bg;
    background: @color2;
    border: 1px solid @color2;
    border-radius: 5px;
}
.widget-mpris-player {
    padding: 5px 10px;
    margin: 10px;
}
.widget-mpris-title {
    color: @color2;
    font-weight: 700;
    font-size: 1.25rem;
}
.widget-mpris-subtitle {
    font-size: 1.1rem;
}

.widget-volume,
.widget-backlight {
    color: @color7;
    padding: 5px;
    margin: 0px 5px 0px 15px;
    background-color: @bg;
}
.widget-volume label{
    font-size: 20px;
}
.widget-backlight label {
    font-size: 17px;
}
.widget-backlight scale trough,
.widget-volume scale trough{
    background-color: @bg;
    border: 1px solid @color7;
}
.widget-backlight scale trough highlight,
.widget-volume scale trough highlight{
    background-color: @color2;
    border: 1px solid @color2;
}

.widget-buttons-grid {
    font-size: x-large;
    padding: 5px;
    background: @bg;
}
.widget-buttons-grid > flowbox > flowboxchild > button {
    margin: 3px;
    background: @bg;
    color: @color2;
    border: 1px solid @color2;
    border-radius: 5px;
}
.widget-buttons-grid > flowbox > flowboxchild > button label {
    font-size: 14px;
}
.widget-buttons-grid > flowbox > flowboxchild > button:hover {
    background: @color2;
    color: @bg;
}
.widget-buttons-grid > flowbox > flowboxchild > button.active {
    background-color: @color2;
    color: @bg;
}
EOF
fi