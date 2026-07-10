{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.desktop;
in
{
  options.custom.homeProfiles.desktop = {
    enable = mkEnableOption "Enable desktop profile";
  };

  config = mkIf cfg.enable {
    custom.homeModules = {
      core.catppuccin.cursors.enable = mkDefault true;
    };

    anyrun.enable = mkDefault false;
    cosmic.enable = mkDefault false;
    gnome_config.enable = mkDefault false;
    gtk_config.enable = mkDefault true;
    hyprland.enable = mkDefault false;
    mime-defaults.enable = mkDefault true;
    niri.enable = mkDefault true;
    noctalia.enable = mkDefault true;
    plasma.enable = mkDefault false;
    qt_config.enable = mkDefault true;
    walker.enable = mkDefault true;
  };
}
