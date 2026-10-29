import QtQuick

QtObject {
    readonly property color background: "{{ base16.base00.default.hex }}"
    readonly property color foreground: "{{ base16.base05.default.hex }}"
    readonly property color primary: "{{ base16.base0d.default.hex }}"
    readonly property color activeBackground: "{{ base16.base04.default.hex }}"
    readonly property color onActiveBackground: "{{ base16.base00.default.hex }}"
}