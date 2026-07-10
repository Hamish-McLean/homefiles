{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.gaming;
in
{
  options.custom.homeProfiles.gaming = {
    enable = mkEnableOption "Enable gaming profile";
  };

  config = mkIf cfg.enable {
    # Programs
    mangohud.enable = mkDefault true;
    minecraft.enable = mkDefault true;

    home.packages = with pkgs; [
      # dwarf-fortress-packages.dwarf-fortress-full
      endless-sky # Space game
      runelite # Runescape client
      supertuxkart
    ];
  };
}
