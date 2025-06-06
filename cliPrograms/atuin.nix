/*
Atuin - magical shell history

Making your shell magical. Sync, search and backup shell history with Atuin.
*/
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
        # filter_mode = "workspace"; # Search history just from the current git repository 
        dialect = "uk";
        enter_accept = true;
        filter_mode = "workspace";
        filter_mode_shell_up_key_binding = "workspace";
        workspaces = true; # Pseudo filter in git repos
      }; 
    };
  };
}
