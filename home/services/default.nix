{ config, lib, pkgs, ... }:
{
    imports = [
        ./dunst.nix
        ./picom.nix
        ./syncthing.nix
    ];
}
