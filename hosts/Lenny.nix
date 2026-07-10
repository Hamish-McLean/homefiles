/*
  Cycad's home manager module for Lenny.
  This imports Cycad's default home manager module which imports the other modules.
  Modules can be enabled or disabled here.
*/
_: {
  imports = [
    ../default.nix
  ];

  # Custom profiles
  custom.homeProfiles = {
    core.enable = true;
    desktop.enable = true;
  };

  # Custom options
  rbw.enable = true; # Bitwarden CLI
  vscodium.enable = false; # Disable due to build issues

  # Syncthing
  syncthing.enable = true;
  services.syncthing.settings.folders = {
    Obsidian = {
      devices = [
        "Pixel7"
        "Roger"
        "Radagast"
        "NixBerry"
      ];
      id = "y8yy4-zven7";
      path = "~/Obsidian";
    };
  };

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

}
