{
    flake.modules.nixos.base = {
        services.displayManager.gdm = {
            enable = true;
        };
    };
}
