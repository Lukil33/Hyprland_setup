import QtQuick
import Quickshell
import Quickshell.Bluetooth
import ".." as Back

Text {
    // Icon Style
    color: Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

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