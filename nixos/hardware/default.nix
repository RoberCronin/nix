{...}: {
    imports = [
        ./networking.nix
        ./input.nix
        ./boot.nix
        ./sound.nix
        ./bluetooth.nix
    ];

    hardware.enableAllFirmware = true;
}
