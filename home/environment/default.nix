{ config, lib, pkgs, ... }:
{
    imports = [
        ./mime.nix
        ./gtk-theme.nix
        ./background.nix
    ];
}
