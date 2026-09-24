import QtQuick
import Quickshell
import Quickshell.Wayland

Text {
    id: root

    property bool activated: false

    text: activated ? "󰒳" : "󰒲"

    IdleInhibitor {
        id: inhibitor

        window: root.QsWindow.window
        enabled: root.activated
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            root.activated = !root.activated
        }
    }
}