{
    flake.modules.nixos.direnv = {pkgs, ...}: {
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
