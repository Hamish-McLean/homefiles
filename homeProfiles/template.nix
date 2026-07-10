{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.x;
in
{
  options.custom.homeProfiles.x = {
    enable = mkEnableOption "Enable x profile";
  };

  config = mkIf cfg.enable {

  };
}
