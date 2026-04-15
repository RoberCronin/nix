{
    flake.modules.nixos.bash = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.bash];
        environment.systemPackages = with pkgs; [
            zoxide
            starship
            bash-completion
            bashInteractive
        ];
    };

    flake.modules.homeManager.bash = {config, ...}: {
        home.file = {
            ".bashrc" = {
                source = config.lib.meta.mkMutableSymlink ./_bashrc;
            };

            ".bash_profile" = {
                source = config.lib.meta.mkMutableSymlink ./_bash_profile;
            };
        };
    };
}
