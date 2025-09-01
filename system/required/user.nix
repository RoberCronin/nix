{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    users.users.robert = {
        isNormalUser = true;
        description = "Robert Cronin";
        extraGroups = [
            "uinput"
            "fuse"
            "docker"
            "networkmanager"
            "wheel"
            "uucp"
            "dialout"
        ];
    };
}
