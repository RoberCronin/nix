{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";
        hyprgrass = {
            url = "github:horriblename/hyprgrass";
            inputs.hyprland.follows = "hyprland";
        };
    };

    nixConfig = {
        substituters = [
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org"
        ];

        trusted-substituters = [
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org"
        ];

        extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
    };

    outputs = inputs @ {
        nixpkgs,
        nixpkgs-stable,
        home-manager,
        ...
    }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
        pkgs-stable = import nixpkgs-stable {
            inherit system;
            config = {allowUnfree = true;};
        };
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
                        extraSpecialArgs = {inherit inputs;};
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
                            inherit inputs;
                            inherit pkgs-stable;
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
                    };
                }
            )
            hosts
        );
    };
}
