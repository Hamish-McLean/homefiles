/*
  catppuccin waybar example at
  https://github.com/rubyowo/dotfiles/tree/f925cf8e3461420a21b6dc8b8ad1190107b0cc56/config/waybar
*/
{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };
  config = lib.mkIf config.waybar.enable {
    home.packages = [ pkgs.waybar ];
    catppuccin.waybar.enable = true;
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = [
        {
          layer = "top"; # or bottom
          position = "top"; # or bottom
          margin = "4px";
          # height = 30;
          # width = 1280;
          # spacing = 4;
          # output = [
          #   "eDP-1"
          #   "HDMI-A-2"
          # ];
          modules-left = [
            "custom/rofi"
            "hyprland/workspaces"
            "wlr/taskbar"
            "hyprland/window"
          ];
          modules-center = [
            "custom/music"
            # "mpris"
          ];
          modules-right = [
            "tray"
            "wireplumber"
            "backlight"
            "battery"
            "bluetooth"
            "network"
            "clock"
            # "custom/lock"
            "custom/power"
            # "battery#bat0" # Fix battery name if needed
          ];
          "custom/rofi" = {
            format = " ";
            on-click = "rofi -show drun";
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            fromat-icons = {
              default = " ";
            };
          };
          "wlr/taskbar" = {
            on-click = "activate";
            icon-size = 20;
          };
          "custom/music" = {
            format = "  {}";
            escape = true;
            interval = 5;
            tooltip = false;
            exec = "playerctl metadata --format='{{ title }}'";
            on-click = "playerctl play-pause";
            max-length = 50;
          };
          tray = {
            icon-size = 20;
            spacing = 10;
          };
          wireplumber = {
            # scroll-step = 1,; # %, can be a float
            format = "{icon}";
            tooltip-format = "{node_name} {volume}%";
            format-muted = " ";
            format-icons = [
              " "
              " "
              " "
            ];
            on-click = "pavucontrol";
            on-click-right = "qpwgraph";
          };
          backlight = {
            # device = "intel_backlight";
            format = "{icon}";
            tooltip-format="{percent}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
          };
          battery = {
            states = {
              good = 80;
              warning = 30;
              critical = 15;
            };
            format = "{icon}";
            tooltip-format = "{capacity}%";
            format-icons = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            format-charging = "{icon}󱐋";
            format-full = "󱟢 ";
          };
          clock = {
            timezone = "Europe/London";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
            format = "{:%H:%M}";
          };
          "custom/lock" = {
            tooltip = false;
            # on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
            format = " ";
          };
          "custom/power" = {
            tooltip = false;
            on-click = "wlogout &";
            format = "⏻ ";
          };
          network = {
            format-wifi = "{icon}";
            format-icons = {
              wifi = [
                  "󰤟 "
                  "󰤢 "
                  "󰤥 "
                  "󰤨 "
              ];
            };
            format-disconnected = "󰤮 ";
            format-ethernet = "󰈁";
            tooltip-format = "{essid}";
          };
          bluetooth = {
            format-connected = "󰂰 ";
            format-on = "󰂯 ";
            format-off="󰂲 ";
            on-click = "blueman-manager";
            tooltip-format-connected = "{device_enumerate}";
            tooltip-device-enumerate-connected = "{device_alias}";
          };
        }
      ];
      style = builtins.readFile ./waybar.css;
      # ''
      #   * {
      #     font-family: FantasqueSansMono Nerd Font;
      #     font-size: 17px;
      #     min-height: 0;
      #   }

      #   #waybar {
      #     background: transparent;
      #     color: @text;
      #     margin: 5px 5px;
      #   }

      #   #workspaces {
      #     border-radius: 1rem;
      #     margin: 5px;
      #     background-color: @surface0;
      #     margin-left: 1rem;
      #   }

      #   #workspaces button {
      #     color: @lavender;
      #     border-radius: 1rem;
      #     padding: 0.4rem;
      #   }

      #   #workspaces button.active {
      #     color: @sky;
      #     border-radius: 1rem;
      #   }

      #   #workspaces button:hover {
      #     color: @sapphire;
      #     border-radius: 1rem;
      #   }

      #   #custom-music,
      #   #tray,
      #   #backlight,
      #   #clock,
      #   #battery,
      #   #pulseaudio,
      #   #custom-lock,
      #   #custom-power {
      #     background-color: @surface0;
      #     padding: 0.5rem 1rem;
      #     margin: 5px 0;
      #   }

      #   #clock {
      #     color: @blue;
      #     border-radius: 0px 1rem 1rem 0px;
      #     margin-right: 1rem;
      #   }

      #   #battery {
      #     color: @green;
      #   }

      #   #battery.charging {
      #     color: @green;
      #   }

      #   #battery.warning:not(.charging) {
      #     color: @red;
      #   }

      #   #backlight {
      #     color: @yellow;
      #   }

      #   #backlight, #battery {
      #       border-radius: 0;
      #   }

      #   #pulseaudio {
      #     color: @maroon;
      #     border-radius: 1rem 0px 0px 1rem;
      #     margin-left: 1rem;
      #   }

      #   #custom-music {
      #     color: @mauve;
      #     border-radius: 1rem;
      #   }

      #   #custom-lock {
      #       border-radius: 1rem 0px 0px 1rem;
      #       color: @lavender;
      #   }

      #   #custom-power {
      #       margin-right: 1rem;
      #       border-radius: 0px 1rem 1rem 0px;
      #       color: @red;
      #   }

      #   #tray {
      #     margin-right: 1rem;
      #     border-radius: 1rem;
      #   }
      # '';
    };
  };
}
