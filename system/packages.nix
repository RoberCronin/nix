{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    nixpkgs.config.packageOverrides = pkgs: {
        catppuccin-gtk = pkgs.catppuccin-gtk.override {
            accents = [ "mauve" ]; # You can specify multiple accents here to outpu>
            size = "compact";
            tweaks = [ "normal" ]; # You can also specify multiple tweaks here
            variant = "macchiato";
        };
    };
    
    environment.systemPackages = with pkgs; [
        # languages
        python3Full
        texliveTeTeX
        lua
        hugo
        cargo
        rustc
        nodejs_22
        gcc

        # Dev utils
        vscode
        xclip # nvim copyq integration 
        direnv
        gh
        distrobox
        direnv
        git
        stdenv
        gnumake
        tree-sitter

        # Terminal utils
        makima
        unrar
        catfs
        xdragon
        yazi
        bat
        ns-usbloader
        chezmoi
        winePackages.unstableFull
        protontricks
        zoxide
        feh
        fzf
        wget
        bashmount
        fastfetch
        btop
        ripgrep
        killall
        brightnessctl
        vim
        dtrx
        unzip
        zip
        tmux
        jump
        starship
        bash-completion
        xorg.xmodmap
        lazygit
        lazydocker
        sshfs

        # Fun utils
        pipes
        lolcat 
        sl 
        cmatrix
        pipes-rs
        cowsay
        asciiquarium
        ttyper

        # GUI applications
        onedrivegui
        xmacro
        arduino-ide
        system-config-printer
        pavucontrol
        r2modman
        #gpick
        alacritty
        arandr
        xfce.mousepad
        xfce.xfce4-whiskermenu-plugin
        nitrogen
        lxappearance
        jstest-gtk
        copyq
        gparted
        xfce.thunar
        xfce.exo
        xfce.thunar-volman
        xfce.thunar-archive-plugin
        xfce.thunar-media-tags-plugin

        # Window Manager Utils
        dunst
        picom
        rofi
        trayer
        networkmanagerapplet
        xss-lock
        i3status
        i3lock
        i3blocks
        volumeicon

        plank
        #obconf
        openbox-menu
        lxqt.obconf-qt
        tint2

        # System/other
        pulseaudioFull
        polybarFull
        catppuccin-gtk
        papirus-icon-theme
        home-manager
        #podman
        #docker
        libnotify
        webp-pixbuf-loader
        xfce.exo
        poppler
        ffmpegthumbnailer
        libgsf
        dex
    ];
}
