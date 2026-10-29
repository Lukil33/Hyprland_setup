pragma Singleton

import QtQuick

QtObject {
    readonly property color foreground: "{{ colors.on_background.default.hex }}"
    readonly property color background: "{{ colors.background.default.hex }}"
    readonly property color cursor: "{{ colors.on_background.default.hex }}"
    
    readonly property color color0: "{{ base16.base00.default.hex }}"
    readonly property color color1: "{{ base16.base01.default.hex }}"
    readonly property color color2: "{{ base16.base02.default.hex }}"
    readonly property color color3: "{{ base16.base03.default.hex }}"
    readonly property color color4: "{{ base16.base04.default.hex }}"
    readonly property color color5: "{{ base16.base05.default.hex }}"
    readonly property color color6: "{{ base16.base06.default.hex }}"
    readonly property color color7: "{{ base16.base07.default.hex }}"
    readonly property color color8: "{{ base16.base08.default.hex }}"
    readonly property color color9: "{{ base16.base09.default.hex }}"
    readonly property color color10: "{{ base16.base0a.default.hex }}"
    readonly property color color11: "{{ base16.base0b.default.hex }}"
    readonly property color color12: "{{ base16.base0c.default.hex }}"
    readonly property color color13: "{{ base16.base0d.default.hex }}"
    readonly property color color14: "{{ base16.base0e.default.hex }}"
    readonly property color color15: "{{ base16.base0f.default.hex }}"
}