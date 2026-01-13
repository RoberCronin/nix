{
    lib,
    config,
    ...
}:
lib.mkIf config.nixosModules.virtalbox {
    virtualisation.virtualbox.host = {
        enable = true;
        enableExtensionPack = true;
        enableKvm = true;
        addNetworkInterface = false;
    };
}
