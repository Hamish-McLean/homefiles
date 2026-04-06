# Niri
{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
    ./noctalia.nix
  ];

  options = {
    niri.enable = lib.mkEnableOption "enable niri";
  };

  config = lib.mkIf config.niri.enable {
    noctalia.enable = true;
    programs.niri.enable = true;

    programs.niri.settings = {
      #mod-key-rebind = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ]; doesn't work
      binds = {
        # General
        "Mod+T".action.spawn = "kitty";
        "Mod+I".action.spawn = "firefox";
        "Mod+Q".action.close-window = [ ];
        "Mod+Alt+L".action.spawn-sh = "noctalia-shell ipc call lockScreen lock";
        "Mod+S".action.spawn-sh = "noctalia-shell ipc call settings toggle";
        "Mod+Space".action.toggle-column-tabbed-display = [ ];
        "Mod+Tab".action.focus-window-down-or-column-right = [ ];
        "Mod+Shift+Tab".action.focus-window-up-or-column-left = [ ];
        "Mod+F1".action.spawn-sh = "noctalia-shell ipc call plugin:keybind-cheatsheet toggle";
        "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
        "Mod+Alt+Space".action.spawn-sh = "noctalia-shell ipc call launcher toggle";

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
        # Movement
        "Mod+Ctrl+Left".action.move-column-left = [ ];
        "Mod+Ctrl+H".action.move-column-left = [ ];
        "Mod+Ctrl+Right".action.move-column-right = [ ];
        "Mod+Ctrl+L".action.move-column-right = [ ];
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
        "Mod+V".action.toggle-window-floating = [ ];
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [ ];
        "Mod+C".action.center-window = [ ];

        # Buttons
        "XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        "Ctrl+XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
        "XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
        "Ctrl+XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
        "XF86MonBrightnessDown".action.spawn-sh = "brightnessctl set 10%-";
        "XF86MonBrightnessUp".action.spawn-sh = "brightnessctl set 10%+";
        "XF86Tools".action.spawn-sh = "noctalia-shell ipc call settings toggle";
      };
      input.focus-follows-mouse.enable = true;
      layout = {
        # default-column-width = { proportion = 1.0 / 2.0; };
        focus-ring = {
          active.color = "#74c7ec";
          inactive.color = "#181825";
          urgent.color = "#f38ba8";
          width = 2;
        };
        preset-column-widths = [
          { proportion = 1.0 / 3.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 2.0 / 3.0; }
          { proportion = 1.0 / 1.0; }
        ];
        shadow = {
          enable = true;
          color = "#11111b";
        };
      };
      outputs = {
        "eDP-1".scale = 1; # Laptop screen
        "HDMI-A-2".scale = 1; # External screen
      };
      overview.backdrop-color = "#11111b"; # Mocha crust
      prefer-no-csd = true; # no client-side decorations
      spawn-at-startup = [
        # { command = [ "noctalia-shell" ]; }
      ];
      # switch-events = {
      #   lid-open.action = sh "notify-send lid-open";
      #   lid-close.action = sh "notify-send lid-close";
      # };
      window-rules = [
        {
          clip-to-geometry = true;
          # geometry-corner-radius = { radius = 12; };
          geometry-corner-radius =
            let
              r = 12.0;
            in
            {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
        }
        {
          matches = [ { app-id = "^firefox$"; } ];
          focus-ring.active.color = "#fab387"; # peach
          default-column-width.proportion = 2.0 / 3.0;
        }
        {
          matches = [ { app-id = "^obsidian$"; } ];
          focus-ring.active.color = "#cba6f7"; # mauve
          default-column-width.proportion = 2.0 / 3.0;
        }
      ];
    };
  };
}
