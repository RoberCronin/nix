{
    flake.modules.nixos.base = {
        pkgs,
        config,
        ...
    }: {
        programs.dconf.enable = true;
        programs.xfconf.enable = true;
        security.polkit.enable = true;
        security.soteria.enable = true; # Polkit agent

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
        programs.gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
            pinentryPackage = pkgs.pinentry-curses;
        };

        # Mount, trash, and other functionalities
        services.gvfs.enable = true;
        security.pam.mount.fuseMountOptions = ["user_allow_other"];
        programs.fuse.userAllowOther = true;
    };
}
