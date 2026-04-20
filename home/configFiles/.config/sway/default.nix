{config, ...}: {
    xdg.configFile = {
        "sway" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
