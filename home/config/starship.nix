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
            command_timeout = 30;
            python.format = "[python (\($virtualenv\) )]($style)";
            nix_shell.format = "[nix-shell]($style) ";
        };
    };
}
