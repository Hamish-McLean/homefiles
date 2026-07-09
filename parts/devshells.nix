_: {
  perSystem = { pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      name = "homefiles";

      packages = with pkgs; [
        just
        nix-inspect
        nvd # For generation diffs
        statix # Helpful linting suggestions
      ];

      shellHook = ''
        # Standard ANSI 16-color names
        # 36 = Cyan, 34 = Blue, 32 = Green, 0 = Reset. Adding '1;' makes it Bold.
        COLOR_TITLE='\033[1;34m'  # Will render as Catppuccin Blue / Sapphire
        COLOR_ACCENT='\033[1;36m' # Will render as Catppuccin Cyan / Sky
        COLOR_RESET='\033[0m'

        echo -e "''${COLOR_TITLE}  homefiles development shell active''${COLOR_RESET}"
      '';
    };
  };
}
