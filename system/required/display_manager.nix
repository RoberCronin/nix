{pkgs, ...}: {
    services.displayManager.gdm.enable = true;

    #services.displayManager.cosmic-greeter.enable = true;
    #services.displayManager.sddm = {
    #    enable = true;
    #    wayland.enable = true;
    #    theme = "catppuccin-macchiato";
    #    package = pkgs.kdePackages.sddm;
    #};
}
