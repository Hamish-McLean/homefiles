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
        wallpaper = ./../../wallpapers/catppuccin-sparkles.jpg;
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
