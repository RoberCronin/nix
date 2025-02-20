{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    services.syncthing = {
        enable = false;
        tray.enable = true;
    };
}
