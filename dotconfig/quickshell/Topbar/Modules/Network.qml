
import QtQuick
import Quickshell
import Quickshell.Networking
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
    id: root

    readonly property var connectedDevices:
        Networking.devices.values.filter(
            device => device.connected
        )

    readonly property var wiredDevice:
        connectedDevices.find(
            device => device.type === DeviceType.Wired
        ) ?? null

    readonly property var wifiDevice:
        Networking.devices.values.find(
            device => device.type === DeviceType.Wifi
        ) ?? null

    readonly property var activeNetwork:
        wifiDevice?.networks.values.find(
            network => network.connected
        ) ?? null

    readonly property real signalStrength:
        activeNetwork?.signalStrength ?? 0

    text: {
        // Ethernet connessa
        if (wiredDevice)
            return ""

        // Wi-Fi disattivato
        if (!Networking.wifiEnabled)
            return ""

        // Wi-Fi attivo ma senza connessione
        if (!activeNetwork)
            return "󰤮"

        // Intensità del segnale Wi-Fi: da 0 a 1
        if (signalStrength <= 0.2)
            return "󰤯"

        if (signalStrength <= 0.4)
            return "󰤟"

        if (signalStrength <= 0.6)
            return "󰤢"

        if (signalStrength <= 0.8)
            return "󰤥"

        return "󰤨"
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached([
                "kitty",
                "-e",
                "nmtui"
            ])
        }
    }
}