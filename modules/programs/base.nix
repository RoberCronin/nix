{
    self,
    inputs,
    ...
}: let
    pkgs-stable = import inputs.nixpkgs-stable {
        system = "x86_64-linux";
        config.allowUnfree = true;
    };
in {
    flake.modules.nixos.base = {pkgs, ...}: {
        imports = with self.modules.nixos; [
            nvim
            starship
            alacritty
            bash
            better-control
            browser
            btop
            direnv
            dunst
            fcitx5
            git
            rofi
            starship
            vscode
            wofi
        ];

        programs = {
            kdeconnect.enable = true;
            thunar = {
                enable = true;
                plugins = with pkgs; [
                    file-roller
                    xarchiver
                    thunar-archive-plugin
                    thunar-volman
                    thunar-media-tags-plugin
                    xfce4-exo
                ];
            };
        };

        environment.systemPackages = with pkgs; [
            # Common Terminal Utils
            jq
            powertop
            rclone
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
            imagemagick
            ffmpeg

            # Other Terminal Utils
            exiftool
            fd
            btop
            yadm
            fastfetch

            # GUI applications
            thunderbird
            pkgs-stable.qbittorrent
            pkgs-stable.libreoffice
            pkgs-stable.easyeffects
            pkgs-stable.anki
            pkgs-stable.better-control
            # install rnote as flatpak because nixpkgs version is broken
            # rnote
            termite
            mpv
            nomacs
            evince
            system-config-printer
            pavucontrol
            alacritty
            gparted
            mousepad

            # Editors
            arduino-ide
            zed-editor

            # Development
            lazydocker
            devenv
            lazygit
            direnv
            stdenv
            gnumake
            tree-sitter
            cmake

            # LSP, language server
            cmake-language-server # c/c++ lsp
            lua-language-server
            basedpyright # python lsp
            nixd
            glsl_analyzer
            tinymist # typst lsp
            harper # grammar and spelling

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
            libnotify
            webp-pixbuf-loader
            poppler
            ffmpegthumbnailer
            libgsf
            dex
        ];
    };
}
