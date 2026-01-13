{
    pkgs,
    lib,
    config,
    ...
}: let
    polybar_pulse = pkgs.polybarFull.override {pulseSupport = true;};
in
    lib.mkIf config.nixosModules.x11 {
        services.xserver.enable = true;
        services.xserver.desktopManager.xterm.enable = false;
        services.xserver.windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                i3status
                i3lock
                i3blocks
                polybar_pulse
                volumeicon
                xss-lock
                feh
            ];
        };

        services.xserver.desktopManager.xfce.enable = true;
    }
