pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string updateCount: "0"

    Process {
        id: updateProcess

        command: [
            "bash",
            "-c",
            "echo $(($(checkupdates 2>/dev/null | wc -l) + $(yay -Qua 2>/dev/null | wc -l)))"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                root.updateCount = this.text.trim()
            }
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true

        onTriggered: {
            if (!updateProcess.running) {
                updateProcess.running = true
            }
        }
    }

    Component.onCompleted: {
        updateProcess.running = true
    }
}