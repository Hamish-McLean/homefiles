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
      theme = 
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in  {
        "*" = lib.mkForce {
          border-radius = mkLiteral "12px";
        };
        "window" = lib.mkForce {
          border = mkLiteral "2px";
          border-color = mkLiteral "#74c7ec";
        };
      };
    };
  };
}
