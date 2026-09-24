import QtQuick
import Quickshell
import Quickshell.Wayland
import "Topbar" as Topbar

ShellRoot {
    id: root

    Variants {
        model: Quickshell.screens
        Topbar.Topbar{}
    }
    
}