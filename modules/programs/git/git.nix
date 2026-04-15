{
    flake.modules.nixos.git = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.git];
        environment.systemPackages = with pkgs; [
            git
        ];
    };

    flake.modules.homeManager.git = {config, ...}: {
        xdg.configFile = {
            "git" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
