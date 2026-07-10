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
      # rofi-power-menu
    ];
    catppuccin.rofi.enable = true;
    programs.rofi = {
      enable = true;
      # package = pkgs.rofi-wayland; # rofi-wayland has been merged into rofi
      location = "center";
      terminal = "${pkgs.kitty}/bin/kitty";
      plugins = [];
      # font = "Fira Code 12"; # Theme seems to override this
      extraConfig = {
        display-drun = " "; # "   Apps ";
        display-filebrowser = " ";
        display-run =  " "; # "   Run ";
        # display-window = " 󰕰  Window";
        # display-Network = " 󰤨  Network";
        drun-display-format = "{name}";
        modi = "drun,run,filebrowser,window";
        sidebar-mode = true;
        show-icons = true;
	      window-format = "{w} · {c} · {t}";
      };

      # Theme
      # Adapted from https://github.com/adi1090x/rofi/blob/master/files/launchers/type-1/style-5.rasi
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
          accent = mkLiteral "@sapphire";
        in
        {
          # All widgets
          "*" = {
            border-color = accent;
            border-radius = mkLiteral "10px";
            font = "JetBrainsMono Nerd Font 12";
          };

          # Main window
          window = {
            anchor = mkLiteral "center";
            border = mkLiteral "2px";
            # border-color = accent; # mkLiteral "@sapphire"; #"#74c7ec";
            height = mkLiteral "50%";
            location = mkLiteral "center";
            transparency = "real";
            width = mkLiteral "30%"; # 800px;
          };

          # Main box
          mainbox = {
            enabled = true;
          };

          # Input bar
          inputbar = {
            # border = mkLiteral "0px"; # Remove all borders
            spacing = mkLiteral "10px";
            # children = mkLiteral "[ 'textbox-prompt-colon', 'entry', 'mode-switcher' ]";
          };
          entry = {
            padding = mkLiteral "5px 0px";
            cursor = mkLiteral "text";
            placeholder = "Search ... ";
          };
          textbox-prompt-colon = {
            enabled = true;
            expand = false;
            padding = mkLiteral "5px 0px";
            str = " ";
          };

          # Listview
          listview = {
            columns = 2;
            lines = 10;
            cycle = false;
            dynamic = true;
            scrollbar = true;
            spacing = mkLiteral "5px";
            border = mkLiteral "0px solid";
          };
          scrollbar = {
            border-radius = mkLiteral "10px";
            handle-color = accent;
            handle-width = mkLiteral "5px";
          };

          # Elements
          element = {
            spacing = mkLiteral "10px";
            padding = mkLiteral "5px 10px";
          };
          element-icon = {
            size = mkLiteral "2.5ch";
          };

          
        };

      # Applets from rofi-applets https://github.com/Zhaith-Izaliel/rofi-applets
      # This in no longer on github
      # applets = {
      #   bluetooth = {
      #     enable = true;
      #     theme = {
      #       "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
      #       configuration = {
      #         location = 3;
      #       };
      #       inputbar = {
      #         enabled = false;
      #       };
      #       window = {
      #         width = "5em";
      #         height = "10em";
      #       };
      #     };
      #   };
      #   favorites = {
      #     enable = true;
      #     theme = {
      #       "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
      #     };
      #   };
      #   mpd.enable = false;
      #   power-profiles = {
      #     enable = true;
      #     theme = {
      #       "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
      #       configuration = {
      #         location = 3;
      #       };
      #       inputbar = {
      #         enabled = false;
      #       };
      #     };
      #   };
      #   ronema = {
      #     enable = true;
      #     theme = {
      #       "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
      #       configuration = {
      #         location = 3;
      #       };
      #       inputbar = {
      #         enabled = false;
      #       };
      #     };
      #   };
      #   quicklinks = {
      #     enable = true;
      #     theme = {
      #       "@theme" = "/home/cycad/.local/share/rofi/themes/custom";
      #     };
      #   };
      # };
    };
  };
}
