{
    flake.modules.nixos.networking = {config, ...}: {
        networking.networkmanager.enable = true;
        networking.firewall.allowedTCPPorts = [80 443 1401 631];
        networking.hostName = config.host;
        networking.firewall.checkReversePath = "loose";
        networking.wireguard.enable = true;
        networking.iproute2.enable = true;
    };
}
