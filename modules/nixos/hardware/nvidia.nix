{config, ...}: {
    environment.variables = {
        __GL_SYNC_DISPLAY_DEVICE = "DP-0";
    };
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
        # Modesetting is required.
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;

        # Use the Nvidia open source kernel module (not nouveu)
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    nixpkgs.config.cudaSupport = true;
}
