{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  options = {
    flatpak.enable = lib.mkEnableOption "enables flatpak";
  };

  config = lib.mkIf config.flatpak.enable {
    home.sessionVariables = {
      # Appends Flatpak export paths to your existing XDG data directories
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };
    services.flatpak = {
      enable = true;
      packages = [
        # "app.zen_browser.zen" # Zen browser
        "com.github.tchx84.Flatseal" # Flatseal flatpak manager
        "com.modrinth.ModrinthApp" # Modrinth
        "com.play0ad.zeroad" # 0 A.D.
      ];
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      update.onActivation = true;
    };
    services.flatpak.overrides = {
      "com.modrinth.ModrinthApp" = {
        Environment.NIXOS_OZONE_WL = "1";
        Context = {
          filesystems = [
            "/data/games/minecraft/modrinth"
          ];
          sockets = [
            "x11"
            "wayland"
            "fallback-x11"
          ];
          devices = [
            "dri" # Direct Rendering Infrastructure (Crucial for GPU acceleration)
          ];
          features = [
            "gstreamer"
          ];
        };
      };
    };
  };
}
