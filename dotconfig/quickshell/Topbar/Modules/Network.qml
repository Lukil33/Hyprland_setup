import QtQuick
import Quickshell
import Quickshell.Networking
import ".." as Back

Text {
    // Icon Style
    color: Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

    readonly property var connectedDevices: {
        return Networking.devices.values.filter(
            device => device.connected
        )
    }

    readonly property var wiredDevice: {
        return connectedDevices.find(
            device => device.type === DeviceType.Wired
        ) ?? null
    }

    readonly property var wifiDevice: {
        return connectedDevices.find(
            device => device.type !== DeviceType.Wired
        ) ?? null
    }

    text: {
        if (!wiredDevice && !wifiDevice) {
            return Networking.wifiEnabled ? "󰤮" : ""
        }

        if (wiredDevice) {
            return ""
        }

        const strength = activeNetwork.signalStrength * 100

        if (strength <= 20)
            return "󰤯"
        if (strength <= 40)
            return "󰤟"
        if (strength <= 60)
            return "󰤢"
        if (strength <= 80)
            return "󰤥"

        return "󰤨"
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["kitty", "-e", "nmtui"])
        }
    }
}