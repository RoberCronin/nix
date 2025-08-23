{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    imports = [
        ./hardware/networking.nix
        ./hardware/graphics.nix
        ./hardware/input.nix
        ./hardware/boot.nix
        ./hardware/sound.nix
        ./hardware/bluetooth.nix

        ./localization.nix
        ./nix_options.nix
        ./x11.nix
        ./wayland.nix
        ./user.nix
        ./user_apps.nix
        ./unpatched_binaries.nix
    ];
}
