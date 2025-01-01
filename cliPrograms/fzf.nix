{ config, lib, ... }:
{
  options = {
    fzf.enable = lib.mkEnableOption "enables fzf";
  };
  config = lib.mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
      # catppuccin.enable = true;
      enableFishIntegration = true;
      tmux.enableShellIntegration = true;
    };
    catppuccin.fzf.enable = true;
  };
}
