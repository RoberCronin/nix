{
    config,
    pkgs,
    ...
}: {
    hardware.graphics = {
        enable = true;
    };

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
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    environment.systemPackages = with pkgs; [
        libva-utils
        vdpauinfo
        vulkan-tools
        vulkan-validation-layers
        libvdpau-va-gl
        egl-wayland
        wgpu-utils
        mesa
        libglvnd
        nvitop
        libGL
    ];
}
