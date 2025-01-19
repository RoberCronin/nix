# This file is where information about the host is stored.
# it is referenced throughout the configuration.
# copy this file and rename it to hostname.nix then
# change the variables in the let ... in block to reflect
# the system. 
# then run command 'git add --intent-to-add hostname.nix'
# then run command 'git update-index --assume-unchanged hostname.nix'

{ config, lib, pkgs, ... }:
let
    hostname = "nixos";
    user = "default";
in
{
    options.hostdata = {
        hostname = lib.mkOption {
            type = lib.types.str;
            default = hostname;
            description = "Networking hostname";
        };
        
        user = lib.mkOption {
            type = lib.types.str;
            default = user;
            description = "The name of the current user";
        };
    };
}
