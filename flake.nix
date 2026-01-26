{
    description = "NixOS and Home Manager config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

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
            "https://cache.nixos.org/"
            "https://attic.xuyh0120.win/lantian"
        ];

        trusted-substituters = [
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org"
            "https://cache.nixos.org/"
            "https://attic.xuyh0120.win/lantian"
        ];

        extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
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

        mkHomeConfiguration = {
            extraModules ? [],
            hostname ? host,
            host,
            user,
            userFullName,
            ...
        }:
            home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules =
                    [
                        ./home
                        ./hostOptions.nix
                        (
                            {...}: {
                                hostname = hostname;
                                host = host;
                                user = user;
                                userFullName = userFullName;
                            }
                        )
                    ]
                    ++ extraModules;
                extraSpecialArgs = {inherit inputs;};
            };

        mkNixosConfiguration = {
            extraModules ? [],
            hostname ? host,
            host,
            user,
            userFullName,
            ...
        }:
            nixpkgs.lib.nixosSystem {
                inherit system;
                modules =
                    [
                        ./nixos
                        ./hostOptions.nix
                        (
                            {...}: {
                                hostname = hostname;
                                host = host;
                                user = user;
                                userFullName = userFullName;
                            }
                        )
                    ]
                    ++ extraModules;
                specialArgs = {
                    inherit inputs;
                    inherit pkgs-stable;
                };
            };
    in {
        homeConfigurations = {
            desktop = mkHomeConfiguration {
                host = "desktop";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };

            bigLaptop = mkHomeConfiguration {
                host = "bigLaptop";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };

            laptop = mkHomeConfiguration {
                host = "laptop";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };

            tablet = mkHomeConfiguration {
                host = "tablet";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };
        };

        nixosConfigurations = {
            desktop = mkNixosConfiguration {
                extraModules = [
                    ./hardwareConfigurations/desktop.nix
                    ./nixos/modules/hardware/nvidia.nix
                    ./nixos/modules/sunshine.nix
                ];
                host = "tablet";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };

            bigLaptop = mkNixosConfiguration {
                extraModules = [
                    ./hardwareConfigurations/bigLaptop.nix
                    ./nixos/modules/hardware/nvidia.nix
                ];
                host = "bigLaptop";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };

            laptop = mkNixosConfiguration {
                extraModules = [
                    ./hardwareConfigurations/laptop.nix
                    ./nixos/modules/wacom.nix
                    ./nixos/modules/hardware/power-key.nix
                    ./nixos/modules/auto-cpufreq.nix
                ];
                host = "laptop";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };

            tablet = mkNixosConfiguration {
                extraModules = [
                    ./hardwareConfigurations/tablet.nix
                    ./nixos/modules/wacom.nix
                    ./nixos/modules/hardware/tpm.nix
                    ./nixos/modules/hardware/power-key.nix
                ];
                host = "tablet";
                user = "robert";
                userFullName = "Robert Cronin";
                flakePath = "/home/robert/nix";
            };
        };
    };
}
