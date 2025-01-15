{ lib, pkgs, ... }:
{
    home = {
        packages = with pkgs; [
            hello
        ];

        username = "robert";
        homeDirectory = "/home/robert";

        stateVersion = "23.11";
    };

    programs.neovim = {
        enable = true;
        extraLuaPackages = ps: [ ps.magick ];
        extraPackages = with pkgs; [ imagemagick ];
    };
}
