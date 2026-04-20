{
    flake.modules.nixos.robert = {
        users.users.robert = {
            isNormalUser = true;
            name = "robert";
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
    };
}
