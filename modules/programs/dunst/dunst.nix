{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            dunst
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "dunst" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
