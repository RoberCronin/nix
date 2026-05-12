{
    flake.modules.nixos.base = {...}: {
        hardware.enableAllFirmware = true;
        hardware.enableRedistributableFirmware = true;
    };
}
