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
          devices = [
            "dri" # Direct Rendering Infrastructure (Crucial for GPU acceleration)
          ];
          features = [
            "gstreamer"
          ];
          filesystems = [
            "/data/games/minecraft/modrinth"
            "xdg-config/gtk-3.0:ro" # Feeds host GTK settings
            "xdg-config/gtk-4.0:ro"
            "/usr/share/icons:ro" # Ensures it can find Adwaita/fallback icons
          ];
          sockets = [
            "fallback-x11"
            "session-bus"
            "wayland"
            "x11"
          ];
          talk-name = [
            "org.freedesktop.portal.Documents"
            "org.freedesktop.portal.Flatpak"
          ];
        };
      };
    };
  };
}
