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
                        modules = [
                            ./system
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
