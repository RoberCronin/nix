{
    flake.modules.nixos.virtualization = {pkgs, ...}: {
        virtualisation = {
            containers.enable = true;
            # docker.enable = true;
            podman = {
                enable = true;
                dockerCompat = true;
                defaultNetwork.settings.dns_enabled = true;
                extraPackages = with pkgs; [
                    podman-compose
                    docker-compose
                ];
            };
        };
    };
}
