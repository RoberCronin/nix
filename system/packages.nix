{
    inputs,
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
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
        imagemagick
        ffmpeg

        # Other Terminal Utils
        fd
        starship
        btop
        zoxide
        yadm
        #ueberzugpp
        autorandr
        catfs
        yazi
        bat
        ns-usbloader
        fastfetch
        sshfs
        linux-wallpaperengine
        grim
        slurp
        wl-clipboard
        mpvpaper

        # GUI applications
        mpv
        nomacs
        flameshot
        kdePackages.okular
        zathura
        neovide
        onedrivegui
        arduino-ide
        system-config-printer
        pavucontrol
        alacritty
        arandr
        nitrogen
        jstest-gtk
        copyq
        gparted
        xfce.mousepad
        xfce.exo
        xfce.xfce4-whiskermenu-plugin

        # Window Manager Utils
        xorg.xmodmap
        rofi
        networkmanagerapplet
        wofi
        waybar
        playerctl
        nwg-look
        hyprpaper
        swww

        # Gaming
        r2modman
        winePackages.unstableFull
        protontricks
        glfw

        # Development
        neovim
        lazygit
        lazydocker
        vscode
        xclip # nvim copyq integration
        direnv
        distrobox
        direnv
        stdenv
        gnumake
        tree-sitter
        cmake
        cmake-language-server
        lua-language-server
        basedpyright

        # Code Styling
        clang-tools
        isort
        black
        stylua
        nodePackages_latest.prettier

        # Compiling/Languages
        typst
        clang-tools
        python3
        uv
        texliveFull
        lua
        hugo
        cargo
        rustc
        nodejs_22
        gcc

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
        (pkgs.catppuccin-sddm.override {flavor = "macchiato";})

        # Fabric widgets
        inputs.fabric-widgets.packages.${pkgs.stdenv.system}.run-widget
    ];
}
