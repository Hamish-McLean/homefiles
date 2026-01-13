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
        wallpaper = ./../../wallpapers/minimalist-black-hole.png;
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