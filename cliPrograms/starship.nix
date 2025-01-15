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
        os = {
          symbols.NixOS = "  ";
          style = "sapphire";
          disabled = false;
        };
        shell = {
          bash_indicator = " ";
          fish_indicator = "󰈺 "; #    󰈺
          disabled = false;
        };
      };
    };
    catppuccin.starship.enable = true;
  };
}
