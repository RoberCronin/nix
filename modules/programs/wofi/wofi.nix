{
    flake.modules.nixos.wofi = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.wofi];
        environment.systemPackages = with pkgs; [
            wofi
        ];
    };

    flake.modules.homeManager.wofi = {config, ...}: {
        xdg.configFile = {
            "wofi" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
