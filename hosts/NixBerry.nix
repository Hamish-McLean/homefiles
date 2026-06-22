/*
  Cycad's home manager module for NixBerry.
  This imports Cycad's default home manager module which imports the other modules.
  Modules can be enabled or disabled here.
*/
{ ... }:
{
  imports = [
    ../default.nix
    ../cliPrograms
  ];

  # Enable all cliPrograms modules
  cliPrograms.enable = true;

  # Disable specific modules

  # Syncthing
  syncthing.enable = true;
  services.syncthing.settings.folders = {
    Obsidian = {
      devices = [
        "Lenny"
        "Pixel7"
        "Roger"
        "Radagast"
      ];
      id = "y8yy4-zven7";
      path = "~/Obsidian";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Workaround for "unable to download 'https://git.sr.ht/~rycee"
  # https://github.com/nix-community/home-manager/issues/4879
  manual = {
    html.enable = false;
    manpages.enable = false;
    json.enable = false;
  };

}
