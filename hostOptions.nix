{lib, ...}: {
    options = {
        hostname = lib.mkOption {
            type = lib.types.str;
            default = "hostname";
            description = "Networking hostname";
        };

        host = lib.mkOption {
            type = lib.types.str;
            default = "default";
            description = "Flake host";
        };

        user = lib.mkOption {
            type = lib.types.str;
            default = "user";
            description = "Username";
        };

        userFullName = lib.mkOption {
            type = lib.types.str;
            default = "User Name";
            description = "Username";
        };

        flakePath = lib.mkOption {
            type = lib.types.str;
            default = "/home/robert/nix";
            description = "The path of the flake configuration.";
        };

        displayManagerScale = lib.mkOption {
            type = lib.types.int;
            default = 1;
            description = "The display scale for the display manager";
        };

        enableDesktopApps = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Wheather to enable desktop using home-manager.";
        };
    };
}
