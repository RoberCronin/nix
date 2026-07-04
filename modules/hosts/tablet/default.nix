{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.tablet = {
        imports = [
            self.modules.nixos.base
            self.modules.nixos.desktopBase
            self.modules.nixos.intelGraphics
            self.modules.nixos.wacom
            self.modules.nixos.auto-cpufreq

            self.modules.nixos.sway
            self.modules.nixos.robert
            self.modules.nixos.dev
        ];

        config.host = "tablet";
        config.mainUser = "robert";
    };

    flake.nixosConfigurations.tablet = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.tablet
        ];
    };

    flake.modules.homeManager.tablet = {
        imports = [
            self.modules.homeManager.base
            self.modules.homeManager.desktopBase
            self.modules.homeManager.sway
        ];

        config.host = "tablet";
        config.mainUser = "robert";
    };

    flake.homeConfigurations.tablet = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};

        modules = [
            self.modules.homeManager.tablet
        ];
    };
}
