{
    flake.modules.nixos.base = {lib, ...}: {
        options = {
            host = lib.mkOption {
                type = lib.types.str;
                default = "hostname";
                description = "Flake hostname.";
            };

            mainUser = lib.mkOption {
                type = lib.types.str;
                default = "robert";
                description = "Main user of this system.";
            };

            flakePath = lib.mkOption {
                type = lib.types.str;
                default = "/home/robert/nix";
                description = "The path of the flake configuration.";
            };
        };
    };

    flake.modules.homeManager.base = {lib, ...}: {
        options = {
            host = lib.mkOption {
                type = lib.types.str;
                default = "hostname";
                description = "Flake hostname.";
            };

            mainUser = lib.mkOption {
                type = lib.types.str;
                default = "robert";
                description = "Main user of this system.";
            };

            flakePath = lib.mkOption {
                type = lib.types.str;
                default = "/home/robert/nix";
                description = "The path of the flake configuration.";
            };
        };
    };
}
