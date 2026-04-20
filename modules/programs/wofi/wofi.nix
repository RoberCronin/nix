{
    flake.modules.nixos.wofi = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            wofi
        ];
    };

    flake.modules.homeManager.wofi = {config, ...}: {
        xdg.configFile = {
            "wofi" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
