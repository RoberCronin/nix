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
        ./required
        ./options.nix
        ./virtualization.nix
        ./packages.nix
        ./fonts.nix
    ];
}
