import QtQuick
import Quickshell
import "Modules" as Modules

PanelWindow {
    required property var modelData
    screen: modelData

    // Temporal
    property string textcolor: "white"

    id: root
    color: "transparent"

    // Panel position and size
    implicitHeight: screen.height * 0.05
    anchors {
        top: true
        left: true
        right: true
    }

    // Left panel
    Rectangle {
        implicitWidth: left_mod.width+20
        implicitHeight: root.height/1.5
        color: "black"

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        Row {
            id: left_mod

            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter

            spacing: 10

            // List of modules
            Modules.Settings{color: textcolor}
            Modules.Clock{color: textcolor}
            Modules.Inhibitor{color: textcolor}
            Modules.Updates{color: textcolor}
        }
    }

    // Central panel
    Rectangle {
        implicitWidth: central_mod.width+20
        implicitHeight: root.height/1.5
        color: "black"

        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        
        Row {
            id: central_mod

            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter

            spacing: 10

            Modules.Workspaces{}
        }
    }

    // Right panel
    Rectangle {
        implicitWidth: right_mod.width+20
        implicitHeight: root.height/1.5
        color: "black"

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Row {
            id: right_mod

            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter

            spacing: 10

            // List of modules
            Modules.Cpu{color: textcolor}
            Modules.Monitor{color: textcolor}
            Modules.Brightness{color: textcolor}
            Modules.Audio{color: textcolor}
            Modules.Bluetooth{color: textcolor}
            Modules.Network{color: textcolor}
            Modules.Battery{color: textcolor}
            Modules.Logout{color: textcolor}
        }
    }
}