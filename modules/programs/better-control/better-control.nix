{
    flake.modules.nixos.betterControl = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            better-control
        ];
    };

    flake.modules.homeManager.betterControl = {config, ...}: {
        xdg.configFile = {
            "better-control" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
