# Noctalia shell
{
  config,
  inputs,
  lib,
  pkgs,
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
    home.packages = with pkgs; [
      glib # for phone connect plugin
      pulseaudio
      smartmontools # for drive health plugin
    ];

    programs.noctalia.enable = true;

    # Settings
    programs.noctalia.settings = {
      audio.enable_sounds = true;

      # Main bar
      bar.widgets = {
        capsule_group = [
          {
            enabled = true;
            fill = "surface_variant";
            id = "g1";
            members = [
              "cpu"
              "temp"
              "ram"
              "sysmon"
              "network_rx"
              "network_tx"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            enabled = true;
            fill = "surface_variant";
            id = "g2";
            members = [
              "media"
              "audio_visualizer"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
        ];
        center = [
          "clock"
          "date"
          "weather"
        ];
        dead_zone.actions = {
          left = "noctalia msg panel-toggle control-center";
          middle = "noctalia msg settings-toggle";
          right = "noctalia msg settings-toggle";
        };
        end = [
          "privacy"
          "group:g2"
          "group:g1"
          "screenshot"
          "tray"
          "notifications"
          "brightness"
          "volume"
          "bluetooth"
          "network"
          "battery"
          "session"
        ];
        margin_ends = 0;
        start = [
          "control-center"
          "taskbar"
          "spacer_2"
          "active_window"
        ];
        widget_spacing = 10;
      };

      # Vertical monitor
      bar.widgets.monitor.HDMI-A-1 = {
        capsule_group = [
          {
            enabled = true;
            fill = "surface_variant";
            id = "g1";
            members = [
              "cpu"
              "temp"
              "ram"
              "sysmon"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            enabled = true;
            fill = "surface_variant";
            id = "g2";
            members = [
              "media"
              "audio_visualizer"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
        ];
        center = [
          "clock"
          "date"
          "weather"
        ];
        end = [
          "group:g1"
          "tray"
          "notifications"
          "brightness"
          "volume"
          "bluetooth"
          "network"
          "battery"
          "session"
        ];
        start = [
          "control-center"
          "taskbar"
        ];
      };

      brightness.enable_ddcutil = true;

      calendar.enabled = true;

      control_center = {
        sidebar = "full";
        sidebar_section = "none";
      };

      # Desktop widgets
      desktop_widgets = {
        schema_version = 2;
        widget_order = [
          "desktop-widget-0000000000000001"
          "desktop-widget-0000000000000002"
          "desktop-widget-0000000000000003"
          "desktop-widget-0000000000000005"
          "desktop-widget-0000000000000006"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
          desktop-widget-0000000000000001 = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 540.0;
            cy = 192.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            settings.background = false;
            type = "clock";
          };
          desktop-widget-0000000000000002 = {
            box_height = 80.0;
            box_width = 176.0;
            cx = 540.0;
            cy = 96.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "clock";
            settings = {
              background = false;
              center_text = true;
              format = "{:%A\n%Y-%m-%d}";
            };
          };
          desktop-widget-0000000000000003 = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 956.0;
            cy = 1839.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "sysmon";
            settings = {
              background = false;
              color2 = "error";
              stat = "cpu_usage";
              stat2 = "cpu_temp";
            };
          };
          desktop-widget-0000000000000005 = {
            box_height = 64.0;
            box_width = 160.0;
            cx = 988.0;
            cy = 80.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "weather";
            settings = {
              background = false;
            };
          };
          desktop-widget-0000000000000006 = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 956.0;
            cy = 1733.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "sysmon";
            settings = {
              background = false;
              color2 = "tertiary";
              stat = "net_rx";
              stat2 = "net_tx";
            };
          };
        };
      };

      dock = {
        active_monitor_only = true;
        auto_hide = true;
        background_opacity = 1.0;
        enabled = true;
        icon_size = 40;
        launcher_position = "start";
        pinned = [
          "firefox"
          "kitty"
          "steam"
        ];
        reserve_space = false;
        show_dots = true;
      };

      hot_corners = {
        enabled = true;
        bottom_left.action = "window_switcher";
      };

      idle = {
        behavior_order = [
          "screen-off"
          "lock"
          "lock-and-suspend"
        ];
        behavior.lock = {
          action = "lock";
          enabled = true;
          timeout = 1200;
        };
        behavior.lock-and-suspend = {
          action = "lock_and_suspend";
          enabled = false;
          timeout = 3600.0;
        };
        behavior.screen-off = {
          action = "screen_off";
          enabled = true;
          timeout = 600;
        };
        pre_action_fade_seconds = 10;
      };

      location.address = "Totnes";

      lockscreen.monitors = [ "DP-2" ];

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@DP-2"
          "lockscreen-widget-0000000000000002"
          "lockscreen-widget-0000000000000008"
          "lockscreen-widget-0000000000000009"
          "lockscreen-widget-000000000000000a"
          "lockscreen-widget-000000000000000b"
          "lockscreen-widget-000000000000000d"
          "lockscreen-widget-000000000000000e"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
          "lockscreen-login-box@DP-2" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 960.0;
            cy = 825.0;
            output = "DP-2";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
            };
          };
          lockscreen-widget-0000000000000002 = {
            box_height = 112.0;
            box_width = 304.0;
            cx = 865.0;
            cy = 892.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "media_player";
            settings = {
              hide_when_no_media = true;
            };
          };
          lockscreen-widget-0000000000000008 = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 960.0;
            cy = 473.64453125;
            output = "DP-2";
            rotation = 0.0;
            type = "clock";
            settings = {
              background = false;
            };
          };
          lockscreen-widget-0000000000000009 = {
            box_height = 101.1796875;
            box_width = 216.125;
            cx = 960.0;
            cy = 254.58984375;
            output = "DP-2";
            rotation = 0.0;
            type = "clock";
            settings = {
              background = false;
              center_text = true;
              format = "{:%A\n%Y-%m-%d}";
            };
          };
          lockscreen-widget-000000000000000a = {
            box_height = 48.0;
            box_width = 144.0;
            cx = 960.0;
            cy = 652.0;
            output = "DP-2";
            rotation = 0.0;
            type = "weather";
            settings = {
              background = false;
              shadow = true;
              show_forecast = false;
            };
          };
          lockscreen-widget-000000000000000b = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 1785.33984375;
            cy = 981.5390625;
            output = "DP-2";
            rotation = 0.0;
            type = "sysmon";
            settings = {
              background = false;
              stat = "cpu_usage";
              stat2 = "cpu_temp";
            };
          };
          lockscreen-widget-000000000000000d = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 960.0;
            cy = 892.0;
            output = "DP-2";
            rotation = 0.0;
            type = "button";
            settings = {
              background = false;
              glyph = "heart";
              variant = "default";
            };
          };
          lockscreen-widget-000000000000000e = {
            box_height = 56.54296875;
            box_width = 259.1328125;
            cx = 960.0;
            cy = 1036.658203125;
            output = "DP-2";
            rotation = 0.0;
            type = "audio_visualizer";
            settings = {
              background = false;
              bands = 32;
              show_when_idle = false;
            };
          };
        };
      };

      nightlight.enabled = true;

      shell = {
        date_format = "%Y-%m-%d";
        external_ip_enabled = true;
        font_family = "JetBrainsMono Nerd Font";
        niri_overview_type_to_launch_enabled = true;
        panel = {
          launcher_placement = "attached";
          open_near_click_control_center = true;
          open_near_click_launcher = true;
        };
        password_style = "random";
        polkit_agent = true;
        screen_time_enabled = true;
        telemetry_enabled = true;
      };

      theme = {
        builtin = "Catppuccin";
        community_palette = "Catppuccin Lavender";
        mode = "dark";
        source = "custom";
      };

      wallpaper =
        let
          wallpaperDir = /home/cycad/Pictures/wallpapers;
        in
        {
          default = toString wallpaperDir + "/catppuccin-black-hole-minimal.png";
          directory = toString wallpaperDir;
          enabled = true;
          fill_color = "#191926";
          fill_mode = "fit";
          transition_on_startup = true;
        };

      widget = {
        audio_visualizer.color_2 = "tertiary";
        battery.display_mode = "graphic";
        brightness.show_label = false;
        cpu.show_label = false;
        date.format = "{:%A\n%Y-%m-%d}";
        media = {
          album_art_only = true;
          hide_when_no_media = true;
        };
        network.show_label = false;
        network_rx = {
          display = "graph";
          show_label = false;
        };
        network_tx = {
          display = "graph";
          show_label = false;
        };
        privacy.hide_inactive = true;
        ram.show_label = false;
        spacer_2.type = "spacer";
        spacer_3.type = "spacer";
        sysmon = {
          show_label = false;
          stat = "disk_used_pct";
        };
        taskbar = {
          group_by_workspace = true;
          group_single_icon_per_app = true;
        };
        temp.show_label = false;
        tray.drawer = true;
        volume.show_label = false;
        weather.show_condition = false;
      };
    };
  };
}
