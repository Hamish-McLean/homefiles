{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    warp.enable = lib.mkEnableOption "enables warp";
  };
  config = lib.mkIf config.warp.enable {
    pkgs.warp-terminal = {
      enable = true;
    };
  };
}
