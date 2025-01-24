/*
Nixcord
https://github.com/KaylorBen/nixcord
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    nixcord.enable = lib.mkEnableOption "enables nixcord";
  };
  
  config = lib.mkIf config.nixcord.enable {
    programs.nixcord = {
      enable = true;
      config = { # Options at https://github.com/KaylorBen/nixcord/blob/main/docs/INDEX.md
        themeLinks = [ "https://github.com/catppuccin/discord/blob/main/themes/mocha.theme.css" ];
        enabledThemes = [ "Catppuccin Mocha" ];
        # frameless = false;
      };
    };
  };
}
