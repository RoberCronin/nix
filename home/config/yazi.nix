{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.file."yazi-theme.toml" = {
        source = ./imports/yazi-theme.toml;
        target = ".config/yazi/theme.toml";
    };
    
    programs.yazi = {
        enable = true;
        enableBashIntegration = true;
        settings = {
            opener.edit = [
                {
                    run = "nvim '$@'";
                    block = true;
                }
            ];
        };
    };
}
