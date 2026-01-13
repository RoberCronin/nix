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

        nixosModules = {
            hardware = {
                tpm = lib.mkEnableOption "tpm disable module.";
                powerKey = lib.mkEnableOption "power key module.";
                nvidia = lib.mkEnableOption "nvidia module.";
            };

            auto-cpufreq = lib.mkEnableOption "auto-cpufreq module.";
            sunshine = lib.mkEnableOption "sunshine module.";
            virtualbox = lib.mkEnableOption "virtualbox module.";
            wacom = lib.mkEnableOption "wacom module.";
            x11 = lib.mkEnableOption "x11 module.";
        };
    };
}
