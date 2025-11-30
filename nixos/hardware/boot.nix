{pkgs, ...}: {
    boot.kernelPackages = pkgs.linuxPackages_zen;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
