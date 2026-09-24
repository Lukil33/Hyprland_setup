import QtQuick
import Quickshell
import Quickshell.Io

Text {
    text: ""

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["bash","-c","~/.config/rofi/Monitor/rofi-reload-monitor"])
        }
    }
}
