{config, ...}: {
    xdg.configFile = {
        "wofi" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
