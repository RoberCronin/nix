{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    xresources = {
        properties = {
            "xterm*dynamicColors" = true;
            "xterm*background" = "black";
            "xterm*foreground" = "grey";
            "xterm*saveLines" = 35000;
            "xterm*font" = "*-fixed-*-*-*-18-*";
        };
    };
}
