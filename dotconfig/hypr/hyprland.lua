-- Config Hyprland per Hyprland 0.55+

------------------
---- MONITORS ----
------------------

require("monitor")

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"

-------------------
---- AUTOSTART ----
-------------------
-- Vedi https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("~/.config/hypr/script/check_battery.sh")
    hl.exec_cmd("~/.config/hypr/script/keyboard_layout.sh")
    hl.exec_cmd("~/.config/hypr/script/hypridle_ignore.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita-dark")

-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = require("colors-hyprland")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = colors.color4,
            inactive_border = colors.color1,
        },

        -- Se true, permette di ridimensionare le finestre trascinando bordi/gaps
        resize_on_border = false,

        -- Vedi https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ prima di attivarlo
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 10,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- era rgba(1a1a1aee)
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curve di default, vedi https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1.0} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1} } })

hl.animation({ leaf = "global",         enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",         enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",        enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",         enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",   enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut",  enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
})

----------------
---- MISC ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,  -- 0 o 1 per disabilitare gli sfondi anime
        disable_hyprland_logo  = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "custom_it",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 = nessuna modifica

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 1.5,
        },
    },
})

-- Cambia workspace con swipe orizzontale a 3 dita
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "vertical",   action = "fullscreen" })

-- Esempio di config per-dispositivo
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Tasto "Windows" come modificatore principale

-- Applicazioni
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd("firefox"))
hl.bind("CTRL + ALT + S", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + ALT + D", hl.dsp.exec_cmd(fileManager))
hl.bind("CTRL + ALT + C", hl.dsp.exec_cmd("spotify"))
hl.bind("CTRL + ALT + Z", hl.dsp.exec_cmd("zapzap"))
hl.bind("CTRL + ALT + X", hl.dsp.exec_cmd("Telegram"))

-- Funzionalità
hl.bind("CTRL + " .. mainMod .. " + C", hl.dsp.window.close())
hl.bind("CTRL + " .. mainMod .. " + Q", hl.dsp.exec_cmd("~/.config/hypr/script/move_workspace_to_monitor.sh"))
hl.bind("CTRL + " .. mainMod .. " + X", hl.dsp.layout("togglesplit")) -- solo dwindle
hl.bind("CTRL + " .. mainMod .. " + Z", hl.dsp.window.float({ action = "toggle" }))

-- Moduli Rofi (volume e luminosità più in basso)
hl.bind(mainMod .. " + " .. mainMod .. "_L", hl.dsp.exec_cmd("pkill rofi || " .. menu))
hl.bind("CTRL + " .. mainMod .. " + A", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/Bluetooth/rofi-bluetooth"))
hl.bind("CTRL + " .. mainMod .. " + S", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/Network/rofi-network"))
hl.bind("CTRL + " .. mainMod .. " + D", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/Battery/rofi-battery"))
hl.bind("CTRL + " .. mainMod .. " + W", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/Monitor/rofi-monitor"))
hl.bind("Print", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/Screen/rofi-screen"))

-- Sposta il focus con le frecce
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Cambia workspace con mainMod + [1-9]
-- Sposta finestra attiva su workspace con mainMod + SHIFT + [1-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + backslash", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + backslash", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scorri i workspace con mainMod + rotellina
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Sposta/ridimensiona finestre con mainMod + tasto sx/dx del mouse e trascinamento
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Tasti multimediali laptop per volume e luminosità LCD
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd([[bash -c 'vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk "{print \$2}"); if (( $(echo "$vol < 1.0" | bc -l) )); then wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+; fi; pkill rofi; ~/.config/rofi/Volume/rofi-volume']]),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("bash -c 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-; pkill rofi; ~/.config/rofi/Volume/rofi-volume'"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("bash -c 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; pkill rofi; ~/.config/rofi/Volume/rofi-volume'"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("bash -c 'brightnessctl s 10%+; pkill rofi; ~/.config/rofi/Brightness/rofi-brightness'"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("bash -c 'brightnessctl s 10%-; pkill rofi; ~/.config/rofi/Brightness/rofi-brightness'"),
    { locked = true, repeating = true })

-- Richiede playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })