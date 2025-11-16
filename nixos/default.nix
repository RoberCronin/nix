{...}: {
    imports = [
        ./hardware

        ./localization.nix
        ./nix_options.nix
        ./wayland.nix
        ./user.nix
        ./user_apps.nix
        ./unpatched_binaries.nix
        ./display_manager.nix
        ./fonts.nix
        ./options.nix
        ./packages.nix
        ./virtualization.nix
        ./stylix.nix
    ];
}
