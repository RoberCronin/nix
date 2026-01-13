{
    lib,
    config,
    ...
}:
lib.mkIf config.nixosModules.sunshine {
    services.sunshine = {
        enable = true;
        openFirewall = true;
        autoStart = false;
    };
}
