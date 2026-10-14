import QtQuick
import Quickshell

Text {
    id: root

    function updateClock() {
        const now = new Date()

        text = Qt.formatDateTime(now, "HH:mm ddd")

        clockTimer.interval = 60000 - (now.getSeconds() * 1000 + now.getMilliseconds())
    }

    Timer {
        id: clockTimer

        interval: 60000
        running: true
        repeat: true

        onTriggered: root.updateClock()
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