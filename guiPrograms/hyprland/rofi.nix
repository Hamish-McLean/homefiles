{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    rofi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.rofi.enable {
    home.packages = [ pkgs.rofi ];
    # catppuccin.rofi.enable = true;
    programs.rofi = {
      enable = true;
      location = "center";
      terminal = "${pkgs.kitty}/bin/kitty";
      # plugins = [];
      extraConfig = {
        display-drun="   Apps ";
        display-run="   Run ";
        display-window=" 󰕰  Window";
        display-Network=" 󰤨  Network";
        sidebar-mode=true;
        show-icons = true;
      };
    };
  };
}
