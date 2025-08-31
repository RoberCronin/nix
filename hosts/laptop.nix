{
    config,
    lib,
    pkgs,
    ...
}: let
    hostname = "laptop";
    user = "robert";
in {
    options.hostdata = {
        hostname = lib.mkOption {
            type = lib.types.str;
            default = hostname;
            description = "Networking hostname";
        };

        user = lib.mkOption {
            type = lib.types.str;
            default = user;
            description = "The name of the current user";
        };
    };
}
