{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.file.i3-config = {
        source = ./imports/i3-config;
        target = ".config/i3/config";
    };
}
