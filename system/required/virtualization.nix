{...}: {
    virtualisation = {
        containers.enable = true;
        # docker.enable = true;
        podman = {
            enable = true;
            dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true;
        };

        virtualbox.host = {
            enable = true;
            enableExtensionPack = true;
            enableKvm = true;
            addNetworkInterface = false;
        };
    };
}
