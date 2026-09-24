import QtQuick
import Quickshell
import Quickshell.Io

Text {
    id: root
    
    property string updateCount: "0"
    
    text: "󰅢 " + root.updateCount

    Process {
        id: updateProcess

        command: [
            "bash",
            "-c",
            "echo $(($(checkupdates 2>/dev/null | wc -l) + $(yay -Qua 2>/dev/null | wc -l)))"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                root.updateCount = text.trim()
            }
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true

        onTriggered: {
            updateProcess.running = true
        }
    }

    Component.onCompleted: {
        updateProcess.running = true
    }
}