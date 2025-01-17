{ lib, pkgs, ... }:
let
    username = "robert";
    hostname = builtins.getEnv "HOSTNAME";
in
{
    home = {
        packages = with pkgs; [
            hostname
            hello
        ];

        inherit username;
        homeDirectory = "/home/${username}";

        stateVersion = "23.11";
    };

    programs.neovim = {
        enable = true;
        extraLuaPackages = ps: [ ps.magick ];
        extraPackages = with pkgs; [ imagemagick ];
    };
}
