{config, ...}: {
    xdg.configFile = {
        "nvim" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
