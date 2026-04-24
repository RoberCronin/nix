{
    flake.modules.nixos.wacom = {...}: {
        services.xserver.wacom.enable = true;
        # hardware.opentabletdriver.enable = true;
    };
}
