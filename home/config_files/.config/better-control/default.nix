{config, ...}: {
    xdg.configFile = {
        "better-control" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
