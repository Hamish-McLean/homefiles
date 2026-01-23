/*
  Cosmic manager
  https://heitoraugustoln.github.io/cosmic-manager/
*/
{
  config,
  inputs,
  lib,
  ...
}:
{
  options = {
    cosmic.enable = lib.mkEnableOption "enables cosmic";
  };

  config = lib.mkIf config.cosmic.enable {
    programs.cosmic-files = {
      enable = true;
      settings = {
        # app_theme = cosmicLib.cosmic.mkRon "enum" "Dark";
      };
    };

    wayland.desktopManager.cosmic = {
      enable = true;
      appearance.theme.dark.name = "Catppuccin-Mocha-Sapphire";
      # settings = {
      #   "com.system76.CosmicTheme.Dark" = {
      #     theme_name = "Catppuccin-Mocha-Sapphire";
      #   };
      # };
    };

    xdg.configFile."cosmic/com.system76.CosmicTheme.Dark/v1" = {
      source = "${inputs.catppuccin-cosmic}/themes/cosmic-settings";
      recursive = true;
    };
  };
}

