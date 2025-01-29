# Cycad's default home manager module which imports other home manager modules
{
  pkgs,
  username,
  # inputs,
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

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
  };

  home = {
    username = username;
    homeDirectory = /home/${username};
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "CodeNewRoman"
          "DroidSansMono"
          "FantasqueSansMono"
          "FiraCode"
          "FiraMono"
          "JetBrainsMono"
        ];
      })
    ];
  };

  # Fonts
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "JetBrainsMono" ];
      monospace = [ "JetBrainsMono" ];
      sansSerif = [ "JetBrainsMono" ];
      serif = [ "JetBrainsMono" ];
    };
  };

  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = secrets/secrets.yaml;
  };

  xdg.enable = true;
}
