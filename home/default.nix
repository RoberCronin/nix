{...}: {
    imports = [
        ./environment
        ./services
        ./flatpak.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

    home = {
        # packages = with pkgs; [];

        username = "robert";
        homeDirectory = "/home/robert";

        stateVersion = "23.11";
    };
}
