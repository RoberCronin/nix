{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    imports = [
        ./environment
        ./config
        ./services
        ./packages.nix
        ./shell.nix
        ./xsession.nix
        ./xresources.nix
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
