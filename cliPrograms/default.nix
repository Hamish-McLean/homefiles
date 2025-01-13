/*
  Cycad's default cliPrograms home manager module.
  This imports other cliPrograms home manager modules.
  All can be enabled by setting cliPrograms = true.
  Modules are enabled by default so can be disabled by setting them to false.
*/
{ lib, config, ... }:
{
  # Cli programs to import
  imports = [
    ./bat.nix
    ./bottom.nix
    ./btop.nix
    ./cava.nix
    ./direnv.nix
    ./eza.nix
    ./fastfetch.nix
    ./fish.nix
    ./fzf.nix
    ./gh-dash.nix
    ./git.nix
    ./gitui.nix
    ./helix.nix
    ./nixvim-config.nix
    ./pandoc.nix
    ./skim.nix
    ./spotify-player.nix
    ./starship.nix
    ./tmux.nix
    # ./warp.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  # Option to enable all cliPrograms modules
  options = {
    cliPrograms.enable = lib.mkEnableOption "enables cliPrograms";
  };
  config = lib.mkIf config.cliPrograms.enable {
    bat.enable = lib.mkDefault true;
    bottom.enable = lib.mkDefault true;
    btop.enable = lib.mkDefault true;
    cava.enable = lib.mkDefault true;
    direnv.enable = lib.mkDefault true;
    eza.enable = lib.mkDefault true;
    fastfetch.enable = lib.mkDefault true; # Only in home-manager unstable
    fish.enable = lib.mkDefault true;
    fzf.enable = lib.mkDefault true;
    gh-dash.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    gitui.enable = lib.mkDefault true;
    # helix.enable = lib.mkDefault true;
    nixvim-config.enable = lib.mkDefault true;
    pandoc.enable = lib.mkDefault true;
    skim.enable = lib.mkDefault true;
    spotify-player.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    tmux.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
    # warp.enable = lib.mkDefault true; # Does this have a home manager module?
    zoxide.enable = lib.mkDefault true;
  };

}
