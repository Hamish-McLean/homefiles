{ config, lib, ... }:
{
  options = {
    eza.enable = lib.mkEnableOption "enables eza";
  };
  config = lib.mkIf config.eza.enable {
    programs.eza = {
      enable = true;
      # enableAliases = true; # Option removed from 24.05
      enableFishIntegration = true; # Option not in 23.11
      icons = "auto";
      git = true;
      extraOptions = [ ];
    };
  };
}
