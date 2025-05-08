{
  config,
  lib,
  ...
}:
{
  options = {
    nushell.enable = lib.mkEnableOption "enables nushell";
  };

  config = lib.mkIf config.nushell.enable {
    programs.nushell = {
      enable = true;
      configFile.text = ''
        $env.config.show_banner = false
      '';
    };
    # catppuccin.nushell.enable = true;
  };
}
