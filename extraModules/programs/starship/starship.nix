{
    flake.modules.nixos.starship = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            starship
        ];
    };

    flake.modules.homeManager.starship = {config, ...}: {
        xdg.configFile = {
            "starship.toml" = {
                source = config.lib.meta.mkMutableSymlink ./_starship.toml;
            };
        };
    };
}
