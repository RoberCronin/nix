{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.desktop = {
        imports = with self.modules.nixos; [
            base
            nvidiaGraphics
            hyprland
            robert
        ];

        config.host = "desktop";
    };

    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.desktop
        ];
    };

    flake.modules.homeManager.desktop = {
        imports = with self.modules.homeManager; [
            base
            hyprland
            alacritty
            bash
            better-control
            browser
            btop
            direnv
            fcitx5
            git
            nvim
            rofi
            starship
            vscode
            waybar
            wofi
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
