/*
imv - X11/Wayland Image Viewer

imv is a command line image viewer intended for use with tiling window managers.

Catppuccin themed.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    imv.enable = lib.mkEnableOption "enables imv";
  };

  config = lib.mkIf config.imv.enable {
    programs.imv = {
      enable = true;
      # settings = { };
    };
    catppuccin.imv.enable = true;
  };
}
