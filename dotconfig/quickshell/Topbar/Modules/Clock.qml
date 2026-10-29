import QtQuick
import Quickshell
import "State" as State
import ".." as Back

Text {
    // Icon Style
    color: Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

    text: State.ClockState.clockText

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["korganizer"])
        }
    }
}