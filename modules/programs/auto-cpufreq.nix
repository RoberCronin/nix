{
    flake.modules.nixos.auto-cpufreq = {
        services.auto-cpufreq.enable = true;
        services.auto-cpufreq.settings = {
            battery = {
                governor = "powersave";
                turbo = "auto";
            };

            charger = {
                governor = "schedutil";
                turbo = "auto";
            };
        };
    };
}
