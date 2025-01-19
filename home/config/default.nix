{ config, lib, pkgs, ... }:
{
    imports = [
        ./alacritty.nix
        ./btop.nix
        ./starship.nix
        ./tmux.nix
    ];
}
