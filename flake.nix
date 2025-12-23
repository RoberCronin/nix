{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nixConfig = {
        extra-substituters = [
            "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
    };

    outputs = inputs @ {
        nixpkgs,
        nixpkgs-unstable,
        home-manager,
        nix-flatpak,
        ...
    }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
        pkgs-unstable = import nixpkgs-unstable {inherit system;};
        hosts = [
            "desktop"
            "laptop"
            "big_laptop"
            "tablet"
        ];
    in {
        homeConfigurations = builtins.listToAttrs (
            builtins.map (
                name: {
                    inherit name;
                    value = home-manager.lib.homeManagerConfiguration {
                        inherit pkgs;
                        modules = [
                            nix-flatpak.homeManagerModules.nix-flatpak
                            ./home
                            (
                                {lib, ...}: {
                                    options = {
                                        host = lib.mkOption {
                                            type = lib.types.str;
                                            default = name;
                                            description = "flake host";
                                        };
                                    };
                                }
                            )
                        ];
                    };
                }
            )
            hosts
        );

        nixosConfigurations = builtins.listToAttrs (
            builtins.map (
                name: {
                    inherit name;
                    value = nixpkgs.lib.nixosSystem {
                        system = "x86_64-linux";
                        specialArgs = {
                            inherit pkgs-unstable;
                        };
                        modules = [
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
