{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    hardware.steam-hardware.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdg.portal.config.common.default = "*";
    services.flatpak.enable = true;
}
