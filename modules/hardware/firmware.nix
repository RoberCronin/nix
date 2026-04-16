{
    flake.modules.nixos.hardware.firmware = {...}: {
        hardware.enableAllFirmware = true;
        hardware.enableRedistributableFirmware = true;
    };
}
