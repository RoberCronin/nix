{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };
}
