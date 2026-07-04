{
    flake.modules.nixos.openssh = {
        services.openssh = {
            enable = true;
            extraConfig = "HostKeyAlgorithms +ssh-rsa";
        };
    };
}
