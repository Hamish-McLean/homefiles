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
      # dwarf fortress (various packages, find best one)
      # dwarf-fortress-packages.dwarf-fortress-full
      endless-sky # Space game
      gorched # terminal game based on scorched earth
      moon-buggy
      rogue # original rogue game from 1985
      runelite # Runescape client
      supertuxkart
      unnethack # fork of nethack roguelike from 1987
      vitetris # tetris or try nixpkgs#tetris
    ];
  };
}
