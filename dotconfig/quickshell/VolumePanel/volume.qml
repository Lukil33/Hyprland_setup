import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Services.Pipewire

ShellRoot {
    property bool panelVisible: true

    PwObjectTracker {
        id: audioTracker

        objects: [Pipewire.defaultAudioSink]
    }

    Timer {
        id: hideTimer

        interval: 5000 // milliseconds

        repeat: false

        onTriggered: {
            panelVisible = false
        }
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onVolumeChanged() {
            // Show the panel
            panelVisible = true

            // Start counting the 3 seconds again
            hideTimer.restart()
        }
    }

    PanelWindow {
        implicitWidth: 300
        implicitHeight: 100

        Rectangle {
            opacity: panelVisible ? 1 : 0
            anchors.fill: parent

            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }

            // Don't allow interaction while hidden
            enabled: panelVisible

            property color background: "#202020"

            color: background
            radius: 12

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    panelVisible = true
                    hideTimer.restart()
                }
            }

            Text {
                text: "Volume: " + Math.round( Pipewire.defaultAudioSink.audio.volume * 100 ) + "%"
                color: "white"
                font.pixelSize: 20
            }

            Slider {
                id: volumeSlider

                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    margins: 15
                }

                from: 0
                to: 100
                stepSize: 1

                // Get the current system volume
                value: Pipewire.defaultAudioSink.audio.volume * 100


                // When the slider moves,
                // change the actual system volume
                onMoved: {
                    Pipewire.defaultAudioSink.audio.volume = value / 100

                    // Keep the panel visible while using it
                    panelVisible = true
                    hideTimer.restart()
                }
            }
        }
    }
}