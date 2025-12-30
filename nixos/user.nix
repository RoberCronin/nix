{...}: {
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
            "vboxusers"
            "audio"
        ];
    };
}
