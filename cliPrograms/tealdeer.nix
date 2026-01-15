/*
tealdeer

A very fast implementation of tldr in Rust.

https://github.com/tealdeer-rs/tealdeer
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    tealdeer.enable = lib.mkEnableOption "enable tealdeer";
  };

  config = lib.mkIf config.tealdeer.enable {
    programs.tealdeer = {
      enable = true;
      enableAutoUpdates = true;
      settings = {
        updates = {
          auto_update = true;
          auto_update_interval_hours = 168; # 168 hours = 1 week
        };
      };
    };
  };
}

