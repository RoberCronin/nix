{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.file.fcitx = {
        source = ./imports/fcitx-catppuccin-macchiato;
        target = ".local/share/fcitx5/themes/catppuccin-macchiato";
        recursive = true;
    };
}
