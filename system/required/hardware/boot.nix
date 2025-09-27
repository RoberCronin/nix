{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    services.logind = lib.mkIf (hostname == "laptop") {
        settings.Login = {
            HandlePowerKey = "suspend";
            IdleActionSec = 1800;
            HandleLidSwitch = "suspend";
        };
    };
}
