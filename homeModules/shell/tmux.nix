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
      baseIndex = 1;
      clock24 = true;
      enable = true;
      escapeTime = 0;
      historyLimit = 10000;
      keyMode = "vi";
      mouse = true;
      shell = lib.getExe config.programs.nushell.package;
      shortcut = "Space";

      plugins = with pkgs.tmuxPlugins; [
        battery
        better-mouse-mode
        # catppuccin
        cpu
        # vim-tmux-navigator
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-processes 'nvim'
            # set -g @resurrect-strategy-nvim 'session'

            # Post-save hook: Strips long Nix wrapper flags (--cmd lua ...) from saved sessions
            set -g @resurrect-hook-post-save-all '
              res_file=$(readlink -f ~/.local/share/tmux/resurrect/last)
              if [ -f "$res_file" ]; then
                # Strip --cmd arguments and nix store paths, leaving only "nvim"
                sed -i -E "s|/home/[^/]+/\.nix-profile/bin/nvim|nvim|g" "$res_file"
                sed -i -E "s|/nix/store/[^/]+/bin/nvim|nvim|g" "$res_file"
                sed -i -E "s|nvim --cmd [^\t]+|nvim|g" "$res_file"
              fi
            '
          '';
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '15'
          '';
        }
      ];

      extraConfig = ''
        bind Space last-window
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        unbind '"'
        unbind %
        bind c new-window -c "#{pane_current_path}"
        bind r source-file ~/.config/tmux/tmux.conf \; display-message "Tmux config reloaded!"

        set -g allow-rename on
        set -g renumber-windows on
        set -g status-left ""
        set -g status-left-length 100
        set -g status-right-length 100

        set -g status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -ag status-right "#{E:@catppuccin_status_date_time}"
        set -ag status-right " #{continuum_status}"

        # set -g window-status-format " #I:#{b:pane_current_path} "
        # set -g window-status-current-format " #[fg=cyan,bold]#I:#{b:pane_current_path}* "
        # set -g window-status-format " #I:#{pane_current_command} "
        # set -g window-status-current-format " #[fg=cyan,bold]#I:#{pane_current_command}* "

        set -g @catppuccin_pane_status_enabled "yes"
        set -g @catppuccin_pane_border_status "yes"
        set -g @catppuccin_window_status_style "rounded"
        set -g @catppuccin_window_flags "icon" # none, icon, or text
        set -g @catppuccin_window_tabs_enabled on

        setw -g automatic-rename on
      '';
      # set -agF status-right "#{E:@catppuccin_status_cpu}"
      # set -agF status-right "#{E:@catppuccin_status_battery}"
      # set -g @catppuccin_date_time "%H:%M"
      # set -g @catppuccin_flavour 'mocha'
      # set -g @catppuccin_window_tabs_enabled on
    };

    systemd.user.services.tmux =
      let
        resurrectPkg = pkgs.tmuxPlugins.resurrect;
        tmuxBin = lib.getExe config.programs.tmux.package;
      in
      {
        Unit.Description = "Tmux background service";
        Service = {
          Type = "forking";
          ExecStart = "${tmuxBin} new-session -s init -d";
          ExecStop = pkgs.writeShellScript "tmux-stop" ''
            ${tmuxBin} run-shell ${resurrectPkg}/share/tmux-plugins/resurrect/scripts/save.sh
            ${tmuxBin} kill-server
          '';
          Restart = "on-failure";
        };
        Install.WantedBy = [ "default.target" ];
      };
  };
}
