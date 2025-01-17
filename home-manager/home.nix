{ lib, pkgs, ... }:
let
    username = "robert";
in
{
    home = {
        packages = with pkgs; [
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
