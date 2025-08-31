{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
    polybar_pulse = pkgs.polybarFull.override {pulseSupport = true;};
in {
    programs.thunar = {
        enable = true;
        plugins = with pkgs; [
            file-roller
            xarchiver
            xfce.thunar-archive-plugin
            xfce.thunar-volman
            xfce.thunar-media-tags-plugin
        ];
    };

    programs.steam = {
        enable = true;
    };

    environment.systemPackages = with pkgs; [
        # Input
        piper
        xf86_input_wacom
        libwacom
        kdePackages.wacomtablet

        # Common Terminal Utils
        powertop
        rclone
        bashInteractive
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
        polybar_pulse
        wofi
        waybar
        playerctl
        nwg-look
        hyprpaper

        # System/other
        evolution-data-server
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
