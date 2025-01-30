{ config, lib, pkgs, ... }:
{
    qt = {
        enable = true;
        style = {
            package = pkgs.catppuccin-qt5ct;
            name = "catppuccin-macchiato-maroon";
        };
    };
}
