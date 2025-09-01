{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-macchiato";
        package = pkgs.kdePackages.sddm;
    };
}
