#!/bin/bash

# === WRAPPER PER LANCIARE HYPRLOCK ===

# Valori di default se non sono già impostati
export XDG_SESSION_TYPE=wayland
export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-1}

# Avvia hyprlock
hyprlock