{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.packages = with pkgs; [
    
    ];
}
