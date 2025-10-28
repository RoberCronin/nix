{
    config,
    lib,
    pkgs,
    ...
}: let
    hostname = config.hostname;
in {
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # TPM
    systemd.tpm2.enable = config.tpm.enable;
    boot.initrd.systemd.tpm2.enable = config.tpm.enable;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    services.logind = lib.mkIf (hostname == "laptop" || hostname == "tablet") {
        settings.Login = {
            HandlePowerKey = "suspend";
            IdleActionSec = 1800;
            HandleLidSwitch = "suspend";
        };
    };
}
