{pkgs, ...}: {
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-macchiato";
        package = pkgs.kdePackages.sddm;
    };
}
