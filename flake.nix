{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        fabric-widgets.url = "github:Fabric-Development/fabric";

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    outputs = inputs @ {
        nixpkgs,
        home-manager,
        fabric-widgets,
        nix-flatpak,
        ...
    }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
    in {
        homeConfigurations = {
            default = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    nix-flatpak.homeManagerModules.nix-flatpak
                    ./home
                ];
            };
            desktop = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    nix-flatpak.homeManagerModules.nix-flatpak
                    ./home
                    ./hosts/desktop.nix
                ];
            };
            laptop = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    nix-flatpak.homeManagerModules.nix-flatpak
                    ./home
                    ./hosts/laptop.nix
                ];
            };
            big_laptop = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    nix-flatpak.homeManagerModules.nix-flatpak
                    ./home
                    ./hosts/big_laptop.nix
                ];
            };
            tablet = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    nix-flatpak.homeManagerModules.nix-flatpak
                    ./home
                    ./hosts/tablet.nix
                ];
            };
        };
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./system
                    ./hosts/desktop.nix
                    ./hardware_configurations/desktop.nix
                ];
                specialArgs = {
                    inherit inputs;
                };
            };
            laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./system
                    ./hosts/laptop.nix
                    ./hardware_configurations/laptop.nix
                ];
                specialArgs = {
                    inherit inputs;
                };
            };
            big_laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./system
                    ./hosts/big_laptop.nix
                    ./hardware_configurations/big_laptop.nix
                ];
                specialArgs = {
                    inherit inputs;
                };
            };
            tablet = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./system
                    ./hosts/tablet.nix
                    ./hardware_configurations/tablet.nix
                ];
                specialArgs = {
                    inherit inputs;
                };
            };
        };
    };
}
