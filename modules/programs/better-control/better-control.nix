{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            better-control
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "better-control" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
