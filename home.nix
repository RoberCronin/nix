{ lib, pkgs, ... }:
let
    username = "robert";
    hostname = builtins.getEnv "HOSTNAME";
in
{
    home = {
        packages = with pkgs; [
            hello
        ];

        inherit username;
        homeDirectory = "/home/${username}";

        file.hostname_file = {
            enable = true;
            text = "${hostname}";
        };

        stateVersion = "23.11";
    };

    programs.neovim = {
        enable = true;
        extraLuaPackages = ps: [ ps.magick ];
        extraPackages = with pkgs; [ imagemagick ];
    };
}
