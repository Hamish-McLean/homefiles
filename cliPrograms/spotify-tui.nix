{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    spotify-tui.enable = lib.mkEnableOption "enables spotify-tui";
  };
  config = lib.mkIf config.spotify-tui.enable {
    home.packages = [ pkgs.spotify-tui ];
  };
}
