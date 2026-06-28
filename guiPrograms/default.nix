/*
  Cycad's default guiPrograms home manager module.
  This imports other guiPrograms home manager modules.
  All can be enabled by setting guiPrograms = true.
  Modules are enabled by default so can be disabled by setting them to false.
*/
{
  config,
  lib,
  pkgs,
  ...
}:
{
  # GUI programs to import
  imports = [
    ./anyrun.nix
    ./cosmic.nix
    ./feh.nix
    ./flatpak.nix
    ./freetube.nix
    ./ghostty.nix
    ./gnome.nix
    ./gtk.nix
    ./hyprland/hyprland.nix
    ./kitty.nix
    ./librewolf.nix
    ./mangohud.nix
    ./mime-defaults.nix
    ./minecraft.nix
    ./niri.nix
    ./nixcord.nix
    ./obsidian.nix
    ./plasma.nix
    ./qt.nix
    ./spicetify.nix
    ./tailscale-gui.nix
    ./thunderbird.nix
    ./vscodium.nix
    ./walker.nix
    ./zathura.nix
    ./zed-editor.nix
    ./zen.nix
  ];

  # Option to enable all guiPrograms modules
  options = {
    guiPrograms.enable = lib.mkEnableOption "enables guiPrograms";
  };
  config = lib.mkIf config.guiPrograms.enable {

    home.packages = with pkgs; [
      blueman # Bluetooth config tool
      calibre # ebook manager
      endless-sky # Space game
      karere # Whatsapp client
      libreoffice-qt-fresh # QT version of libreoffice
      nmgui # Network manager GUI
      opensnitch-ui # Application firewall
      resources # Task manager GUI
      rpi-imager # Raspberry pi imager
      runelite # Runescape client
      supertuxkart
      qalculate-gtk # Calculator
      qbittorrent # Torrent client
      wl-clipboard
      zapzap # Whatsapp client
      zotero

      # File managers
      lxqt.pcmanfm-qt
      nautilus
      thunar

      # Unstable packages
      # unstable.stremio # CVEs detected
    ];

    # Desktop environments
    cosmic.enable = lib.mkDefault false;
    gnome_config.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault true;
    niri.enable = lib.mkDefault true;
    plasma.enable = lib.mkDefault false;

    # GUI libraries
    gtk_config.enable = lib.mkDefault true;
    qt_config.enable = lib.mkDefault true;

    # Programs
    anyrun.enable = lib.mkDefault false;
    feh.enable = lib.mkDefault true;
    # flatpak.enable = lib.mkDefault true;
    freetube.enable = lib.mkDefault true;
    ghostty.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;
    mangohud.enable = lib.mkDefault true;
    mime-defaults.enable = lib.mkDefault true;
    minecraft.enable = lib.mkDefault true;
    nixcord.enable = lib.mkDefault true;
    obsidian.enable = lib.mkDefault true;
    spicetify.enable = lib.mkDefault true;
    tailscale-gui.enable = lib.mkDefault true;
    thunderbird.enable = lib.mkDefault true;
    vscodium.enable = lib.mkDefault true;
    walker.enable = lib.mkDefault true;
    zathura.enable = lib.mkDefault true;
    zed-editor.enable = lib.mkDefault true;
    zen.enable = lib.mkDefault false;

    # Services
    services.opensnitch-ui.enable = lib.mkDefault true;

    # Themes
    catppuccin.cursors = {
      enable = true;
      flavor = "mocha";
      accent = "sapphire";
    };
  };

}
