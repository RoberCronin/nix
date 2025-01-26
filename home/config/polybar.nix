{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    services.polybar = {
        enable = true;
        config = ./imports/polybar.ini;
        script = "";
        package = pkgs.polybarFull.override {
            pulseSupport = true;
        };
    };
}
