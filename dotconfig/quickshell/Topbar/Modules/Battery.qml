import QtQuick
import Quickshell
import Quickshell.Services.UPower

Text {
    property int goodThreshold: 95
    property int warningThreshold: 20
    property int criticalThreshold: 10

    readonly property bool charging: (UPower.onBattery === false)

    readonly property var batteryIcons: [
        "󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾",
        "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"
    ]

    text: {
        if (!UPower.displayDevice.ready)
            return "󰂑"

        if (charging)
            return ""

        const index = Math.min(10, Math.floor(Math.round(UPower.displayDevice.percentage*10)))

        return batteryIcons[index]
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["sh", "-c", 'exec "$HOME/.config/rofi/Battery/rofi-battery"'])
        }
    }
}