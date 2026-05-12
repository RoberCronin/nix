{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            wofi
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "wofi" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
