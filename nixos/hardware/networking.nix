{config, ...}: {
    networking.networkmanager.enable = true;
    networking.firewall.allowedTCPPorts = [80 443 1401 631];
    networking.hostName = config.hostname;
    networking.firewall.checkReversePath = "loose";
    networking.wireguard.enable = true;
    networking.iproute2.enable = true;
}
