
pragma Singleton

import QtQuick

QtObject {
    // Colors
    readonly property color background: Colors.background
    readonly property color panelBackground: Qt.rgba(
        background.r,
        background.g,
        background.b,
        backgroundOpacity
    )
    readonly property real backgroundOpacity: 0.6
    readonly property color textcolor: Colors.foreground
    readonly property color activecolor: Colors.color4
    readonly property color inactivecolor: Colors.color2

    // Hover
    readonly property int hoverDuration: 500

    // Typography
    readonly property int fontSize: 14

    // Layout
    readonly property int moduleSpacing: 11
    readonly property int panelPadding: 13

    // Panel geometry
    readonly property int cornerRadius: 20
    readonly property real barHeightRatio: 0.05
    readonly property real panelHeightRatio: 0.625

    // Margins
    readonly property int topMargin: 4
    readonly property int horizontalMargin: 10

    // Module alignment
    readonly property int offsetModuleY: 3
}