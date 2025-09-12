{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        fabric-widgets.url = "github:Fabric-Development/fabric";
    };

    outputs = inputs @ {
        nixpkgs,
        home-manager,
        fabric-widgets,
        ...
    }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
    in {
        homeConfigurations = {
            default = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home
                ];
            };
            desktop = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home
                    ./hosts/desktop.nix
                ];
            };
            laptop = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home
                    ./hosts/laptop.nix
                ];
            };
            big_laptop = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home
                    ./hosts/big_laptop.nix
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
        };
    };
}
