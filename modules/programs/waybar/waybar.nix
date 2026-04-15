{
    flake.modules.nixos.waybar = {inputs, ...}: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.waybar];
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
