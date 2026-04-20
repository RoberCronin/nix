{
    flake.modules.nixos.better-control = {pkgs, ...}: {
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
