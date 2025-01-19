{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    networking.networkmanager.enable = true;
    networking.firewall.allowedTCPPorts = [80 443 1401];
    networking.hostName = hostname; 
    networking.firewall.checkReversePath = "loose";
    networking.wireguard.enable = true;
    networking.iproute2.enable = true;
}
