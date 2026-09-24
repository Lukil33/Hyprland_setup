import QtQuick
import Quickshell
import Quickshell.Io

Text {
    text: ""

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["swaync-client", "-t"])
        }
    }
}
