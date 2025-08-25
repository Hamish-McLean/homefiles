/*
tgt

tgt is a terminal user interface for Telegram, written in Rust.

https://github.com/FedericoBruzzone/tgt?ref=terminaltrove
*/
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  options = {
    tgt.enable = lib.mkEnableOption "enables tgt";
  };

  config = lib.mkIf config.tgt.enable {
    home.packages = [
      (inputs.tgt.packages.${pkgs.unstable.system}.default)
    ];
  };
}
