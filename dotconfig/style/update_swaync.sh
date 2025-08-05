# === AGGIORNA STILE PER SWAYNC ===

WAL_COLORS="$HOME/.cache/wal/colors"
STYLE_PATH="$HOME/.config/swaync/style.css"

# Funzione per convertire HEX in rgba
hex_to_rgba() {
  hex=${1#"#"}
  r=$((16#${hex:0:2}))
  g=$((16#${hex:2:2}))
  b=$((16#${hex:4:2}))
  echo "rgba($r, $g, $b, 1.0)"
}

# Controlla che il file esista
if [ -f "$STYLE_PATH" ]; then
  # Carica alcuni colori principali da wal
  COLOR0=$(hex_to_rgba "$(sed -n '1p' "$WAL_COLORS")") # background
  COLOR1=$(hex_to_rgba "$(sed -n '2p' "$WAL_COLORS")") # border
  COLOR2=$(hex_to_rgba "$(sed -n '3p' "$WAL_COLORS")") # noti-bg
  COLOR3=$(hex_to_rgba "$(sed -n '4p' "$WAL_COLORS")") # noti-bg-hover
  COLOR4=$(hex_to_rgba "$(sed -n '5p' "$WAL_COLORS")") # text-color
  COLOR5=$(hex_to_rgba "$(sed -n '6p' "$WAL_COLORS")") # selected

# Svuota il file Style e inserisce il nuovo stile
cat > "$STYLE_PATH" <<EOF
@define-color cc-bg $COLOR0;
@define-color noti-border-color $COLOR1;
@define-color noti-bg $COLOR2;
@define-color noti-bg-opaque ${COLOR2/1.0/1.0};
@define-color noti-bg-darker $COLOR0;
@define-color noti-bg-hover $COLOR3;
@define-color noti-bg-hover-opaque ${COLOR3/1.0/1.0};
@define-color noti-bg-focus ${COLOR3/1.0/0.6};
@define-color noti-close-bg ${COLOR1/1.0/0.1};
@define-color noti-close-bg-hover ${COLOR1/1.0/0.15};
@define-color text-color $COLOR4;
@define-color text-color-disabled rgba(150, 150, 150, 1.0);
@define-color bg-selected $COLOR5;
@define-color mpris-album-art-overlay rgba(0, 0, 0, 0.55);
@define-color mpris-button-hover rgba(0, 0, 0, 0.5);

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
    background: @noti-bg-darker;
}

.notification-row {
    outline: none;
    margin: 20px;
    padding: 0;
}

.notification {
    background: transparent;
    margin: 0px;
}

.notification-content {
    background: @cc-bg;
    padding: 7px;
    border-radius: 0px;
    border: 2px solid @noti-border-color;
    margin: 0;
}

.close-button {
    background: @color5;
    color: @cc-bg;
    text-shadow: none;
    padding: 0;
    border-radius: 0px;
    margin-top: 5px;
    margin-right: 5px;
}

.close-button:hover {
    box-shadow: none;
    background: @color6;
    transition: all .15s ease-in-out;
    border: none;
}

.notification-action {
    color: @text-color;
    border: 2px solid @noti-border-color;
    border-top: none;
    border-radius: 0px;
    background: @noti-border-color;
}

.notification-default-action:hover,
.notification-action:hover {
    color: @text-color;
    background: @noti-border-color;
}

.summary {
    padding-top: 7px;
    font-size: 13px;
    color: @text-color;
}

.time {
    font-size: 11px;
    color: @color3;
    margin-right: 24px;
}

.body {
    font-size: 12px;
    color: @text-color;
}

/* Control center styling */
.control-center {
    background: @cc-bg;
    border: 2px solid @noti-border-color;
    border-radius: 0px;
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
    color: @text-color;
    background: @noti-bg-darker;
    padding: 5px 10px;
    margin: 10px 10px 5px 10px;
    font-size: 1.5rem;
    border-radius: 5px;
}

.widget-title > button {
    font-size: 1rem;
    color: @text-color;
    text-shadow: none;
    background: @noti-bg;
    box-shadow: none;
    border-radius: 5px;
}

.widget-title > button:hover {
    background: @color6;
    color: @cc-bg;
}

.widget-dnd {
    background: @noti-bg-darker;
    padding: 5px 10px;
    margin: 5px 10px 10px 10px;
    border-radius: 5px;
    font-size: large;
    color: @color7;
}

.widget-dnd > switch {
    border-radius: 4px;
    background: @color8;
}

.widget-dnd > switch:checked {
    background: @color6;
    border: 1px solid @color6;
}

.widget-dnd > switch slider {
    background: @cc-bg;
    border-radius: 5px;
}

.widget-dnd > switch:checked slider {
    background: @cc-bg;
    border-radius: 5px;
}

.widget-label {
    margin: 10px 10px 5px 10px;
}

.widget-label > label {
    font-size: 1rem;
    color: @text-color;
}

.widget-mpris {
    color: @text-color;
    background: @noti-bg-darker;
    padding: 5px 10px 0px 0px;
    margin: 5px 10px 5px 10px;
    border-radius: 0px;
}

.widget-mpris > box > button {
    border-radius: 5px;
}

.widget-mpris-player {
    padding: 5px 10px;
    margin: 10px;
}

.widget-mpris-title {
    font-weight: 700;
    font-size: 1.25rem;
}

.widget-mpris-subtitle {
    font-size: 1.1rem;
}

.widget-buttons-grid {
    font-size: x-large;
    padding: 5px;
    margin: 5px 10px 10px 10px;
    border-radius: 5px;
    background: @noti-bg-darker;
}

.widget-buttons-grid > flowbox > flowboxchild > button {
    margin: 3px;
    background: @cc-bg;
    border-radius: 5px;
    color: @text-color;
}

.widget-buttons-grid > flowbox > flowboxchild > button:hover {
    background: @color6;
    color: @cc-bg;
}

.widget-menubar > box > .menu-button-bar > button {
    border: none;
    background: transparent;
}

.topbar-buttons > button {
    border: none;
    background: transparent;
}

EOF
fi