{
    flake.modules.nixos.auto-cpufreq = {
        services.auto-cpufreq.enable = true;
        services.auto-cpufreq.settings = {
            battery = {
                governor = "performance";
                turbo = "auto";
            };

            charger = {
                governor = "performance";
                turbo = "auto";
            };
        };
    };
}
