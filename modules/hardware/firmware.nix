{
    flake.modules.nixos.firmware = {...}: {
        hardware.enableAllFirmware = true;
        hardware.enableRedistributableFirmware = true;
    };
}
