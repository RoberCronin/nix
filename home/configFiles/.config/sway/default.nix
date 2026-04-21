{config, ...}: {
    xdg.configFile = {
        "sway" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };

        "sway_monitors" = {
            source = config.lib.meta.mkMutableSymlink ./hostMonitors/${config.host};
        };
    };
}
