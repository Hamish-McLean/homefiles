# Cycad's default home manager module which imports other home manager modules
{
  inputs,
  pkgs,
  username,
  ...
}:
{
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  # Custom modules
  custom.homeModules.core.catppuccin.enable = true;

  home = {
    inherit username;
    homeDirectory = /home/${username};
  };

  # Fonts
  home.packages = with pkgs.nerd-fonts; [
    code-new-roman
    droid-sans-mono
    fantasque-sans-mono
    fira-code
    fira-mono
    jetbrains-mono
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "JetBrainsMono Nerd Font" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "JetBrainsMono Nerd Font" ];
      serif = [ "JetBrainsMono Nerd Font" ];
    };
  };

  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = secrets/secrets.yaml;
  };

  xdg.enable = true;
  home.preferXdgDirectories = true;
}
