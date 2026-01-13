{...}: {
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
