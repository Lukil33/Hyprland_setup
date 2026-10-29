import QtQuick
import Quickshell
import Quickshell.Bluetooth
import ".." as Back

Text {
    // Icon Style
    color: mouseHover.hovered ? Back.Theme.activecolor : Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

    Behavior on color {
        ColorAnimation {
            duration: Back.Theme.hoverDuration
            easing.type: Easing.OutCubic
        }
    }

    HoverHandler {
        id: mouseHover
    }

    // Icon Logic
    readonly property bool powered: Bluetooth.defaultAdapter !== null && Bluetooth.defaultAdapter.enabled

    readonly property bool connected: Bluetooth.devices.values.some(device => device.connected)

    text: {
        if (!powered)
            return "󰂲"
        if (connected)
            return "󰂱"
        return "󰂯"
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: Quickshell.execDetached(["blueman-manager"])
    }
}