{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ {
        nixpkgs,
        nixpkgs-stable,
        home-manager,
        nix-flatpak,
        stylix,
        ...
    }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
        pkgs-stable = import nixpkgs-stable {inherit system;};
        hosts = [
            "desktop"
            "laptop"
            "big_laptop"
            "tablet"
        ];
    in {
        homeConfigurations = {
            default = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    nix-flatpak.homeManagerModules.nix-flatpak
                    stylix.homeModules.stylix
                    ./home
                ];
            };
        };

        nixosConfigurations = builtins.listToAttrs (
            builtins.map (
                name: {
                    inherit name;
                    value = nixpkgs.lib.nixosSystem {
                        system = "x86_64-linux";
                        specialArgs = {
                            inherit pkgs-stable;
                        };
                        modules = [
                            stylix.nixosModules.stylix
                            ./nixos
                            ./hosts/${name}.nix
                            ./hardware_configurations/${name}.nix
                            (
                                {lib, ...}: {
                                    options = {
                                        hostname = lib.mkOption {
                                            type = lib.types.str;
                                            default = name;
                                            description = "Networking hostname";
                                        };
                                    };
                                }
                            )
                        ];

                        specialArgs = {
                            inherit inputs;
                        };
                    };
                }
            )
            hosts
        );
    };
}
