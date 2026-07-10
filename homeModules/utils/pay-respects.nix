/*
Pay Respects

Command suggestions, command-not-found and thefuck replacement written in Rust

Typed a wrong command or don't know what to do? Pay Respects will suggest a fix to your console command by simply pressing F!

https://codeberg.org/iff/pay-respects
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    pay-respects.enable = lib.mkEnableOption "enables pay-respects";
  };

  config = lib.mkIf config.pay-respects.enable {
    programs.pay-respects = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
