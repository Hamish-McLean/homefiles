/*
  Home manager module for nix-on-droid.
  This imports Cycad's default home manager module which imports the other modules.
  Modules can be enabled or disabled here.
*/
{
  username,
  ...
}:
{
  imports = [
    ../cliPrograms
  ];

  # Enable all cliPrograms modules
  cliPrograms.enable = true;

  # Disable specific modules


  home = {
    username = username;
    homeDirectory = "data/data/com.termux.nix/files/home";
  };
}
