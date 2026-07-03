{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.server = {
        imports = with self.modules.nixos; [
            base
            nvidiaGraphics
            openssh

            hyprland
            robert
        ];

        config = {
            host = "server";
            # networking.firewall.allowedTCPPorts = [8096];
            # networking.firewall.allowedUDPPorts = [7359];
        };
    };

    flake.nixosConfigurations.server = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.server
        ];
    };

    flake.modules.homeManager.server = {
        imports = with self.modules.homeManager; [
            base
            hyprland
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
