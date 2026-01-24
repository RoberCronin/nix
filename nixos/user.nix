{config, ...}: {
    users.users.${config.user} = {
        isNormalUser = true;
        name = config.user;
        description = config.userFullName;
        extraGroups = [
            "uinput"
            "fuse"
            "docker"
            "networkmanager"
            "wheel"
            "uucp"
            "dialout"
            "vboxusers"
            "audio"
        ];
    };

    environment.sessionVariables = {
        NH_FLAKE = config.flakePath;
    };
}
