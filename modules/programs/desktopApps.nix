{...}: let
in {
    flake.modules.nixos.desktopApps = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            bitwarden-desktop
            thunderbird
            qbittorrent
            libreoffice
            easyeffects
            anki
            mpv
            nomacs
            evince
            system-config-printer
            pavucontrol
            gparted
            mousepad

            glfw
            evolution-data-server
            libnotify
            webp-pixbuf-loader
            poppler
            ffmpegthumbnailer
            libgsf
            dex
        ];
    };
}
