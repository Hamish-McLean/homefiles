{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.desktop;
in
{
  options.custom.homeProfiles.desktop = {
    enable = mkEnableOption "Enable desktop profile";
  };

  config = mkIf cfg.enable {
    custom.homeModules = {
      core.catppuccin.cursors.enable = mkDefault true;
    };

    # Desktop
    anyrun.enable = mkDefault false;
    cosmic.enable = mkDefault false;
    gnome_config.enable = mkDefault false;
    gtk_config.enable = mkDefault true;
    hyprland.enable = mkDefault false;
    mime-defaults.enable = mkDefault true;
    niri.enable = mkDefault true;
    noctalia.enable = mkDefault true;
    plasma.enable = mkDefault false;
    qt_config.enable = mkDefault true;
    walker.enable = mkDefault true;

    # Programs
    feh.enable = mkDefault true;
    flatpak.enable = mkDefault false;
    freetube.enable = mkDefault true;
    ghostty.enable = mkDefault true;
    kitty.enable = mkDefault true;
    librewolf.enable = mkDefault true;
    nixcord.enable = mkDefault true;
    obsidian.enable = mkDefault true;
    spicetify.enable = mkDefault true;
    tailscale-gui.enable = mkDefault true;
    thunderbird.enable = mkDefault true;
    vscodium.enable = mkDefault true;
    zathura.enable = mkDefault true;
    zed-editor.enable = mkDefault true;
    zen.enable = mkDefault false;

    # Services
    services.opensnitch-ui.enable = mkDefault true;

    home.sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "nvim";
      TERMINAL = "kitty";
      TERM = "kitty";
    };

    # Packages
    home.packages = with pkgs; [
      blueman # Bluetooth config tool
      calibre # ebook manager
      gimp
      inkscape
      karere # Whatsapp client
      libreoffice-qt-fresh # QT version of libreoffice
      moonlight-qt
      nmgui # Network manager GUI
      # opensnitch-ui # Application firewall
      resources # Task manager GUI
      rpi-imager # Raspberry pi imager
      qalculate-gtk # Calculator
      qbittorrent # Torrent client
      wl-clipboard
      zapzap # Whatsapp client
      zotero

      # File managers
      lxqt.pcmanfm-qt
      nautilus
      thunar
    ];
  };
}
