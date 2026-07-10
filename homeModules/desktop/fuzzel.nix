/*
Fuzzel

Fuzzel is a Wayland-native application launcher and fuzzy finder, inspired by rofi and dmenu.

https://codeberg.org/dnkl/fuzzel

Catppuccin theme available.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    fuzzel.enable = lib.mkEnableOption "enables fuzzel";
  };

  config = lib.mkIf config.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      # settings = { };
    };
    catppuccin.fuzzel.enable = true;
  };
}
