import QtQuick
import Quickshell
import Quickshell.Hyprland

Row {
    id: root

    spacing: 6

    Repeater {
        model: Hyprland.workspaces.values.filter(ws => ws.id > 0)

        delegate: Text {
            required property HyprlandWorkspace modelData

            text: ""
            color: modelData.active ? "white" : "#666666"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    modelData.activate()
                }
            }
        }
    }
}