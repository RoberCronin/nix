{config, ...}: {
    xdg.configFile = {
        "dunst" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
