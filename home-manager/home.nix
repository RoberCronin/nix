{ config, lib, pkgs, ... }:
let
    username = "robert";
    hostname = config.hostdata.hostname;
in
{
    imports = [
    ../hostname.nix
    ./environment
    ];
    
    home = {
        packages = with pkgs; [
            hello
        ];

        inherit username;
        homeDirectory = "/home/${username}";

        file.out = {
            enable = true;
            text = "${hostname}";
        };

        stateVersion = "23.11";
    };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };
}
