{config, ...}: {
    imports = [
        ./configFiles
        ./environment
        ./services
        ./programs

        ./flatpak.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

    home = {
        username = config.user;
        homeDirectory = "/home/${config.user}";

        stateVersion = "23.11";
    };
}
