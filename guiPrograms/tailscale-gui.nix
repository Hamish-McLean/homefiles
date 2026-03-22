/*
Tailscale GUI options

Tailscale systray and trayscale
*/
{
  config,
  lib,
  ...
}:
{
  options = {
    tailscale-gui.enable = lib.mkEnableOption "enable tailscale-gui";
  };

  config = lib.mkIf config.tailscale-gui.enable {
    services.tailscale-systray.enable = true;
    services.trayscale.enable = true;
  };
}

