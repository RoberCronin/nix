{config, ...}: {
    home.file = {
        ".local/share/fcitx5" = {
            source = config.lib.meta.mkMutableSymlink ./share/fcitx5;
            recursive = true;
        };
    };
}
