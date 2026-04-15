{
    flake.modules.nixos.alacritty = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.alacritty];
        environment.systemPackages = with pkgs; [
            alacritty
        ];
    };

    flake.modules.homeManager.alacritty = {config, ...}: {
        xdg.configFile = {
            "alacritty" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
