{
  description = "home-manager flake";

  inputs = {

    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11"; # Update version
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11"; # Update version
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Packages
    catppuccin.url = "github:catppuccin/nix";
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11"; # Update version
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    rofi-applets = {
      url = "gitlab:Zhaith-Izaliel/rofi-applets";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-flatpak,
    catppuccin,
    # helix,
    hyprland,
    hyprland-plugins,
    nixvim,
    plasma-manager,
    rofi-applets,
    ...
  }@inputs:
    let
      # inputs = { inherit nixpkgs nixpkgs-unstable home-manager; };

      homeSystem =
        system: hostname: username:
        let
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          unstablePkgs = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          # useGlobalPkgs = true;
          # useUserPackages = true;
          # backupFileExtension = "backup";
          # home.username = username;
          extraSpecialArgs = {
            inherit inputs pkgs system hostname username;
          };
          modules = [
            # Allow unfree packages
            { nixpkgs.config.allowUnfree = true; }
            ./hosts/${hostname}.nix
            nix-flatpak.homeManagerModules.nix-flatpak
            catppuccin.homeManagerModules.catppuccin
            # hyprland.homeManagerModules.default
            nixvim.homeManagerModules.nixvim
            plasma-manager.homeManagerModules.plasma-manager
            rofi-applets.homeManagerModules.default
            {
              # home-manager.useGlobalPkgs = true;
              # home-manager.useUserPackages = true;
              # home-manager.backupFileExtension = "backup";
              # home-manager.extraSpecialArgs = {
            }

          ];
        };

    in
    {
      homeConfigurations = {
        # NixOS hosts
        "cycad@Lenny" = homeSystem "x86_64-linux" "Lenny" "cycad";
        "cycad@NixBerry" = homeSystem "aarch64-linux" "NixBerry" "cycad";
      };
    };
}
