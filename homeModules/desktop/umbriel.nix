{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.umbriel.homeModules.default ];

  options = {
    umbriel.enable = lib.mkEnableOption "enable umbriel";
  };

  config = lib.mkIf config.umbriel.enable {
    programs.umbriel = {
      enable = true;
      settings = {
        # appearance
        # environment = {};
        general = {
          autostart = [ "noctalia" ];
          focus_on_activate = true;
          honor_restored_maximize = true;
          show_cheatsheet = true;
        };
        hot_corners = {
          top_left = {
            action = "overview-toggle";
            enabled = true;
          };
        };
        input = {
          focus = {
            follows_mouse = true;
          };
        };
        keybinds = {
          "Mod" = "spawn:walker";
          "Mod+Return" = "spawn:kitty";
          "Mod+Shift+Return" = "spawn:firefox";
          "Mod+Q" = "window-close";
        };
        layout = {
          mode = "scrolling"; # or "dwindle"
        };
        output = {
          "DP-2" = {
            hdr = "auto";
            position = [
              0
              0
            ];
            vrr = "always"; # or "fullscreen"
          };
          "HDMI-A-1" = {
            position = [
              1920
              (-600)
            ];
            transform = "270";
          };
        };
        workspaces.back_and_forth = true;
      };
    };
  };
}
