{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    imports = [
        ./environment
        ./config
        ./packages.nix
        ./shell.nix
        ./xsession.nix
    ];
    
    home = {
        packages = with pkgs; [
            hello
        ];

        inherit username;
        homeDirectory = "/home/${username}";

        stateVersion = "23.11";
    };
}
