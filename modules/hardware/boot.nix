{inputs, ...}: {
    flake.modules.nixos.base = {pkgs, ...}: {
        nixpkgs.overlays = [
            inputs.nix-cachyos-kernel.overlays.pinned
        ];
        # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
        boot.kernelPackages = pkgs.linuxPackages_6_6;

        # Bootloader.
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
    };
}
