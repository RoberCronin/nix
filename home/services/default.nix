{
    config,
    lib,
    pkgs,
    ...
}: {
    imports = [
        ./dunst.nix
        ./picom.nix
        ./autorandr.nix
    ];
}
