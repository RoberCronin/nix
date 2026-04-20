{
    flake.modules.nixos.dunst = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            dunst
        ];
    };

    flake.modules.homeManager.dunst = {config, ...}: {
        xdg.configFile = {
            "dunst" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
