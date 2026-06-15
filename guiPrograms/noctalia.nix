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
    programs.noctalia.enable = true;

    # Settings
    programs.noctalia.settings = {
      # appLauncher = {
      #   enableClipboardHistory = true;
      #   position = "top_center";
      #   terminalCommand = "kitty -e";
      # };
      audio.enable_sounds = true;
      # bar.showCapsule = false;
      bar.widgets = {
        capsule_group = {
          fill = "surface_variant";
          id = "g1";
          members = [
            "cpu"
            "temp"
            "ram"
          ];
          opacity = 1.0;
          padding = 6.0;
        };
        center = [
          "clock"
          "date"
          "weather"
        ];
        end = [
          "audio_visualizer"
          "media"
          "spacer_3"
          "group:g1"
          "cat"
          "tray"
          "notifications"
          "clipboard"
          "bluetooth"
          "network"
          "battery"
          "wallpaper"
          "session"
        ];
        margin_ends = 10;
        start = [
          "control-center"
          "launcher"
          "workspaces"
          "spacer_2"
          "active_window"
        ];
        widget_spacing = 10;
      };
      # colorSchemes.predefinedScheme = "Catppuccin Custom"; # switch to custom theme with accent
      control-center.sidebar_section = "none";
      dock = {
        auto_hide = true;
        background_opacity = 1.0;
        dockType = "attached";
        enabled = true;
        icon_size = 40;
        launcher_position = "start";
        reserve_space = false;
        # showLauncherIcon = true;
      };
      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        behavior.lock = {
          action = "lock";
          enabled = true;
          timeout = 600;
        };
        behavior.screen-off = {
          action = "screen-off";
          enabled = true;
          timeout = 660;
        };
      };
      location.address = "Totnes";
      nightlight.enabled = true;
      plugins.enabled = [ "noctalia/bongocat" ];
      # sessionMenu.enableCountdown = false;
      shell = {
        font_family = "JetBrainsMono Nerd Font";
        niri_overview_type_to_launch_enabled = true;
        password_style = "random";
      };
      shell.panel = {
        launcher_placement = "attached";
        open_near_click_control_center = true;
        open_near_click_launcher = true;
      };
      theme = {
        community_palette = "Catppuccin Lavender";
        source = "community";
      };
      # ui.panelBackgroundOpacity = 1;
      wallpaper = {
        # automationEnabled = true;
        directory = toString /home/cycad/Pictures/wallpapers;
        enabled = true;
        fill_color = "#11111b";
        # randomIntervalSec = 3600;
        # skipStartupTransition = true;
        # solidColor = "#11111b";
      };
      widget = {
        cat = {
          audio_spectrum = true;
          tappy_mode = true;
          type = "noctalia/bongocat:cat";
        };
        cpu.show_label = false;
        date.format = "{:%a %Y-%m-%d}";
        media.hide_when_no_media = true;
        ram.show_label = false;
        spacer_2.type = "spacer";
        spacer_3.type = "spacer";
        temp.show_label = false;
        tray.drawer = true;
        weather.show_condition = false;
      };
    };
  };
}
