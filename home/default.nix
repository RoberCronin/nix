{...}: {
    imports = [
        ./config_files
        ./environment
        ./services
        ./programs

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
