{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.desktop = {
        imports = with self.modules.nixos; [
            base
            nvidiaGraphics
            robert
        ];
    };

    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.modules.nixos.desktop
        ];
    };
}
