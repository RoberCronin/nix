{
    lib,
    config,
    ...
}:
lib.mkIf config.nixosModules.auto-cpufreq {
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };

        charger = {
            governor = "performance";
            turbo = "auto";
        };
    };
}
