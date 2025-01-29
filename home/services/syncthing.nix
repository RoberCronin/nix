{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    services.syncthing = {
        enable = true;
        tray.enable = true;
    };
}
