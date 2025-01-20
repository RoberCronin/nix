{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.rofi = {
        enable = true;
        terminal = "${pkgs.alacritty}/bin/alacritty";
        theme = ./imports/rofi-catppuccin-macchiato.rasi;
        location = "center";
        extraConfig = 
        {  
            modi = "run,drun,window";
            icon-theme = "Oranchelo";
            show-icons = true;
            drun-display-format = "{icon} {name}";
            disable-history = false;
            hide-scrollbar = true;
            display-drun = "   Apps ";
            display-run = "   Run ";
            display-window = " 﩯  Window";
            display-Network = " 󰤨  Network";
            sidebar-mode = true;
        };
    };
}
