/*
Walker

Multi-Purpose Launcher with a lot of features. Highly Customizable and fast.

https://github.com/abenz1267/walker/tree/master
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
      config = {
        # theme = "catppuccin";
      };
      runAsService = true;
      themes.catppuccin.style = ''
        @define-color window_bg_color #1e1e2e;
        @define-color accent_bg_color #6c7086;
        @define-color theme_fg_color #cdd6f4;
        @define-color error_bg_color #f38ba8;
        @define-color error_fg_color #f9e2af;
      '';
    };
  };
}

