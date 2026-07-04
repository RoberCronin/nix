{inputs, ...}: let
    pkgs-stable = import inputs.nixpkgs-stable {
        system = "x86_64-linux";
        config.allowUnfree = true;
    };
in {
    flake.modules.nixos.desktopApps = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            bitwarden-desktop
            thunderbird
            pkgs-stable.qbittorrent
            pkgs-stable.libreoffice
            pkgs-stable.easyeffects
            pkgs-stable.anki
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
