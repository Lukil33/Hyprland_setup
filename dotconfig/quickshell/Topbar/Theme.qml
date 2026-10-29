pragma Singleton

import QtQuick

QtObject {
    readonly property color background: "#1e1e2e" // Utilizzata ovunque
    readonly property color textcolor: "#cdd6f4" // Utilizzata ovunque // manca acora da modificare il workspaces perchè devi trovare un colore per le celle disattivate

    readonly property int fontSize: 14
    readonly property int moduleSpacing: 11
    readonly property int cornerRadius: 20
}