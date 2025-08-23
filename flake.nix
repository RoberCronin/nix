{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        nixpkgs,
        home-manager,
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
                    ./hostname.nix
                ];
            };
        };
        nixosConfigurations = {
            default = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./system
                    ./hostname.nix
                    ./hardware-configuration.nix
                ];
            };
        };
    };
}
