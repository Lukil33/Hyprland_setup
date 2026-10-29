
import QtQuick
import Quickshell
import "Modules" as Modules

PanelWindow {
    id: root

    required property var modelData
    screen: modelData

    color: "transparent"
    implicitHeight: screen.height * Theme.barHeightRatio

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: Theme.topMargin
        left: Theme.horizontalMargin
        right: Theme.horizontalMargin
    }

    // Left panel
    Rectangle {
        id: leftPanel

        color: Theme.panelBackground
        radius: Theme.cornerRadius

        implicitWidth: leftModules.implicitWidth + Theme.panelPadding * 2
        implicitHeight: root.height * Theme.panelHeightRatio

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        Row {
            id: leftModules

            anchors.centerIn: parent
            spacing: Theme.moduleSpacing

            Modules.Settings {
                y: Theme.offsetModuleY
            }
            Modules.Clock {}
            Modules.Inhibitor {
                y: Theme.offsetModuleY
            }
            Modules.Updates {}
        }
    }

    // Center panel
    Rectangle {
        id: centerPanel

        color: Theme.panelBackground
        radius: Theme.cornerRadius

        implicitWidth: centerModules.implicitWidth + Theme.panelPadding * 2
        implicitHeight: root.height * Theme.panelHeightRatio

        anchors.centerIn: parent

        Row {
            id: centerModules

            anchors.centerIn: parent
            spacing: Theme.moduleSpacing

            Modules.Workspaces {
                screen: root.screen
            }
        }
    }

    // Right panel
    Rectangle {
        id: rightPanel

        color: Theme.panelBackground
        radius: Theme.cornerRadius

        implicitWidth: rightModules.implicitWidth + Theme.panelPadding * 2
        implicitHeight: root.height * Theme.panelHeightRatio

        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        Row {
            id: rightModules

            anchors.centerIn: parent
            spacing: Theme.moduleSpacing

            Modules.Cpu {}
            Modules.Monitor {}
            Modules.Brightness {}
            Modules.Volume {}
            Modules.Bluetooth {}
            Modules.Network {}
            Modules.Battery {}
            Modules.Logout {}
        }
    }
}