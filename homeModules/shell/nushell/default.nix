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
      extraConfig = ''
        use ${./noctalia2nix.nu} *
      '';
      plugins = with pkgs.nushellPlugins; [
        # dbus # broken
        gstat
        # highlight # version incompatible
        # net # broken
        # skim # broken
        # units # broken
      ];
      settings = {
        buffer_editor = "nvim";
        show_banner = false;
      };
      # shellAliases = {
      #   lss = "ls -ls size"; # list long sort by size
      #   pping = "prettyping --nolegend";
      #   speedtest = "cfspeedtest";
      # };
    };
    catppuccin.nushell.enable = true;
  };
}
