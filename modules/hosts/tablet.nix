{inputs, ...}: {
    flake.modules.nixos.tablet = {
        imports = with inputs.self.modules.nixos; [
            wayland
            virtualization
            options
            localization
            fonts
            displayManager
            robert
            functions
            nixOptions
            unpatchedBinaries

            hardware.audio
            hardware.bluetooth
            hardware.boot
            hardware.disableTpm
            hardware.firmware
            hardware.input
            hardware.intelGraphics
            hardware.networking
            hardware.powerKey
            hardware.wacom
            hardware.tablet
        ];
    };
}
