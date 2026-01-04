{config, ...}: {
    xdg.configFile = {
        "Code/User/keybindings.json" = {
            source = config.lib.meta.mkMutableSymlink ./User/keybindings.json;
        };
        "Code/User/settings.json" = {
            source = config.lib.meta.mkMutableSymlink ./User/settings.json;
        };
    };
}
