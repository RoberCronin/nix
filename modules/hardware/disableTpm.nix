{
    flake.modules.nixos.hardware.disableTpm = {...}: {
        systemd.tpm2.enable = false;
        boot.initrd.systemd.tpm2.enable = false;
    };
}
