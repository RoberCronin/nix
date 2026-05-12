{
    flake.modules.nixos.base = {
        config,
        pkgs,
        ...
    }: {
        networking.firewall.allowedTCPPorts = [80 443 1401 631];
        networking.hostName = config.host;
        networking.firewall.checkReversePath = "loose";
        networking.iproute2.enable = true;
        networking.wireguard.enable = true;
        programs.openvpn3.enable = true;
        networking.networkmanager = {
            enable = true;
            packages = [pkgs.networkmanager-openvpn];
        };
    };
}
