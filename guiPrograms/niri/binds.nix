{ ... }:
{
  # General
  "Mod+Q".action.close-window = [ ];
  "Mod+Space".action.toggle-column-tabbed-display = [ ];
  "Mod+Tab".action.focus-window-down-or-column-right = [ ];
  "Mod+Shift+Tab".action.focus-window-up-or-column-left = [ ];
  "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];

  # Launch apps
  "Mod+Alt+T".action.spawn-sh = "$TERMINAL";
  "Mod+Alt+I".action.spawn-sh = "$BROWSER";
  "Mod+Alt+S".action.spawn = "steam";
  "Mod+Alt+Space".action.spawn = "walker";

  # Noctalia
  "Mod+Ctrl+Alt+L".action.spawn-sh = "noctalia msg session lock";
  "Mod+Ctrl+Alt+S".action.spawn-sh = "noctalia msg settings-toggle";
  "Mod+Ctrl+Alt+C".action.spawn-sh = "noctalia msg caffeine-toggle";
  "Mod+Shift+Escape".action.spawn-sh = "noctalia msg panel-toggle session";
  "Mod+V".action.spawn-sh = "noctalia msg panel-toggle clipboard";
  # "Mod+F1".action.spawn-sh = "noctalia ipc call plugin:keybind-cheatsheet toggle";
  # "Mod+Alt+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";

  # Navigation
  # Focus
  "Mod+Left".action.focus-window-up-or-column-left = [ ];
  "Mod+H".action.focus-window-up-or-column-left = [ ];
  "Mod+WheelScrollUp".action.focus-window-up-or-column-left = [ ];
  "Mod+Right".action.focus-window-down-or-column-right = [ ];
  "Mod+L".action.focus-window-down-or-column-right = [ ];
  "Mod+WheelScrollDown".action.focus-window-down-or-column-right = [ ];
  "Mod+Shift+Left".action.focus-monitor-left = [ ];
  "Mod+Shift+Right".action.focus-monitor-right = [ ];
  "Mod+Page_Up".action.focus-workspace-up = [ ];
  "Mod+Page_Down".action.focus-workspace-down = [ ];
  "Mod+Shift+WheelScrollUp".action.focus-workspace-up = [ ];
  "Mod+Shift+WheelScrollDown".action.focus-workspace-down = [ ];
  # Movement
  "Mod+Ctrl+Left".action.move-column-left = [ ];
  "Mod+Ctrl+H".action.move-column-left = [ ];
  "Mod+Ctrl+WheelScrollUp".action.move-column-left = [ ];
  "Mod+Ctrl+Right".action.move-column-right = [ ];
  "Mod+Ctrl+L".action.move-column-right = [ ];
  "Mod+Ctrl+WheelScrollDown".action.move-column-right = [ ];
  "Mod+Ctrl+Up".action.move-window-up = [ ];
  "Mod+Ctrl+J".action.move-window-up = [ ];
  "Mod+Ctrl+Down".action.move-window-down = [ ];
  "Mod+Ctrl+K".action.move-window-down = [ ];
  "Mod+Ctrl+Shift+Left".action.move-column-to-monitor-left = [ ];
  "Mod+Ctrl+Shift+Right".action.move-column-to-monitor-right = [ ];
  "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [ ];
  "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
  "Mod+Shift+Page_Up".action.move-workspace-up = [ ];
  "Mod+Shift+Page_Down".action.move-workspace-down = [ ];
  "Mod+Shift+Ctrl+Alt+Left".action.move-workspace-to-monitor-left = [ ];
  "Mod+Shift+Ctrl+Alt+Right".action.move-workspace-to-monitor-right = [ ];
  # Size
  "Mod+Comma".action.consume-or-expel-window-left = [ ];
  "Mod+Period".action.consume-or-expel-window-right = [ ];
  "Mod+R".action.switch-preset-column-width = [ ];
  "Mod+F".action.maximize-column = [ ];
  # "Mod+Shift+F".action.toggle-windowed-fullscreen = [ ];
  "Mod+Shift+F".action.fullscreen-window = [ ];
  "Mod+Minus".action.set-column-width = "-10%";
  "Mod+Equal".action.set-column-width = "+10%";
  #Floating
  "Mod+W".action.toggle-window-floating = [ ];
  "Mod+Shift+W".action.switch-focus-between-floating-and-tiling = [ ];
  "Mod+C".action.center-window = [ ];

  # Buttons
  "XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
  "XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
  "Ctrl+XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
  "XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
  "Ctrl+XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
  "XF86MonBrightnessDown".action.spawn-sh = "brightnessctl set 10%-";
  "XF86MonBrightnessUp".action.spawn-sh = "brightnessctl set 10%+";
  "XF86Tools".action.spawn-sh = "noctalia msg settings-toggle";
}
