{ 
  config, 
  lib, 
  ... 
}:
{
  options = {
    dunst.enable = lib.mkEnableOption "enables dunst";
  };
  
  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;
      # iconTheme = {};
      # settings = {};
    };
  };
}
