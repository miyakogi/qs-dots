import Quickshell

ShellRoot {

  property var color: Quickshell.env("XDG_CURRENT_DESKTOP").includes("niri") ? "#181616" : "#000000"

  Desktop {
    screenName: "DP-1"
    desktopColor: color
  }

  Desktop {
    screenName: "HDMI-A-1"
    desktopColor: color
  }
}
