{
    flake.modules.nixos.intelGraphics = {pkgs, ...}: {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                intel-media-driver
                vpl-gpu-rt
                intel-vaapi-driver
                libva-vdpau-driver
                libvdpau-va-gl
                intel-compute-runtime
            ];
        };
    };
}
