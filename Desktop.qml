import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

Variants {
  required property string screenName

  model: [Quickshell.screens.find(s => s.name == screenName)]

  StyledWindow {
    id: win

    required property ShellScreen modelData
    screen: modelData

    name: "desktop"
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    mask: Region {
      x: 4
      y: 4
      width: win.width - 4 * 2
      height: win.height - 4 * 2
      intersection: Intersection.Xor
    }

    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    StyledRect {
      anchors.fill: parent
      opacity: 0.0
      color: "black"
    }

    Item {
      id: background

      anchors.fill: parent
      visible: false

      Border {
        isMain: screenName == "DP-1"
      }
    }

    MultiEffect {
      anchors.fill: source
      source: background
      shadowEnabled: true
      blurMax: 15
      shadowColor: Qt.alpha("black", 0.9)
    }
  }
}
