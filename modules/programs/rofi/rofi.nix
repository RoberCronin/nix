{
    flake.modules.nixos.rofi = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            rofi
        ];
    };

    flake.modules.homeManager.rofi = {config, ...}: {
        xdg.configFile = {
            "rofi" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
