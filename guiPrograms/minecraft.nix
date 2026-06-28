{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    minecraft.enable = lib.mkEnableOption "enable minecraft";
  };

  config = lib.mkIf config.minecraft.enable {
    home.packages = with pkgs; [
      modrinth-app
      temurin-bin-25 # Java runtime environment
    ];
  };
}
