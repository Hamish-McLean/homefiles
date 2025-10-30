/*
Nushell

A new type of shell.
*/
{
  config,
  lib,
  pkgs,
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
      # extraConfig = ''
      #   # This doesn't work because nushell doesn't have a good way to detect if a variable has been set 
      #   # tmux auto-start
      #   if (($env | get columns | where { $it == "TMUX" }) | is-empty) {
      #     # TMUX is not set, so execute tmux.
      #     # 'exec' replaces the current nu process with the tmux process.
      #     exec ${pkgs.tmux}/bin/tmux new-session -A -s main
      #   }
      # '';
    };
    catppuccin.nushell.enable = true;
  };
}
