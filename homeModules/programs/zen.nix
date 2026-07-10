/*
Zen browser

https://github.com/0xc000022070/zen-browser-flake
*/
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  options = {
    zen.enable = lib.mkEnableOption "enables zen";
  };

  config = lib.mkIf config.zen.enable {
    # home.packages = inputs.zen-browser.packages."${system}".default];
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.firefoxpwa];
      # profiles.* = {
      #   search
      # };
    };
  };
}
