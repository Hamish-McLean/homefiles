{
  config,
  inputs,
  lib,
  ...
}:
with lib;
let
  cfg = config.custom.homeModules.core.catppuccin;
in
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  options.custom.homeModules.core.catppuccin = {
    enable = mkEnableOption "Enable catppuccin theme";
    cursors.enable = mkEnableOption "Enable catppuccin cursors";
  };

  config = mkIf cfg.enable {
    catppuccin = {
      accent = "sapphire";
      cache.enable = true;
      enable = true;
      flavor = "mocha";
    };

    catppuccin.cursors = mkIf cfg.cursors.enable {
      enable = true;
      flavor = config.catppuccin.flavor;
      accent = config.catppuccin.accent;
    };
  };
}
