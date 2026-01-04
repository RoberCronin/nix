{config, ...}: {
    xdg.configFile = {
        "alacritty" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
