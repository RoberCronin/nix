{ config, lib, pkgs, ... }:
let
    username = "robert";
in
{
    imports = [../hostname.nix];
    
    home = {
        packages = with pkgs; [
            hello
        ];

        inherit username;
        homeDirectory = "/home/${username}";

        file.out = {
            enable = true;
            text = "${config.hostdata.hostname}";
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
