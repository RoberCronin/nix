{
    flake.modules.nixos.nvim = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.nvim];
        environment.systemPackages = with pkgs; [
            neovim
        ];
    };

    flake.modules.homeManager.nvim = {config, ...}: {
        xdg.configFile = {
            "nvim" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
