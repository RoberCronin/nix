{
    flake.modules.nixos.hardware.wacom = {...}: {
        services.xserver.wacom.enable = true;
        # hardware.opentabletdriver.enable = true;
    };
}
