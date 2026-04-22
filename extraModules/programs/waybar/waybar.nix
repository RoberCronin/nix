{
    flake.modules.nixos.waybar = {
        programs.waybar = {
            enable = true;
        };
    };

    flake.modules.homeManager.waybar = {config, ...}: {
        xdg.configFile = {
            "waybar" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
