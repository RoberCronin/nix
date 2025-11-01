{...}: {
    imports = [
        ./environment
        ./services
        ./programs

        ./flatpak.nix
        ./stylix.nix
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
