{...}: {
    imports = [
        ./configs
        ./environment
        ./services

        ./flatpak.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

    home = {
        username = "robert";
        homeDirectory = "/home/robert";

        stateVersion = "23.11";
    };
}
