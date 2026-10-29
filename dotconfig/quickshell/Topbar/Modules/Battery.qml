import QtQuick
import Quickshell
import Quickshell.Services.UPower
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