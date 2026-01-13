{...}: {
    nixosModules = {
        hardware = {
            nvidia = true;
        };
    };

    hostname = "bigLaptop";
    host = "tablet";
    user = "robert";
    userFullName = "Robert Cronin";
}
