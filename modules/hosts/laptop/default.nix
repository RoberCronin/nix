{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.laptop = {
        imports = with self.modules.nixos; [
            base
            desktopBase
            auto-cpufreq
            gaming

            hyprland
            robert
        ];

        config.host = "laptop";
        config.mainUser = "robert";
    };

    flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.laptop
        ];
    };

    flake.modules.homeManager.laptop = {
        imports = with self.modules.homeManager; [
            base
            desktopBase
            hyprland
        ];

        config.host = "laptop";
        config.mainUser = "robert";
    };

    flake.homeConfigurations.laptop = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};

        modules = [
            self.modules.homeManager.laptop
        ];
    };
}
