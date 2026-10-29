import QtQuick
import "State" as State
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
    text: "󰅢 " + State.UpdateState.updateCount
}