import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
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
    PwObjectTracker { objects: [Pipewire.defaultAudioSink] }

    readonly property var sink: Pipewire.defaultAudioSink

    readonly property var sinkProperties: sink && sink.ready ? sink.properties : ({})

    readonly property bool isBluetooth: sinkProperties["device.api"] === "bluez5"

    readonly property string deviceName: (
        (sink ? sink.name : "") + " " +
        (sink ? sink.description : "") + " " +
        (sink ? sink.nickname : "") + " " +
        (sinkProperties["node.name"] || "") + " " +
        (sinkProperties["node.description"] || "") + " " +
        (sinkProperties["device.description"] || "") + " " +
        (sinkProperties["device.name"] || "") + " " +
        (sinkProperties["device.form-factor"] || "")
    ).toLowerCase()
    readonly property real volume: sink && sink.audio ? sink.audio.volume*100 : 0

    text: {
        if (!sink || !sink.audio || sink.audio.muted)
            return ""

        if (isBluetooth)
            return ""

        if (deviceName.includes("headphone") || deviceName.includes("headset") || deviceName.includes("cuffie") || deviceName.includes("earbuds"))
            return ""

        if (deviceName.includes("phone"))
            return ""

        if (deviceName.includes("car"))
            return ""

        if (volume < 5)
            return ""
        if (volume < 25)
            return ""
        if (volume < 50)
            return ""
        if (volume < 75)
            return ""
        return ""
    }

    MouseArea {
        anchors.fill: parent
        
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["pavucontrol"])
        }
    }
}