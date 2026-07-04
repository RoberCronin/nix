{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.desktop = {
        imports = [
            self.modules.nixos.base
            self.modules.nixos.desktopBase
            self.modules.nixos.nvidiaGraphics
            self.modules.nixos.gui
            self.modules.nixos.gaming
            self.modules.nixos.openssh

            self.modules.nixos.sway
            self.modules.nixos.hyprland
            self.modules.nixos.robert
            self.modules.nixos.dev
        ];

        config = {
            host = "desktop";

            networking.firewall.allowedTCPPorts = [8096];
            networking.firewall.allowedUDPPorts = [7359];
        };
    };

    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.desktop
        ];
    };

    flake.modules.homeManager.desktop = {
        imports = [
            self.modules.homeManager.base
            self.modules.homeManager.desktopBase
            self.modules.homeManager.sway
            self.modules.homeManager.hyprland
        ];

        config.host = "desktop";
    };

    flake.homeConfigurations.desktop = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};

        modules = [
            self.modules.homeManager.desktop
        ];
    };
}
