import QtQuick
import "State" as State
import ".." as Back

Text {
    // Icon Style
    color: Back.Theme.textcolor
    font.pixelSize: Back.Theme.fontSize

    text: "󰅢 " + State.UpdateState.updateCount
}