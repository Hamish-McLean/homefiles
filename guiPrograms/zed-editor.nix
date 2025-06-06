/*
Zed

Zed is a next-generation code editor designed for high-performance collaboration with humans and AI.

Catppuccin themed.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    zed-editor.enable = lib.mkEnableOption "enables zed-editor";
  };

  config = lib.mkIf config.zed-editor.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [ ];
      userKeymaps = { };
      userSettings = { };
    };
    catppuccin.zed.enable = true;
  };
}
