{...}: {
    # imports = [
    #     ../modules/nixos/hardware/nvidia.nix
    #     ../modules/nixos/sunshine.nix
    # ];
    nixosModules = {
        hardware = {
            nvidia = true;
        };

        sunshine = true;
    };

    hostname = "desktop";
    host = "tablet";
    user = "robert";
    userFullName = "Robert Cronin";
}
