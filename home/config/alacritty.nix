{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.alacritty = {
        enable = true;
        settings = {
            general.import = ./catppuccin-macchiato.toml;
            font.size = if (hostname == "laptop") then 8 else 12;
            font.normal = {
                family = "JuliaMono";
                style = "Regular";
            };

            window = {
                opacity = if (hostname == "laptop") then 0.8 else 0.96;
                padding = { x = 3; y = 3; };
                dimensions = { columns = 140; lines = 45; };
            };
        };
    };
}
