{
    flake.modules.nixos.disableTpm = {...}: {
        systemd.tpm2.enable = false;
        boot.initrd.systemd.tpm2.enable = false;
    };
}
