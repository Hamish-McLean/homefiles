/*
  Shell aliases

  General aliases compatible with all shells.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    shell-aliases.enable = lib.mkEnableOption "enable shell aliases";
  };

  config = lib.mkIf config.shell-aliases.enable {
    home.shellAliases = {
      lss = "ls -ls size"; # list long sort by size
      pping = "prettyping --nolegend";
      speedtest = "cfspeedtest";
    };
  };
}
