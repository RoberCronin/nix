{
    pkgs,
    pkgs-unstable,
    ...
}: {
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
        krita
        qbittorrent
        prismlauncher
        firefox
        thunderbird
        libreoffice
        blender
        audacity
        vesktop
        bottles
        easyeffects
        simple-scan
        freecad
        anki
        better-control
        rnote
        termite
        xournalpp
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
        pkgs-unstable.luanti
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
