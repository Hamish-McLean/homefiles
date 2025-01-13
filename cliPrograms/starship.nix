{
  config,
  lib,
  ...
}:
{
  options = {
    starship.enable = lib.mkEnableOption "enables starship";
  };
  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = "$all";
        # palette = "catppuccin_${flavour}";

        # character = {
        #   success_symbol = "[➜](bold green)";
        #   error_symbol = "[➜](bold red)";
        # };

        # package.disabled = true;
      };
    };
    catppuccin.starship.enable = true;
  };
}
