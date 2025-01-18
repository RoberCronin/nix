{ config, lib, pkgs, ... }:
let
    hostname = "laptop";
in
{
    options.hostdata = {
        hostname = lib.mkOption {
            type = lib.types.str;
            default = hostname;
            description = "Networking hostname";
        };
    };
}
