{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            rofi
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "rofi" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
