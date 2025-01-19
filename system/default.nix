{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    imports =  [
        ./hardware
        ./required
        ./options.nix
        ./virtualization.nix
        ./packages.nix
        ./fonts.nix
    ];
}
