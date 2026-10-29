import QtQuick
import Quickshell
import Quickshell.Wayland
import "State" as State
import ".." as Back

Text {
    // Icon Style
    color: Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

    id: root

    text: State.IdleState.activated ? "󰒳" : "󰒲"

    IdleInhibitor {
        window: root.QsWindow.window
        enabled: State.IdleState.activated
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            State.IdleState.activated = !State.IdleState.activated
        }
    }
}