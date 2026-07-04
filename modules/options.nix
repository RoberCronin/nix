{
    flake.modules.nixos.base = {pkgs, ...}: {
        security.polkit.enable = true;
        programs.gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
            pinentryPackage = pkgs.pinentry-curses;
        };

        security.pam.mount.fuseMountOptions = ["user_allow_other"];
        programs.fuse.userAllowOther = true;
    };
}
