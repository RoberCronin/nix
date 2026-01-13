{
    lib,
    config,
    ...
}:
lib.mkIf config.nixosModules.hardware.tpm {
    systemd.tpm2.enable = false;
    boot.initrd.systemd.tpm2.enable = false;
}
