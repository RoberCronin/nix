{config, ...}: {
    xdg.configFile = {
        "git" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
