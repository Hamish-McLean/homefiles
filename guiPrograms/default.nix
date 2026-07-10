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
    ./feh.nix
    ./flatpak.nix
    ./freetube.nix
    ./ghostty.nix
    ./kitty.nix
    ./librewolf.nix
    ./mangohud.nix
    ./minecraft.nix
    ./nixcord.nix
    ./obsidian.nix
    ./spicetify.nix
    ./tailscale-gui.nix
    ./thunderbird.nix
    ./vscodium.nix
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

    # Programs
    feh.enable = lib.mkDefault true;
    # flatpak.enable = lib.mkDefault true;
    freetube.enable = lib.mkDefault true;
    ghostty.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;
    mangohud.enable = lib.mkDefault true;
    minecraft.enable = lib.mkDefault true;
    nixcord.enable = lib.mkDefault true;
    obsidian.enable = lib.mkDefault true;
    spicetify.enable = lib.mkDefault true;
    tailscale-gui.enable = lib.mkDefault true;
    thunderbird.enable = lib.mkDefault true;
    vscodium.enable = lib.mkDefault true;
    zathura.enable = lib.mkDefault true;
    zed-editor.enable = lib.mkDefault true;
    zen.enable = lib.mkDefault false;

    # Services
    services.opensnitch-ui.enable = lib.mkDefault true;
  };

}
