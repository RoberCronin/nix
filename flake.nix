{
    nixConfig = {
        extra-experimental-features = ["pipe-operators"];
        allow-import-from-derivation = false;
        substituters = [
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org" # hyprland
            "https://cache.nixos.org/"
            "https://attic.xuyh0120.win/lantian" # nix-cachyos-kernel
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

    inputs.self.submodules = true;
    inputs = {
        files.url = "github:mightyiam/files";
        import-tree.url = "github:vic/import-tree";
        input-branches.url = "github:mightyiam/input-branches";
        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
        hyprland.url = "github:hyprwm/Hyprland";

        nix-on-droid = {
            url = "github:nix-community/nix-on-droid";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            flake = true;
            inputs.nixpkgs.follows = "nixpkgs";
        };

        cpu-microcodes = {
            flake = false;
            url = "github:platomav/CPUMicrocodes";
        };
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree [./modules ./extraModules]);
}
