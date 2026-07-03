{
    flake.modules.nixos.server = {
        config,
        lib,
        pkgs,
        modulesPath,
        ...
    }: let
        aic8800-driver = config.boot.kernelPackages.callPackage ({
            stdenv,
            fetchFromGitHub,
            kernel,
        }:
            stdenv.mkDerivation {
                pname = "aic8800-driver";
                version = "unstable-2024";

                src = fetchFromGitHub {
                    owner = "BLUEMOON233";
                    repo = "AIC8800-Linux-Driver";
                    rev = "master";
                    sha256 = "sha256-0XHW0mLB3Y0zJdjI/rBbwNGOBz2plRHso1BbCd2tsYE=";
                };

                sourceRoot = "source/drivers/aic8800";
                hardeningDisable = ["pic" "format"];
                nativeBuildInputs = kernel.moduleBuildDependencies;

                makeFlags = [
                    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
                    "CONFIG_USE_FW_REQUEST=y"
                ];

                installPhase = ''
                    mkdir -p "$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/"
                    cp aic8800_fdrv/aic8800_fdrv.ko "$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/"
                    cp aic_load_fw/aic_load_fw.ko "$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/"
                '';
            }) {};

        aic8800-firmware = pkgs.stdenv.mkDerivation {
            pname = "aic8800-firmware";
            version = "1.0";

            src = pkgs.fetchFromGitHub {
                owner = "BLUEMOON233";
                repo = "AIC8800-Linux-Driver";
                rev = "master";
                sha256 = "sha256-0XHW0mLB3Y0zJdjI/rBbwNGOBz2plRHso1BbCd2tsYE=";
            };

            installPhase = ''
                mkdir -p "$out/lib/firmware"
                cp fw/aic8800D80/fmacfw_8800d80_u02.bin "$out/lib/firmware/"
                cp fw/aic8800D80/lmacfw_rf_8800d80_u02.bin "$out/lib/firmware/"
                cp fw/aic8800D80/fw_patch_8800d80_u02.bin "$out/lib/firmware/"
                cp fw/aic8800D80/fw_adid_8800d80_u02.bin "$out/lib/firmware/"
                cp fw/aic8800D80/calibmode_8800d80.bin "$out/lib/firmware/"
                cp fw/aic8800D80/fw_patch_table_8800d80_u02.bin "$out/lib/firmware/"
                cp fw/aic8800D80/aic_userconfig_8800d80.txt "$out/lib/firmware/"
                ln -sf fmacfw_8800d80_u02.bin "$out/lib/firmware/fmacfw.bin"
                ln -sf fmacfw_8800d80_u02.bin "$out/lib/firmware/fmacfw.ihex"
            '';
        };
    in {
        imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
        ];

        boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
        boot.initrd.kernelModules = ["aic8800_fdrv"];
        boot.kernelModules = ["cfg80211" "aic_load_fw" "aic8800_fdrv" "kvm-amd"];
        boot.extraModulePackages = [aic8800-driver];
        hardware.firmware = [aic8800-firmware];
        environment.systemPackages = [pkgs.usb-modeswitch];
        services.udev.extraRules = ''
            # switch aic8800 from MSC to wifi mode when the USB device is detected
            ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="a69c", ATTR{idProduct}=="5723", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -KQ -v a69c -p 5723"
            # eject from the block device if usb-storage binds to it first
            KERNEL=="sd*", ATTRS{idVendor}=="a69c", ATTRS{idProduct}=="5723", RUN+="${pkgs.util-linux}/bin/eject /dev/%k"
        '';

        swapDevices = [
            {
                device = "/swap/swapfile";
                size = 20480; # 20GB in MB
            }
        ];

        fileSystems."/" = {
            device = "/dev/disk/by-uuid/41f16f18-9e9a-4e96-8b1f-7ab5c65f878c";
            fsType = "btrfs";
            options = ["subvol=root"];
        };

        fileSystems."/home" = {
            device = "/dev/disk/by-uuid/41f16f18-9e9a-4e96-8b1f-7ab5c65f878c";
            fsType = "btrfs";
            options = ["subvol=home"];
        };

        fileSystems."/nix" = {
            device = "/dev/disk/by-uuid/41f16f18-9e9a-4e96-8b1f-7ab5c65f878c";
            fsType = "btrfs";
            options = ["subvol=nix"];
        };

        fileSystems."/var/log" = {
            device = "/dev/disk/by-uuid/41f16f18-9e9a-4e96-8b1f-7ab5c65f878c";
            fsType = "btrfs";
            options = ["subvol=log"];
        };

        fileSystems."/swap" = {
            device = "/dev/disk/by-uuid/41f16f18-9e9a-4e96-8b1f-7ab5c65f878c";
            fsType = "btrfs";
            options = ["subvol=swap" "noatime"];
        };

        fileSystems."/boot" = {
            device = "/dev/disk/by-uuid/E107-9DBE";
            fsType = "vfat";
            options = ["fmask=0022" "dmask=0022"];
        };

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
