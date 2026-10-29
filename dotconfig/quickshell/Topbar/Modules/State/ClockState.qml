pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property string clockText: ""

    function updateClock() {
        const now = new Date()

        clockText = Qt.formatDateTime(now, "HH:mm  ddd")

        clockTimer.interval =
            60000 - (now.getSeconds() * 1000 + now.getMilliseconds())
    }

    Timer {
        id: clockTimer

        interval: 60000
        running: true
        repeat: true

        onTriggered: root.updateClock()
    }

    Component.onCompleted: root.updateClock()
}
