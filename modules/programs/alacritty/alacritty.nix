{
    flake.modules.nixos.alacritty = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            alacritty
        ];
    };

    flake.modules.homeManager.alacritty = {config, ...}: {
        xdg.configFile = {
            "alacritty" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
