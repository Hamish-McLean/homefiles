{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.core;
in
{
  options.custom.homeProfiles.core = {
    enable = mkEnableOption "Enable core profile";
  };

  config = mkIf cfg.enable {
    custom.homeModules = {
      core = {
        catppuccin.enable = mkDefault true;
      };
    };
  };
}
