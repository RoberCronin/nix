{
    flake.modules.nixos.hardware.nvidiaGraphics = {
        config,
        pkgs,
        ...
    }: {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                nvidia-vaapi-driver
                libva
                libva-utils
                libva-vdpau-driver
                vulkan-loader
            ];
            extraPackages32 = with pkgs.pkgsi686Linux; [nvidia-vaapi-driver];
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
            open = false;
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
    };
}
