/*
  HyprPanel

  Flake: https://github.com/Jas-SinghFSU/HyprPanel

  Configuration: https://hyprpanel.com/getting_started/installation.html#nixos-home-manager
*/
{
  config,
  lib,
  ...
}:
let
  # base = "#1e1e2e";
  # green = "#a6e3a1";
  # red = "#f38ba8";
  sapphire = "#74c7ec";
in
# surface0 = "#313244";
# text = "#cdd6f4";
{
  options = {
    hyprpanel.enable = lib.mkEnableOption "enables hyprpanel";
  };

  config = lib.mkIf config.hyprpanel.enable {
    programs.hyprpanel = {
      enable = true;
      hyprland.enable = true;
      overwrite.enable = true; # Allows gui configuration to be overwritten by home-manager
      theme = "catppuccin_mocha"; # catppuccin_mocha, catppuccin_mocha_split, catppuccin_mocha_vivid
      override = {
        # Can override specific colours etc
        theme.bar = {
          # background = surface0;
          buttons.dashboard.icon = sapphire;
        };
      };
      layout = {
        # https://hyprpanel.com/configuration/panel.html
        "bar.layouts" = {
          "*" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "cava"
              "media"
            ];
            right = [
              "volume"
              "network"
              "bluetooth"
              "battery"
              "systray"
              "clock"
              "notifications"
            ];
          };
        };
        # "1" = {
        #   left = [ "dashboard" "workspaces" "windowtitle" ];
        #   middle = [ "media" ];
        #   right = [ "volume" "clock" "notifications" ];
        # };
        # "2" = {
        #   left = [ "dashboard" "workspaces" "windowtitle" ];
        #   middle = [ "media" ];
        #   right = [ "volume" "clock" "notifications" ];
        # };
        "bar.systray" = {
          customIcons = {
            # 
            "[Ss]team" = {
              icon = " ";
            }; # 󰓓    
            "[Ss]potify*" = {
              icon = " ";
            }; # 󰓇
            "KDE*" = {
              icon = " ";
            }; # 󰬒  󰰉  󰰋
            "zap*" = {
              icon = " ";
            };
          };
        };
      };
      settings = {
        bar = {
          clock.format = "%a %Y-%m-%d %H:%M";
          customModules.cava.showIcon = false;
          launcher.autoDetectIcon = true; # icon = "";
          # workspaces.showApplicationIcons = true;
          # workspaces.show_icons = true;
        };
        menus = {
          clock = {
            time = {
              military = true;
              hideSeconds = true;
            };
            weather = {
              key = builtins.getEnv "WEATHERAPI"; # In direnv. Consider using sops-nix
              location = "Tunbridge Wells";
              unit = "metric";
            };
          };
          dashboard = {
            shortcuts = {
              left = {
                shortcut1 = {
                  command = "codium";
                  icon = "";
                  tooltip = "Vscodium";
                };
                shortcut2 = {
                  command = "firefox";
                  icon = "󰈹";
                  tooltip = "Firefox";
                };
                shortcut3 = {
                  command = "kitty";
                  icon = "󰄛";
                  tooltip = "Kitty";
                };
              };
            };
            powermenu.avatar.image = "${../../wallpapers/astronaught.jpg}";
          };
        };
        theme = {
          bar = {
            # background = surface0;
            border_radius = "0.8em";
            buttons = {
              # dashboard.icon = sapphire;
              radius = "0.8em";
            };
            floating = true;
            margin_sides = "1.2em";
            margin_top = "1em";
          };
          font = {
            name = "JetBrainsMono Nerd Font";
            size = "1rem";
          };
        };
        wallpaper.image = "${../../wallpapers/minimalist-black-hole.png}";
      };
    };
  };
}
