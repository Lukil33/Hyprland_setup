import QtQuick
import Quickshell
import Quickshell.Io

Text {
    text: "󰃠"

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["bash","-c","~/.config/quickshell/script/script_brightness.sh"])
        }
    }
}