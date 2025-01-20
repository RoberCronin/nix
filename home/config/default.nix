{ config, lib, pkgs, ... }:
{
    imports = [
        ./alacritty.nix
        ./btop.nix
        ./starship.nix
        ./tmux.nix
        ./polybar.nix
        ./nvim.nix
        ./picom.nix
        ./yazi.nix
        ./dunst.nix
    ];
}
