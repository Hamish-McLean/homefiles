/*
Doom emacs
*/
{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.doom-emacs.homeModule ];

  options = {
    doom-emacs.enable = lib.mkEnableOption "enable doom-emacs";
  };

  config = lib.mkIf config.doom-emacs.enable {
    programs.doom-emacs = {
      enable = true;
      doomDir = ./doom;
    };
  };
}

