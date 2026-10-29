import QtQuick
import Quickshell
import Quickshell.Io
import ".." as Back

Text {
    // Icon Style
    color: Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

    text: ""

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["wlogout","--buttons-per-row=5","--column-spacing", "10"])
        }
    }
}