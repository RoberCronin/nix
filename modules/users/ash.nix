{
    flake.modules.nixos.ash = {
        users.users.ash = {
            isNormalUser = true;
            name = "ash";
            description = "Ash";
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
                "scanner"
                "lp"
            ];
        };
    };
}
