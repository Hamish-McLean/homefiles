/*
Niri
*/
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
    programs.niri = {
      enable = true;

      settings = {
        #mod-key-rebind = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ]; doesn't work
        binds = {
          "Mod+T".action.spawn = "kitty";
          "Mod+I".action.spawn = "firefox";
          "Mod+Q".action.close-window = [ ];
          "Mod+L".action.spawn = "blurred-locker";
          "Mod+Space".action.toggle-column-tabbed-display = [ ];
          "Mod+Tab".action.focus-window-down-or-column-right = [ ];
          "Mod+Shift+Tab".action.focus-window-up-or-column-left = [ ];
          "Mod+F".action.maximize-column = [ ];
          "Mod+Shift+F".action.toggle-windowed-fullscreen = [ ];

          "XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          "XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          "Ctrl+XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
          "Ctrl+XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
          "XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86MonBrightnessUp".action.spawn-sh = "brightnessctl set 10%+";
          "XF86MonBrightnessDown".action.spawn-sh = "brightnessctl set 10%-";
        };
        input.focus-follows-mouse.enable = true;
        layout = {
          focus-ring = {
            active.color = "#74c7ec";
            inactive = null;
            urgent.color = "#74c7ec";
            width = 2;
          };

          # preset-column-widths
        };
        outputs = {
          "eDP-1".scale = 1; # Laptop screen
          "HDMI-A-2".scale = 1; # External screen
        };
        prefer-no-csd = true; # no client-side decorations
        spawn-at-startup = [
          { command = [ "noctalia-shell" ]; }
        ];
      };
    };
  };
}
