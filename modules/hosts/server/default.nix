{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.server = {
        imports = [
            self.modules.nixos.base
            self.modules.nixos.openssh
            self.modules.nixos.robert
        ];

        config = {
            host = "server";
        };
    };

    flake.nixosConfigurations.server = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.server
        ];
    };

    flake.modules.homeManager.server = {
        imports = [
            self.modules.homeManager.base
        ];

        config.host = "server";
    };

    flake.homeConfigurations.server = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};

        modules = [
            self.modules.homeManager.server
        ];
    };
}
