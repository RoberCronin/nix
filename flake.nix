{
    nixConfig = {
        extra-experimental-features = ["pipe-operators"];
        allow-import-from-derivation = false;
        substituters = [
            "https://nix-community.cachix.org"
            "https://cache.nixos.org/"
        ];

        trusted-substituters = [
            "https://nix-community.cachix.org"
            "https://cache.nixos.org/"
        ];

        extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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

        nix-on-droid = {
            url = "github:nix-community/nix-on-droid";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/master";
            flake = true;
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree [./modules]);
}
