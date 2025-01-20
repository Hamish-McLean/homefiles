/*
  Cycad's default guiPrograms home manager module.
  This imports other guiPrograms home manager modules.
  All can be enabled by setting guiPrograms = true.
  Modules are enabled by default so can be disabled by setting them to false.
*/
{ lib, config, ... }:
{
  # Cli programs to import
  imports = [
    ./flatpak.nix
    ./freetube.nix
    # ./ghostty.nix
    ./gnome.nix
    ./gtk.nix
    ./hyprland/hyprland.nix
    ./kitty.nix
    ./plasma.nix
    ./qt.nix
    ./vscodium.nix
    ./zathura.nix
  ];

  # Option to enable all guiPrograms modules
  options = {
    guiPrograms.enable = lib.mkEnableOption "enables guiPrograms";
  };
  config = lib.mkIf config.guiPrograms.enable {

    # Desktop environments
    gnome_config.enable = lib.mkDefault true;
    hyprland.enable = lib.mkDefault true;
    plasma.enable = lib.mkDefault false;

    # GUI libraries
    gtk_config.enable = lib.mkDefault true;
    qt_config.enable = lib.mkDefault true;

    # Programs
    flatpak.enable = lib.mkDefault true;
    freetube.enable = lib.mkDefault true;
    # ghostty.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    vscodium.enable = lib.mkDefault true;
    zathura.enable = lib.mkDefault true;
    zen.enable = lib.mkDefault true;

    # Themes
    catppuccin.cursors = {
      enable = true;
      flavor = "mocha";
      accent = "sapphire";
    };
  };

}
