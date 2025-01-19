{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    imports =  [
        /etc/nixos/hardware-configuration.nix
        ./required
        ./options.nix
        ./virtualization.nix
        ./packages.nix
        ./fonts.nix
    ];
}
