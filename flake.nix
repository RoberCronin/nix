{
    description = "Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
    in {
        homeConfigurations = {
            robert = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home ./hostname.nix ];
            };
        };
        nixosConfigurations = {
            robert = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./system ./hostname.nix ./hardware-configuration.nix ];
            };

        };
    };
}
