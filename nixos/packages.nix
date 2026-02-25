{
    pkgs,
    pkgs-stable,
    ...
}: {
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
        btop
        ripgrep
        killall
        brightnessctl
        vim
        tmux
        bash-completion
        imagemagick
        ffmpeg

        # Other Terminal Utils
        exiftool
        fd
        starship
        btop
        zoxide
        yadm
        autorandr
        catfs
        fastfetch
        sshfs
        linux-wallpaperengine
        grim
        slurp
        wl-clipboard
        mpvpaper

        # GUI applications
        qutebrowser
        qbittorrent
        prismlauncher
        firefox
        thunderbird
        libreoffice
        bottles
        easyeffects
        pkgs-stable.anki
        better-control
        # install rnote as flatpak because nixpkgs version is broken
        # rnote
        termite
        mpv
        nomacs
        kdePackages.okular
        zathura
        neovide
        arduino-ide
        system-config-printer
        pavucontrol
        alacritty
        copyq
        gparted
        mousepad
        xfce4-exo
        xfce4-whiskermenu-plugin

        # Editors
        zed-editor
        vscode
        neovim
        xclip # nvim copyq integration

        # Development
        devenv
        lazygit
        direnv
        stdenv
        gnumake
        tree-sitter
        cmake

        # LSP, language server
        cmake-language-server
        lua-language-server
        basedpyright
        nil
        nixd
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
        uv # Python package manager
        texliveFull
        lua
        cargo
        rustc
        nodejs_22
        gcc

        # System/other
        glfw
        libsForQt5.qt5ct
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
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
