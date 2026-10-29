import QtQuick
import Quickshell
import Quickshell.Hyprland
import ".." as Back

Row {
    id: root

    required property var screen

    spacing: Back.Theme.moduleSpacing

    readonly property var currentMonitor: Hyprland.monitorFor(screen)

    Repeater {
        model: Hyprland.workspaces.values.filter(
            ws => ws.id > 0 && ws.monitor === root.currentMonitor
        )

        delegate: Text {
            // Icon Style
            font.pixelSize: Back.Theme.fontSize

            required property HyprlandWorkspace modelData

            text: ""
            color: modelData.active && Hyprland.focusedMonitor?.name === root.currentMonitor?.name ? Back.Theme.textcolor : "#666666"

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