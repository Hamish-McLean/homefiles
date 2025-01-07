# Cycad's default home manager module which imports other home manager modules
{ 
  pkgs, 
  username, 
  inputs, 
  ... 
}:
{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    # ./cliPrograms # These are now imported in host
    # ./guiPrograms
    # inputs.catppuccin.homeManagerModules.catppuccin
  ];

  home = {
    username = username;
    homeDirectory = /home/cycad;
    packages = with pkgs; [
      (nerdfonts.override { 
        fonts = [ 
          "CodeNewRoman"
          "DroidSansMono"
          "FantasqueSansMono"
          "FiraCode"
        ]; 
      })
    ];
  };

  # Fonts
  fonts.fontconfig.enable = true;

  xdg.enable = true;

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
    cursors = {
      enable = true;
      flavor = "mocha";
      accent = "sapphire";
    };
  };
  # home.packages = [
  #   (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  # ];
}
