import QtQuick
import Quickshell
import Quickshell.Io

Text {
    id: root

    property int brightness: 0

    function readBrightness() {
        if (!readProcess.running)
            readProcess.running = true
    }

    Process {
        id: monitorProcess

        command: [
            "udevadm",
            "monitor",
            "--kernel",
            "--subsystem-match=backlight"
        ]

        running: true

        stdout: SplitParser {
            onRead: data => {
                if (data.includes("amdgpu_bl1"))
                    root.readBrightness()
            }
        }
    }

    Process {
        id: readProcess

        command: [
            "brightnessctl",
            "-m",
            "-d",
            "amdgpu_bl1"
        ]

        stdout: SplitParser {
            onRead: data => {
                const fields = data.trim().split(",")

                if (fields.length >= 3) {
                    const value = parseInt(fields[3].replace("%", ""))

                    if (!isNaN(value))
                        root.brightness = value
                }
            }
        }
    }

    text: {
        if (brightness <= 33)
            return "󰃞"
        if (brightness <= 66)
            return "󰃟"
        return "󰃠"
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["bash","-c","~/.config/quickshell/script/script_brightness.sh"])
        }
    }

    Component.onCompleted: root.readBrightness()
}