{ config, lib, pkgs, ... }:
{
    imports = [
        ./mime.nix
        ./gtk-theme.nix
        ./qt5-theme.nix
        ./background.nix
    ];
}
