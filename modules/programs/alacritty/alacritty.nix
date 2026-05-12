{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            alacritty
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "alacritty" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
