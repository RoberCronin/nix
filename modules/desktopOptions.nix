{
    flake.modules.nixos.desktopOptions = {
        pkgs,
        config,
        ...
    }: {
        programs.xfconf.enable = true;
        security.soteria.enable = true;

        services.syncthing = {
            enable = true;
            user = config.mainUser;
            dataDir = "/home/${config.mainUser}";
            configDir = "/home/${config.mainUser}/.config/syncthing";
        };

        services.mullvad-vpn = {
            enable = true;
            package = pkgs.mullvad-vpn;
        };

        services.pcscd.enable = true;
        services.gvfs.enable = true;
    };
}
