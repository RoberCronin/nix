{
    flake.modules.nixos.hardware.firmware = {...}: {
        systemd.tpm2.enable = false;
        boot.initrd.systemd.tpm2.enable = false;
    };
}
