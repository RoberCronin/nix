{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
            thunar-archive-plugin
            thunar-volman
            thunar-media-tags-plugin
        ];
    };
    
    environment.systemPackages = with pkgs; [
        # Input 
        piper

        # Common Terminal Utils
        zip
        unzip
        rar
        unrar
        git
        gh
        fzf
        wget
        curl
        bashmount
        btop
        ripgrep
        killall
        brightnessctl
        vim
        dtrx
        tmux
        jump
        bash-completion

        # GUI applications
        gparted

        # Window Manager Utils
        xorg.xmodmap
        xfce.exo
        xfce.xfce4-whiskermenu-plugin
        feh
        rofi
        networkmanagerapplet
        xss-lock
        i3status
        i3lock
        i3blocks
        volumeicon

        # System/other
        pulseaudioFull
        papirus-icon-theme
        home-manager
        libnotify
        webp-pixbuf-loader
        poppler
        ffmpegthumbnailer
        libgsf
        dex
    ];
}
