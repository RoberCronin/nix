{
    lib,
    config,
    ...
}:
lib.mkIf config.nixosModules.wacom {
    services.xserver.wacom.enable = true;
    # hardware.opentabletdriver.enable = true;
}
