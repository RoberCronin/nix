{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    imports = 
    if (hostname == "laptop") then [ ./laptop-hardware.nix ] else
    [];
}
