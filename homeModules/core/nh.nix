/*
Nix Helper

nh is configured in the nixos flake.
This home-manager module should only be enabled on non-NixOS systems.
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    nh.enable = lib.mkEnableOption "enable home-manager nh on non-nixos systems";
  };

  config = lib.mkIf config.nh.enable {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 2";
      };
    };
  };
}
