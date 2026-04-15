{
    flake.modules.nixos.rofi = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.rofi];
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
