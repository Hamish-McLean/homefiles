{
  inputs,
  withSystem,
  ...
}:
let
  mkHome =
    system: hostname: username:
    withSystem system (
      { pkgs, ... }:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs username; };
        modules = [
          # { nixpkgs.pkgs = pkgs; }
          { nix.package = pkgs.nix; }
          ../hosts/${hostname}.nix
          # ../modules
          # ../profiles
        ];
      }
    );
in
{
  flake.homeConfigurations = {
    "cycad@Radagast" = mkHome "x86_64-linux" "Radagast" "cycad";
    "cycad@Lenny" = mkHome "x86_64-linux" "Lenny" "cycad";
    "cycad@NixBerry" = mkHome "aarch64-linux" "NixBerry" "cycad";

    # # NixOS-WSL hosts
    # "cycad@Roger" = mkHome "x86_64-linux" "Roger" "cycad";
    #
    # # nix-on-droid hosts
    # "nix-on-droid@localhost" = mkHome "aarch64-linux" "localhost" "nix-on-droid"; # Username must be set to nix-on-droid
  };
}
