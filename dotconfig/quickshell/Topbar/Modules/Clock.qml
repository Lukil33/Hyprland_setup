import QtQuick
import Quickshell

Text {
    id: root

    text: Qt.formatDateTime(new Date(), "HH:mm ddd")

    Timer {
        interval: 30000
        running: true
        repeat: true

        onTriggered: {
            root.text = Qt.formatDateTime(new Date(), "HH:mm ddd")
        }
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["korganizer"])
        }
    }

    Component.onCompleted: root.updateClock()
}