{config, ...}: {
    xdg.configFile = {
        "direnv" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
