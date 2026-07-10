/*
  Cycad's home manager module for Lenny.
  This imports Cycad's default home manager module which imports the other modules.
  Modules can be enabled or disabled here.
*/
{
  pkgs,
  ...
}:
{
  imports = [
    ../default.nix
    ../cliPrograms
    ../guiPrograms
  ];

  # Custom profiles
  custom.homeProfiles = {
    core.enable = true;
    desktop.enable = true;
  };

  # Enable all cliPrograms modules
  cliPrograms.enable = true;

  # Enable all guiPrograms modules
  guiPrograms.enable = true;

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

  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    TERMINAL = "kitty";
    TERM = "kitty";
  };

  # Extra programs
  home.packages = with pkgs; [
    # dwarf-fortress-packages.dwarf-fortress-full
    gimp
    inkscape
    moonlight-qt
  ];
}
