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
    # cosmic-manager = {
    #   url = "github:HeitorAugustoLN/cosmic-manager";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     # home-manager.follows = "home-manager";
    #   };
    # };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "github:hyprwm/Hyprland"; # Switched to nixpkgs version for now
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    hyprpanel = { 
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
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
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; overlays = [inputs.hyprpanel.overlay];};
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
            inputs.catppuccin.homeManagerModules.catppuccin
            # inputs.cosmic-manager.homeManagerModules.cosmic-manager
            # inputs.hyprland.homeManagerModules.default # Switched to nixpkgs version for now
            inputs.hyprpanel.homeManagerModules.hyprpanel
            inputs.nixvim.homeManagerModules.nixvim
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
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

        # nix-on-droid hosts
        "nix-on-droid@localhost" = homeSystem "aarch64-linux" "localhost" "nix-on-droid"; # Username must be set to nix-on-droid
      };
    };
}
