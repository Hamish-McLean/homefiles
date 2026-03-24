/*
Noctalia shell
*/
{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia-catppuccin.nix
  ];

  options = {
    noctalia.enable = lib.mkEnableOption "enable noctalia";
  };

  config = lib.mkIf config.noctalia.enable {
    programs.noctalia-shell = {
      enable = true;
      plugins = {
        sources = [{
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }];
        states = {
          battery-actions.enabled = true;
          catwalk.enabled = true;
          kde-connect.enabled = true;
          tailscale.enabled = true;
          weather-indicator.enabled = true;
          workspace-overview.enabled = true;
        };
        version = 2;
      };
      pluginSettings = {
        tailscale = {
          compactMode = true;
          terminalCommand = "kitty";
        };
      };
      systemd.enable = true; 
      settings = {
        appLauncher.position = "top_left";
        bar = {
          showCapsule = false;
          widgets = {
            left = [ 
              {id = "Launcher";} 
              {id = "plugin:workspace-overview";}
              { # Workspace
                id = "Workspace";
                showApplications = true;
              }
              {id = "ActiveWindow";}
            ];
            center = [
              {id = "MediaMini";}
            ];
            right = [
              {id = "plugin:catwalk";}
              {id = "SystemMonitor";}
              {id = "Tray";}
              {id = "kde-connect";}
              {id = "plugin:tailscale";}
              {id = "Network";}
              {id = "Bluetooth";}
              { # Battery
                displayMode = "alwaysShow";
                id = "Battery";
                showPowerProfiles = true;
              }
              { # Clock
                formatHorizontal = "HH:mm ddd yyyy-MM-dd";
                id = "Clock";
                tooltipFormat = "HH:mm ddd yyyy-MM-dd";
              }
              {id = "plugin:weather-indicator";}
              { # NotificationHistory
                hideWhenZero = true;
                id = "NotificationHistory";
              }
              { # ControlCenter
                id = "ControlCenter";
                useDistroLogo = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Catppuccin Custom"; # switch to custom theme with accent
        general = {
          forceBlackScreenCorners = true;
          showScreenCorners = true;
        };
        location.name = "Tunbridge Wells";
        ui.panelBackgroundOpacity = 1;
        wallpaper = {
          enabled = true;
          directory = toString ../wallpapers;
          automationEnabled = true;
          randomIntervalSec = 3600;
        };
      };
    };
  };
}
