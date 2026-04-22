{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            btop
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "btop" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
