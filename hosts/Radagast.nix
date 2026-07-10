/*
  Cycad's home manager module for Radagast.
  This imports Cycad's default home manager module which imports the other modules.
  Modules can be enabled or disabled here.
*/
_: {
  imports = [
    ../default.nix
    ../cliPrograms
  ];

  # Custom profiles
  custom.homeProfiles = {
    core.enable = true;
    desktop.enable = true;
    gaming.enable = true;
  };

  # Enable all cliPrograms modules
  cliPrograms.enable = true;

  # Custom options
  rbw.enable = true; # Bitwarden CLI

  # Syncthing
  syncthing.enable = true;
  services.syncthing.settings.folders = {
    Obsidian = {
      devices = [
        "Lenny"
        "Pixel7"
        "Roger"
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
