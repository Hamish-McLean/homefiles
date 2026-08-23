{
  config,
  lib,
  ...
}:
{
  options = {
    x.enable = lib.mkEnableOption "enable x";
  };

  config = lib.mkIf config.x.enable {
    programs.x = {

    };
  };
}
