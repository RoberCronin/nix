{...}: {
    nixosModules = {
        hardware = {
            powerKey = true;
        };

        auto-cpufreq = true;
        wacom = true;
    };

    hostname = "laptop";
    host = "tablet";
    user = "robert";
    userFullName = "Robert Cronin";
}
