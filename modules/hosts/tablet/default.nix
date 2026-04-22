{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.tablet = {
        imports = with self.modules.nixos; [
            base
            intelGraphics
            hyprland
            robert
        ];

        config.host = "tablet";
    };

    flake.nixosConfigurations.tablet = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.tablet
        ];
    };
}
