{
    flake.modules.nixos.starship = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.starship];
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
