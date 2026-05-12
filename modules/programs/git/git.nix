{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "git" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
