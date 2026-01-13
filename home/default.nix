{
    pkgs,
    config,
    ...
}: let
    wvkbd-toggle = pkgs.callPackage ./programs/wvkbd.nix {};
in {
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
        packages = [
            wvkbd-toggle
        ];

        stateVersion = "23.11";
    };
}
