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
      systemd.enable = true; 
      settings = {
        appLauncher.position = "top_left";
        bar = {
          showCapsule = false;
          widgets = {
            left = [ 
              {id = "Launcher";} 
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
              {id = "SystemMonitor";}
              {id = "Tray";}
              {id = "NotificationHistory";}
              {id = "Network";}
              {id = "Battery";}
              { # Clock
                formatHorizontal = "HH:mm ddd yyyy-MM-dd";
                id = "Clock";
                tooltipFormat = "HH:mm ddd yyyy-MM-dd";
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
