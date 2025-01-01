{ config, lib, ... }:
{
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userEmail = "HamishMcLean94@gmail.com";
      userName = "Hamish McLean";
      diff-so-fancy.enable = true;
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
