{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.git = {
        enable = true;
        userEmail = "robert.t.cronin@outlook.com";
        userName = "Robert Cronin";
    };
}
