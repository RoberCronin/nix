{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.polybar = {
        enable = true;
        config = ./imports/polybar.ini;
    };
}
