{
  config,
  lib,
  ...
}:
{
  options = {
    hyprpaper.enable = lib.mkEnableOption "enables hyprpaper";
  };

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper =
      let
        wallpaper = ./../../wallpapers/catppuccin-nix-nineish-alt.svg;
      in
      {
        enable = true;
        settings = {
          ipc = "on";
          splash = false;
          preload = [ "${wallpaper}" ];
          wallpaper = [ ",${wallpaper}" ];
        };
      };
  };
}
