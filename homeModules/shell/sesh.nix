{
  config,
  lib,
  ...
}:
{
  options = {
    sesh.enable = lib.mkEnableOption "enable sesh";
  };

  config = lib.mkIf config.sesh.enable {
    programs.sesh = {
      enable = true;
      enableAlias = false; # breaks nushell
    };
  };
}
