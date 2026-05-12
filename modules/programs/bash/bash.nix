{self, ...}: {
    flake.modules.nixos.base = {pkgs, ...}: {
        imports = with self.modules.nixos; [starship];
        environment.systemPackages = with pkgs; [
            zoxide
            starship
            bash-completion
            bashInteractive
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        imports = with self.modules.homeManager; [starship];
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
