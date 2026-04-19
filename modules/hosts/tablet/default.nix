{inputs, ...}: {
    flake.nixosConfigurations.tablet = inputs.nixpkgs.lib.nixosSystem {
        modules = with inputs.self.modules.nixos; [
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

            auto-cpufreq
            packages
            alacritty
            bash
            better-control
            browser
            btop
            direnv
            dunst
            fcitx5
            git
            hyprland
            nvim
            rofi
            starship
            vscode
            waybar
            wofi
        ];
    };
}
