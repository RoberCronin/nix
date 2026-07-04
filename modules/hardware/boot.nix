{inputs, ...}: {
    flake.modules.nixos.base = {pkgs, ...}: {
        boot.kernelPackages = pkgs.linuxPackages_6_6;

        # Bootloader.
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
    };
}
