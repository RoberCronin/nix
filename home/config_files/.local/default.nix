{...}: {
    home.file = {
        ".local/share/fcitx5" = {
            source = ./share/fcitx5;
            recursive = true;
        };
    };
}
