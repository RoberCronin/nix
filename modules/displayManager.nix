{
    flake.modules.nixos.displayManager = {
        services.displayManager.gdm = {
            enable = true;
        };
    };
}
