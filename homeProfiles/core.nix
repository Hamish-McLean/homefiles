{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.custom.homeProfiles.core;
in
{
  options.custom.homeProfiles.core = {
    enable = mkEnableOption "Enable core profile";
  };

  config = mkIf cfg.enable {
    custom.homeModules = {
      core = {
        catppuccin.enable = mkDefault true;
      };
    };

    # Core
    gh.enable = mkDefault true;
    git.enable = mkDefault true;
    nh.enable = mkDefault true;

    # Editors
    doom-emacs.enable = mkDefault false;
    helix.enable = mkDefault false;
    nvf.enable = mkDefault true;

    # Services
    syncthing.enable = true;

    # Shell
    atuin.enable = mkDefault true;
    bash.enable = mkDefault true;
    carapace.enable = mkDefault true;
    direnv.enable = mkDefault true;
    eza.enable = mkDefault true;
    fish.enable = mkDefault false;
    nushell.enable = mkDefault true;
    shell-aliases.enable = mkDefault true;
    starship.enable = mkDefault true;
    tmux.enable = mkDefault true;
    zellij.enable = mkDefault false;
    zoxide.enable = mkDefault true;

    # Utils
    bat.enable = mkDefault true;
    bottom.enable = mkDefault true;
    broot.enable = mkDefault true;
    btop.enable = mkDefault true;
    fastfetch.enable = mkDefault true;
    fzf.enable = mkDefault true;
    imv.enable = mkDefault true;
    lazygit.enable = mkDefault true;
    pay-respects.enable = mkDefault true;
    skim.enable = mkDefault true;
    tealdeer.enable = mkDefault true;
    yazi.enable = mkDefault true;

    home.packages = with pkgs; [
      cfspeedtest # cloudflare speedtest
      dust # disk utility
      dysk # filesystem overview
      fd # better find
      has # check presence of tool in path
      prettyping # prettier ping
      progress # progress bars
      ripgrep # better grep
    ];
  };
}
