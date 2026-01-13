{...}: {
    nixosModules = {
        hardware = {
            tpm = true;
            powerKey = true;
        };

        wacom = true;
    };

    hostname = "tablet";
    host = "tablet";
    user = "robert";
    userFullName = "Robert Cronin";
}
