{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.file.tmux = {
        source = ./imports/tmux;
        target = ".config";
    };
}
