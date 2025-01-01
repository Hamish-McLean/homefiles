{
  config,
  hyprland-plugins,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./waybar.nix
    ./rofi.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {

    home.packages = with pkgs; [ 
      brightnessctl
      hyprcursor
      hyprlock
      hyprpaper
      networkmanagerapplet
      pavucontrol
    ];

    programs.hyprlock = {
      enable = true;
      settings = {};
    };

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = true;
        preload = [ "${../../wallpapers/rainbow.png}" ];
        wallpaper = ", ${../../wallpapers/rainbow.png}";
      };
    };

    rofi.enable = true;
    waybar.enable = true;

    # catppuccin.hyprland.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      # plugins = with hyprland-plugins.packages."${pkgs.system}"; [
      #   borders-plus-plus  
      #   hyprbars
      #   # hyprspace
      #   hyprtrails
      # ];
      settings = {
        monitor = [
          "eDP-1,preferred,auto,1" # Scaling for laptop screen
          "HDMI-A-2,preferred,auto,1" # Scaling for external monitor
        ];
        input = {
          kb_layout = "gb";
        };
        general = {
          "col.active_border" = "rgb(74c7ec)";
        };
        decoration = {
          rounding = 12;
          blur = {
            enabled = true;
            size = 16;
            passes = 2;
            ignore_opacity = true;
          };
        };
        gestures = {
          workspace_swipe = "on";
        };
        "$mod" = "SUPER";
        bind =
          [
            # "$mod, exec, rofi -show drun, release"
            "$mod, SPACE, exec, rofi -show drun"
            "$mod, C, killactive"
            "$mod, E, exec, nautilus"
            "$mod, F, exec, firefox"
            "$mod, K, exec, kitty"
            "$mod, M, exit"
            "$mod, R, exec, hyprctl reload"
            "$mod, V, exec, codium"
            ", Print, exec, grimblast copy area"

            # Windows
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"
            "$mod CTRL, left, movewindow, l"
            "$mod CTRL, right, movewindow, r"
            "$mod CTRL, up, movewindow, u"
            "$mod CTRL, down, movewindow, d"
            "$mod SHIFT, left, movetoworkspace, -1"
            "$mod SHIFT, right, movetoworkspace, +1"
            "$mod, tab, workspace, e+1"
            "$mod SHIFT, tab, workspace, e-1"
            "$mod, COMMA, togglesplit"
            "$mod, PERIOD, togglefloating"

            # Media
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPrev, exec, playerctl previous"
            ", XF86audiostop, exec, playerctl stop"

            # Volume
            # ", 115, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            # ", 114, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            # ", 113, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

            # Brightness
            ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
            ", xf86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set 33%+"
            ", xf86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 33%-"

          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (
              builtins.genList (
                x:
                let
                  ws =
                    let
                      c = (x + 1) / 10;
                    in
                    builtins.toString (x + 1 - (c * 10));
                in
                [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              ) 10
            )

          );
        # Mouse binds. LMB -> 272, RMB -> 273.
        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
        bindr = [
          "$mod, SUPER_L, exec, killall rofi || rofi -show drun"
        ];

        # plugins
        "plugin:borders-plus-plus" = {
          add_borders = 1;
          natural_rounding = "yes";
        };
      };
    };
  };
}
