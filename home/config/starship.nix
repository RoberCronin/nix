{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
            add_newline = false;
            line_break.disabled = true;
            package.disabled = true;
        };
    };
}
