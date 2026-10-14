import QtQuick
import Quickshell
import Quickshell.Networking

Text {
    readonly property var activeDevice: {
        for (let i = 0; i < Networking.devices.values.length; i++) {
            const device = Networking.devices.values[i]

            if (device.connected)
                return device
        }

        return null
    }

    readonly property var activeNetwork:
        activeDevice ? activeDevice.networks.values.find(
            network => network.connected
        ) ?? null : null

    text: {
        if (!Networking.wifiEnabled)
            return ""

        if (!activeDevice)
            return "󰤮"

        if (activeDevice.type === DeviceType.Wired)
            return ""

        if (activeNetwork) {
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

        return "󰤮"
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["kitty", "-e", "nmtui"])
        }
    }
}