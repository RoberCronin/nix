{
    flake.modules.nixos.desktopOptions = {pkgs, ...}: {
        programs.xfconf.enable = true;
        security.soteria.enable = true;

        services.mullvad-vpn = {
            enable = true;
            package = pkgs.mullvad-vpn;
        };

        services.pcscd.enable = true;
        services.gvfs.enable = true;
    };
}
