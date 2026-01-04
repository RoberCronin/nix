{config, ...}: {
    xdg.configFile = {
        "waybar" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };
    };
}
