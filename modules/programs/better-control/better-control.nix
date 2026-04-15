{
    flake.modules.nixos.better-control = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.better-control];
        environment.systemPackages = with pkgs; [
            better-control
        ];
    };

    flake.modules.homeManager.better-control = {config, ...}: {
        xdg.configFile = {
            "better-control" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
