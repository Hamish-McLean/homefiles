{
  config,
  lib,
  ...
}:
{
  options = {
    obsidian.enable = lib.mkEnableOption "enable obsidian";
  };

  config = lib.mkIf config.obsidian.enable {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
      # defaultSettings = {}; # Settings as json values
      # vaults = {}; # Vault settings here
    };
  };
}
