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
    # hyprland.url = "github:hyprwm/Hyprland"; # Switched to nixpkgs version for now
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11"; # Update version
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
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
    ...
  }@inputs:
    let
      homeSystem =
        system: hostname: username:
        let
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          unstablePkgs = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = {
            inherit inputs pkgs unstablePkgs system hostname username;
          };
          modules = [
            # Allow unfree packages
            { nixpkgs.config.allowUnfree = true; }
            ./hosts/${hostname}.nix
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
            inputs.catppuccin.homeManagerModules.catppuccin
            # inputs.hyprland.homeManagerModules.default # Switched to nixpkgs version for now
            inputs.nixvim.homeManagerModules.nixvim
            inputs.plasma-manager.homeManagerModules.plasma-manager
            inputs.rofi-applets.homeManagerModules.default
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
