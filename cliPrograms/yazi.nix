{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    yazi.enable = lib.mkEnableOption "enables yazi";
  };

  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      plugins = {
        starship = pkgs.fetchFromGitHub {
          owner = "Rolv-Apneseth";
          repo = "starship.yazi";
          rev = "main";
          sha256 = "sha256-xcz2+zepICZ3ji0Hm0SSUBSaEpabWUrIdG7JmxUl/ts=";
        };
      };
      initLua = ''
        require("starship"):setup()
      '';
      # settings = {};
    };
    catppuccin.yazi.enable = true;
  };
}
