import QtQuick
import Quickshell
import Quickshell.Io
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
    text: ""

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["kitty", "-e", "btop"])
        }
    }
}
