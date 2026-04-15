{
    flake.modules.nixos.dunst = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.dunst];
        environment.systemPackages = with pkgs; [
            dunst
        ];
    };

    flake.modules.homeManager.dunst = {config, ...}: {
        xdg.configFile = {
            "dunst" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
