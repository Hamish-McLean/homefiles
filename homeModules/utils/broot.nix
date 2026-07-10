/*
Broot

Broot is a better way to navigate directories, find files, and launch commands.

https://github.com/Canop/broot
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    broot.enable = lib.mkEnableOption "enable broot";
  };

  config = lib.mkIf config.broot.enable {
    programs.broot = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      settings = {
        modal = true; # vim mode
      };
    };
    # catppuccin.broot.enable = true;
  };
}

