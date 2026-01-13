{...}: {
    # imports = [
    #     ../modules/nixos/hardware/nvidia.nix
    # ];
    nixosModules = {
        hardware = {
            nvidia = true;
        };
    };

    hostname = "big_laptop";
    host = "tablet";
    user = "robert";
    userFullName = "Robert Cronin";
}
