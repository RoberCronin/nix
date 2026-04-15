{
    flake.modules.nixos.direnv = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.direnv];
        environment.systemPackages = with pkgs; [
            direnv
        ];
    };

    flake.modules.homeManager.direnv = {config, ...}: {
        xdg.configFile = {
            "direnv" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
