{
  config,
  lib,
  ...
}:
{
  options = {
    atuin.enable = lib.mkEnableOption "enables atuin";
  };

  config = lib.mkIf config.atuin.enable {
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;

      # Settings https://atuin.sh/docs/config/
      settings = {
        dialect = "uk";
      }; 
    };
  };
}
