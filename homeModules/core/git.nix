{
  config,
  lib,
  ...
}:
{
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = "HamishMcLean94@gmail.com";
          name = "Hamish McLean";
        };
        init.defaultBranch = "main";
      };
      # diff-so-fancy.enable = true;
    };
    # Delta is a syntax-highlighting pager for git, diff, grep, and blame output https://github.com/dandavison/delta
    programs.delta = {
      enable = true;
      enableGitIntegration = true;
    };
    catppuccin.delta.enable = true;
  };
}
