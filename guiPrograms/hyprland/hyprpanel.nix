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
  base = "#1e1e2e";
  green = "#a6e3a1";
  red = "#f38ba8";
  sapphire = "#74c7ec";
  surface0 = "#313244";
  text = "#cdd6f4";
in 
{
  options = {
    hyprpanel.enable = lib.mkEnableOption "enables hyprpanel";
  };
  
  config = lib.mkIf config.hyprpanel.enable {
    programs.hyprpanel = {
      enable = true;
      # systemd.enable = true; # Obsolete
      hyprland.enable = true;
      overwrite.enable = true; # Allows gui configuration to be overwritten by home-manager
      theme = "catppuccin_mocha"; # catppuccin_mocha, catppuccin_mocha_split, catppuccin_mocha_vivid
      override = { # Can override specific colours etc
        theme.bar = {
          # background = surface0;
          buttons.dashboard.icon = sapphire;
        };
      };
      # layout = {}; # https://hyprpanel.com/configuration/panel.html
      settings = {
        bar = {
          clock.format = "%a %Y-%m-%d %H:%M";
          launcher.autoDetectIcon = true; # icon = "";
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
            powermenu.avatar.image = "${../../pictures/mice.jpg}";
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
