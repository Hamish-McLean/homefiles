{ 
  config, 
  lib, 
  ... 
}:
{
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };

  config = lib.mkIf config.kitty.enable {
    
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      settings = {
        hide_window_decorations = false; # Toggle white top bar
      };
    };
    
    # catppuccin.kitty.enable = true;
  };
}
