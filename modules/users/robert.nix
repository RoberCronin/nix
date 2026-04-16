{
    flake.modules.nixos.robert = {config, ...}: {
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

        environment.sessionVariables = {
            NH_FLAKE = config.flakePath;
        };
    };
}
