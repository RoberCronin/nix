{
    config,
    lib,
    pkgs,
    ...
}: {
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
        drivers = [pkgs.cnijfilter2 pkgs.gutenprint];
    };
    services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
    };
    services.auto-cpufreq.enable = config.auto-cpufreq.enable;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };

        charger = {
            governor = "performance";
            turbo = "auto";
        };
    };

    services.sunshine = lib.mkIf config.sunshine.enable {
        enable = true;
        openFirewall = true;
    };

    services.pcscd.enable = true;
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-curses;
    };

    # Fingerprint sensor on laptop
    #services.fprintd.enable = lib.mkIf (hostname == "laptop") true;
    services.xserver.wacom.enable = config.wacom;

    # Thumbnail support for images
    services.tumbler.enable = true;
    services.resolved.enable = true;

    # Mount, trash, and other functionalities
    services.gvfs.enable = true;
    security.pam.mount.fuseMountOptions = ["user_allow_other"];
    programs.fuse.userAllowOther = true;
}
