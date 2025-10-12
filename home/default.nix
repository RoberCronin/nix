{
    config,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
in {
    imports = [
        ./environment
        ./services
        ./flatpak.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

    home = {
        packages = with pkgs; [
            hello
        ];

        inherit username;
        homeDirectory = "/home/${username}";

        stateVersion = "23.11";
    };
}
