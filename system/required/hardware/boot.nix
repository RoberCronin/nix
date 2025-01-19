{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    services.logind = lib.mkIf (hostname == "laptop") {
       extraConfig = "HandlePowerKey=suspend\nIdleActionSec=1800";
       lidSwitch = "suspend";
    }; 
}
