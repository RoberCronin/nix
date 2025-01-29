{ config, lib, pkgs, ... }:
{
    imports = [
        ./alacritty.nix
        ./btop.nix
        ./starship.nix
        ./tmux.nix
        ./polybar.nix
        ./nvim.nix
        ./yazi.nix
        ./rofi.nix
        ./i3.nix
        ./git.nix
        ./fcitx.nix
    ];
}
