{self, ...}: {
    flake.modules.nixos.nvidiaGraphics = {config, ...}: {
        imports = [
            self.modules.nixos.nvidiaGraphicsBase
        ];

        config = {
            hardware.nvidia = {
                # package = config.boot.kernelPackages.nvidiaPackages.stable;
                # temporary until driver compilation is fixed
                package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
                    version = "595.99.02";
                    sha256_64bit = "sha256-6HR3lYv3YwcFSTJL1a1slI66btIQ5EAFs+/4SUD24ew=";
                    sha256_aarch64 = "sha256-CCqHZTN2KNOZ4yZp2rDcuRJp9pHfRw47k4m4dWnS/2w=";
                    openSha256 = "sha256-T36x/jx8yQ8l3LFp1rZIrTfcSwbGy8YSAvXOUSptpb4=";
                    settingsSha256 = "sha256-GYCcnxfKPrTCrsmd25sMyzfC5cqJQJx0c31haooyTYM=";
                    persistencedSha256 = "sha256-VyKtF/HdHPQrHHK6opSO69M72LmnGZtauuchj9uuje8=";
                };
            };
        };
    };

    flake.modules.nixos.nvidiaGraphicsLegacy = {config, ...}: {
        imports = [
            self.modules.nixos.nvidiaGraphicsBase
        ];

        config = {
            hardware.nvidia = {
                package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
            };
        };
    };

    flake.modules.nixos.nvidiaGraphicsBase = {pkgs, ...}: {
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
        hardware.nvidia-container-toolkit.enable = true;
        hardware.nvidia = {
            # Modesetting is required.
            modesetting.enable = true;
            powerManagement.enable = false;
            powerManagement.finegrained = false;

            # Use the Nvidia open source kernel module (not nouveu)
            open = false;
            nvidiaSettings = true;
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
