{
    flake.modules.nixos.btop = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            btop
        ];
    };

    flake.modules.homeManager.btop = {config, ...}: {
        xdg.configFile = {
            "btop" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
