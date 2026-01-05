{
    pkgs,
    pkgs-stable,
    ...
}: {
    programs.gamemode = {
        enable = true;
        settings = {
            custom = {
                start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
                end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
            };
        };
    };

    programs.thunar = {
        enable = true;
        plugins = with pkgs; [
            file-roller
            xarchiver
            thunar-archive-plugin
            thunar-volman
            thunar-media-tags-plugin
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
        jq
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
        exiftool
        mprime
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
        obs-studio
        bitwarden-desktop
        krita
        qbittorrent
        prismlauncher
        firefox
        thunderbird
        libreoffice
        blender
        audacity
        bottles
        easyeffects
        pkgs-stable.freecad
        anki
        better-control
        # install rnote as flatpak because nixpkgs version is broken
        # rnote
        termite
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
        mousepad
        xfce4-exo
        xfce4-whiskermenu-plugin

        # Window Manager Utils
        dunst
        xorg.xmodmap
        rofi
        networkmanagerapplet
        wofi
        waybar
        playerctl
        nwg-look
        hyprpaper
        swww
        nwg-drawer

        # Gaming
        gamescope
        luanti
        heroic
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
        nil
        glsl_analyzer
        tinymist # typst lsp
        harper

        # Code Styling/formatters
        typstyle # typst
        alejandra # nix
        jsonfmt # json
        clang-tools # c/c++
        isort # python import sorter
        black # python
        stylua #lua
        nodePackages_latest.prettier # javascript, css, html

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
        libsForQt5.qt5ct
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
        hplip
        hplipWithPlugin
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
