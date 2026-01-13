{config, ...}: {
    xdg.configFile = {
        "btop" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
