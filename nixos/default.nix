{...}: {
    imports = [
        ./hardware

        ./localization.nix
        ./nixOptions.nix
        ./wayland.nix
        ./user.nix
        ./userApps.nix
        ./unpatchedBinaries.nix
        ./displayManager.nix
        ./fonts.nix
        ./options.nix
        ./packages.nix
        ./virtualization.nix
    ];
}
