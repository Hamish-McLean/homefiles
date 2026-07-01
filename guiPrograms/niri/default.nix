# Niri
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
    # ../noctalia.nix
  ];

  options = {
    niri.enable = lib.mkEnableOption "enable niri";
  };

  config = lib.mkIf config.niri.enable {
    noctalia.enable = true;
    programs.niri.enable = true;

    programs.niri.settings = {
      #mod-key-rebind = [ "noctalia" "ipc" "call" "launcher" "toggle" ]; doesn't work
      binds = import ./binds.nix { };
      environment = {
        "QT_QPA_PLATFORMTHEME" = "qt5ct";
        "QT_QPA_PLATFORM" = "wayland";
      };
      hotkey-overlay.skip-at-startup = true;
      input = {
        focus-follows-mouse.enable = true;
        keyboard.xkb.layout = "gb";
      };
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
        "eDP-1" = {
          backdrop-color = "#11111b";
          position = {
            x = 0;
            y = 0;
          };
          scale = 1;
        };
        "DP-2" = {
          backdrop-color = "#11111b";
          position = {
            x = 1920;
            y = 0;
          };
          scale = 1;
          variable-refresh-rate = true;
        };
        "HDMI-A-1" = {
          backdrop-color = "#11111b";
          position = {
            x = 3840;
            y = -600;
          };
          scale = 1;
          transform.rotation = 270;
        };
        # "HDMI-A-2" = {
        #   position = {
        #     right-of = "HDMI-A-1";
        #   };
        #   scale = 1;
        # };
      };
      overview.backdrop-color = "#11111b"; # Mocha crust
      prefer-no-csd = true; # no client-side decorations
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
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
        # Firefox
        {
          matches = [ { app-id = "^firefox$"; } ];
          excludes = [ { title = "^Extension:"; } ];
          focus-ring.active.color = "#fab387"; # peach
          default-column-width.proportion = 2.0 / 3.0;
        }
        # Obsidian
        {
          matches = [ { app-id = "^obsidian$"; } ];
          focus-ring.active.color = "#cba6f7"; # mauve
          default-column-width.proportion = 2.0 / 3.0;
        }
        # Bitwarden
        {
          matches = [
            {
              app-id = "^firefox$";
              title = "Bitwarden";
            }
          ];
          focus-ring.active.color = "#89b4fa"; # blue
          open-floating = true; # Floating doesn't work but the blue focus ring does work...
          default-column-width.proportion = 1.0 / 3.0;
          default-window-height.proportion = 2.0 / 3.0;
          # default-floating-position = {};
        }
        # Steam
        {
          matches = [
            { app-id = "^gamescope$"; }
            { app-id = "^steam_app_"; }
          ];
          open-fullscreen = true;
        }
      ];
      xwayland-satellite.enable = true;
      xwayland-satellite.path = lib.getExe pkgs.unstable.xwayland-satellite;
    };
  };
}
