/*
aerc

A pretty good email client.

https://aerc-mail.org/
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    aerc.enable = lib.mkEnableOption "enables aerc";
  };

  config = lib.mkIf config.aerc.enable {
    programs.aerc = {
      enable = true;
    };
  };
}
