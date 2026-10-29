import QtQuick
import Quickshell
import "Modules" as Modules

PanelWindow {

    margins {
        top: 4
        left: 10
        right: 10
    }

    required property var modelData
    screen: modelData

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
        // Themes
        color: Theme.background
        radius: Theme.cornerRadius

        implicitWidth: left_mod.width+20
        implicitHeight: root.height/1.5

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        Row {
            id: left_mod

            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter

            spacing: Theme.moduleSpacing

            // List of modules
            Modules.Settings{y: 3}
            Modules.Clock{}
            Modules.Inhibitor{y: 3}
            Modules.Updates{}
        }
    }

    // Central panel
    Rectangle {
        // Themes
        color: Theme.background
        radius: Theme.cornerRadius

        implicitWidth: central_mod.width+20
        implicitHeight: root.height/1.5

        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        
        Row {
            id: central_mod

            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter

            spacing: Theme.moduleSpacing

            Modules.Workspaces{ screen: root.screen }
        }
    }

    // Right panel
    Rectangle {
        // Themes
        color: Theme.background
        radius: Theme.cornerRadius

        implicitWidth: right_mod.width+20
        implicitHeight: root.height/1.5

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Row {
            id: right_mod

            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter

            spacing: Theme.moduleSpacing

            // List of modules
            Modules.Cpu{}
            Modules.Monitor{}
            Modules.Brightness{}
            Modules.Volume{}
            Modules.Bluetooth{}
            Modules.Network{}
            Modules.Battery{}
            Modules.Logout{}
        }
    }
}