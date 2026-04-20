{
    flake.modules.nixos.git = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
        ];
    };

    flake.modules.homeManager.git = {config, ...}: {
        xdg.configFile = {
            "git" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
