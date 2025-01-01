{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    starship.enable = lib.mkEnableOption "enables starship";
  };
  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      # Configuration written to ~/.config/starship.toml
      # catppuccin.enable = true;
      settings = {
        add_newline = true;
        format = "$all";
        # palette = "catppuccin_${flavour}";

        # character = {
        #   success_symbol = "[➜](bold green)";
        #   error_symbol = "[➜](bold red)";
        # };

        # package.disabled = true;
      }; # // builtins.fromTOML (builtins.readFile
      # (pkgs.fetchFromGitHub
      #   {
      #     owner = "catppuccin";
      #     repo = "starship";
      #     rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
      #     sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
      #   } + /palettes/${flavour}.toml));
    };
    catppuccin.starship.enable = true;
  };
}
