/*
Nushell

A new type of shell.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    nushell.enable = lib.mkEnableOption "enables nushell";
  };

  config = lib.mkIf config.nushell.enable {
    programs.nushell = {
      enable = true;
      settings = {
        buffer_editor = "nvim";
        show_banner = false;
      };
      shellAliases = {
        pping = "prettyping --nolegend";
        speedtest = "cfspeedtest";
      };
    };
    catppuccin.nushell.enable = true;
  };
}
