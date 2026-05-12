{
    flake.modules.nixos.base = {pkgs, ...}: {
        virtualisation = {
            containers.enable = true;
            docker = {
                enable = true;
                extraPackages = with pkgs; [docker-compose];
            };
        };
    };
}
