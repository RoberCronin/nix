{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    home.file.background = {
        source = ./evening-sky.png;
        target = "Pictures/wallpapers/evening-sky.png";
    };
}
