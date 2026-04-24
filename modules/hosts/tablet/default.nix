{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.tablet = {
        imports = with self.modules.nixos; [
            base
            intelGraphics
            sway
            robert
        ];

        config.host = "tablet";
    };

    flake.nixosConfigurations.tablet = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.tablet
        ];
    };

    flake.modules.homeManager.tablet = {
        imports = with self.modules.homeManager; [
            base
            sway
        ];

        config.host = "tablet";
    };

    flake.homeConfigurations.tablet = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};

        modules = [
            self.modules.homeManager.tablet
        ];
    };
}
