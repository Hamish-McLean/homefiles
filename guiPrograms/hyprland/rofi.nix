{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    rofi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.rofi.enable {
    home.packages = with pkgs; [  
      # rofi
      # rofi-bluetooth
      rofi-power-menu 
    ];
    # catppuccin.rofi.enable = true;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      location = "center";
      terminal = "${pkgs.kitty}/bin/kitty";
      # plugins = [];
      # font = "Fira Code 12";
      extraConfig = {
        display-drun = "   Apps ";
        display-run = "   Run ";
        display-window = " 󰕰  Window";
        display-Network = " 󰤨  Network";
        sidebar-mode = true;
        show-icons = true;
      };
      theme = 
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in  
      {
        "*" = lib.mkForce {
          border-radius = mkLiteral "10px";
          font = "JetBrainsMono Nerd Font 10";
        };
        window = lib.mkForce {
          border = mkLiteral "2px";
          border-color = mkLiteral "#74c7ec";
        };
      };

      # Applets from rofi-applets https://github.com/Zhaith-Izaliel/rofi-applets
      applets = {
        bluetooth = {
          enable = true;
          theme = {
            "@theme" = "/home/cycad/.local/share/rofi/themes/custom";

          };
        };
        favorites = {
          enable = true;
          theme = {
            "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
          };
        };
        mpd.enable = false;
        power-profiles = {
          enable = true;
          theme = {
            "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
          };
        };
        ronema = {
          enable = true;
          theme = {
            "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
          };
        };
        quicklinks = {
          enable = true;
          theme = {
            "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
          };
        };
      };
    };
  };
}
