{
    flake.modules.nixos.virtualbox = {...}: {
        virtualisation.virtualbox.host = {
            enable = true;
            enableExtensionPack = true;
            enableKvm = true;
            addNetworkInterface = false;
        };
    };
}
