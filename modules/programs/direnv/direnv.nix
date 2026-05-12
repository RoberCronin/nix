{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            direnv
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "direnv" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
