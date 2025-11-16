{pkgs, ...}: {
    services.autorandr.enable = true;
    programs.dconf.enable = true;
    services.blueman.enable = true;
    services.envfs.enable = true;
    programs.kdeconnect.enable = true;
    programs.xfconf.enable = true;
    security.polkit.enable = true;
    security.soteria.enable = true; # Polkit agent
    services.printing = {
        enable = true;
        listenAddresses = ["*:631"];
        allowFrom = ["all"];
        browsing = true;
        defaultShared = true;
        openFirewall = true;
        drivers = with pkgs; [
            cnijfilter2
            gutenprint
            gutenprintBin
            hplip
            hplipWithPlugin
        ];
    };

    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
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

    # Thumbnail support for images
    services.tumbler.enable = true;
    services.resolved.enable = true;

    # Mount, trash, and other functionalities
    services.gvfs.enable = true;
    security.pam.mount.fuseMountOptions = ["user_allow_other"];
    programs.fuse.userAllowOther = true;
}
