{
    flake.modules.nixos.btop = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.btop];
        environment.systemPackages = with pkgs; [
            btop
        ];
    };

    flake.modules.homeManager.btop = {config, ...}: {
        xdg.configFile = {
            "btop" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
