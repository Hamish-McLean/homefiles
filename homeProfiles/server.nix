{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.server;
in
{
  options.custom.homeProfiles.server = {
    enable = mkEnableOption "Enable server profile";
  };

  config = mkIf cfg.enable {

  };
}
