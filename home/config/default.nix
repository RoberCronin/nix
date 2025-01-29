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
        ./rofi.nix
        ./i3.nix
        ./git.nix
    ];
}
