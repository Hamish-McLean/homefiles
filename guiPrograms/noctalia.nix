# Noctalia shell
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
    programs.noctalia-shell.enable = true;
    programs.noctalia-shell.systemd.enable = true;

    # Settings
    programs.noctalia-shell.settings = {
      appLauncher.position = "top_center";
      bar.showCapsule = false;
      bar.widgets = {
        left = [
          {
            id = "ControlCenter";
            useDistroLogo = true;
          }
          # { id = "Launcher"; }
          { id = "plugin:workspace-overview"; }
          {
            id = "Workspace";
            showApplications = true;
          }
          # { id = "ActiveWindow"; }
        ];
        center = [
          {
            id = "Clock";
            formatHorizontal = "HH:mm ddd yyyy-MM-dd";
            tooltipFormat = "HH:mm ddd yyyy-MM-dd";
          }
          { id = "plugin:weather-indicator"; }
          # {
          #   id = "MediaMini";
          #   hideMode = "idle";
          # }
        ];
        right = [
          { id = "plugin:catwalk"; }
          { id = "SystemMonitor"; }
          { id = "Spacer"; }
          {
            id = "NotificationHistory";
            hideWhenZero = true;
          }
          { id = "Tray"; }
          { id = "plugin:kde-connect"; }
          { id = "plugin:tailscale"; }
          { id = "plugin:syncthing-status"; }
          { id = "Network"; }
          { id = "Bluetooth"; }
          {
            id = "Battery";
            displayMode = "graphic";
            hideIfIdle = false;
            showNoctaliaPerformance = true;
            showPowerProfiles = true;
          }
          {
            id = "CustomButton";
            icon = "settings";
            leftClickExec = "noctalia-shell ipc call settings toggle";
          }
        ];
      };
      colorSchemes.predefinedScheme = "Catppuccin Custom"; # switch to custom theme with accent
      dock = {
        enabled = true;
        dockType = "attached";
        showLauncherIcon = true;
      };
      general = {
        animationDisabled = false;
        clockFormat = "hh:mm\nyyyy-MM-dd";
        compactLockScreen = false;
        enableLockScreenMediaControls = true;
        enableShadows = true;
        forceBlackScreenCorners = true;
        passwordChars = true;
        screenRadiusRatio = 0.8;
        showHibernateOnLockScreen = true;
        showScreenCorners = true;
      };
      location.name = "Totnes";
      ui.panelBackgroundOpacity = 1;
      wallpaper = {
        enabled = true;
        directory = toString ../wallpapers;
        automationEnabled = true;
        randomIntervalSec = 3600;
      };
    };

    # Plugins
    programs.noctalia-shell.plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        battery-actions.enabled = true;
        catwalk.enabled = true;
        keybind-cheatsheet.enabled = true;
        kde-connect.enabled = true;
        niri-overview-launcher.enabled = true;
        syncthing-status.enabled = true;
        tailscale.enabled = true;
        weather-indicator.enabled = true;
        workspace-overview.enabled = true;
      };
      version = 2;
    };
    programs.noctalia-shell.pluginSettings = {
      battery-actions = {
        onBatteryScript = "noctalia-shell ipc call powerProfile set \"balanced\"";
        pluggedInScript = "noctalia-shell ipc call powerProfile set \"performance\"";
      };
      tailscale = {
        compactMode = true;
        terminalCommand = "kitty";
      };
    };
  };
}
