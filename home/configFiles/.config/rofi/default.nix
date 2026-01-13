{config, ...}: {
    xdg.configFile = {
        "rofi" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
