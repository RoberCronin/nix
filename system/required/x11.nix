{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.windowManager.i3.enable = true;
    services.xserver.desktopManager.xfce.enable = lib.mkIf (hostname == "desktop") true;
}
