/*
Anyrun

A wayland native, highly customizable runner.

https://github.com/anyrun-org/anyrun
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    anyrun.enable = lib.mkEnableOption "enable anyrun";
  };

  config = lib.mkIf config.anyrun.enable {
    programs.anyrun = {
      enable = true;
    };
  };
}

