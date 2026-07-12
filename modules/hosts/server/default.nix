{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.server = {
        imports = [
            self.modules.nixos.base
            self.modules.nixos.openssh

            # users
            self.modules.nixos.robert
            self.modules.nixos.ash
        ];

        config = {
            host = "server";

            networking.firewall.allowedTCPPorts = [8096 8191 8989 7878 9696 6767 8080 2283 9898 445 7000];
            # networking.firewall.allowedUDPPorts = [];
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
