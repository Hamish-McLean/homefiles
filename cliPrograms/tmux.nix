{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux";
  };
  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      # catppuccin.enable = true;
      shell = "${pkgs.fish}/bin/fish";
      #keyMode = "vi";
      clock24 = true;
      historyLimit = 10000;
      plugins = with pkgs.tmuxPlugins; [
        # catppuccin
        better-mouse-mode
      ];
      extraConfig = ''
        set -g mouse on
        set -g @catppuccin_flavour 'mocha'
        set -g @catppuccin_window_tabs_enabled on
        set -g @catppuccin_date_time "%H:%M"
      '';
    };
    # catppuccin.tmux.enable = true;
  };
}
