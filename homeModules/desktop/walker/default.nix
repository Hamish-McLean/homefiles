/*
  Walker

  Multi-Purpose Launcher with a lot of features. Highly Customizable and fast.

  https://github.com/abenz1267/walker
*/
{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.walker.homeManagerModules.default ];

  options = {
    walker.enable = lib.mkEnableOption "enable walker";
  };

  config = lib.mkIf config.walker.enable {
    programs.walker = {
      enable = true;
      config.theme = "catppuccin";
      runAsService = true;
      themes.catppuccin.style = builtins.readFile ./catppuccin.css;
    };

    programs.elephant = {
      enable = true;
      settings = { };
      provider = {
        websearch.settings = {
          default = "DuckDuckGo";
          entries = [
            {
              name = "DuckDuckGo";
              url = "https://duckduckgo.com/?q=%TERM%";
              icon = "duckduckgo";
            }
            {
              name = "NixOS Options";
              url = "https://search.nixos.org/options?query=%TERM%";
              icon = "distributor-logo-nixos";
            }
            {
              name = "Home-manager Options";
              url = "https://home-manager-options.extranix.com/?query=%TERM%";
              icon = "distributor-logo-nixos";
            }
            {
              name = "nixpkgs";
              url = "https://search.nixos.org/packages?query=%TERM%";
              icon = "distributor-logo-nixos";
            }
            {
              name = "YouTube";
              url = "https://www.youtube.com/results?search_query=%TERM%";
              icon = "youtube";
            }
          ];
        };
      };
    };
  };
}
