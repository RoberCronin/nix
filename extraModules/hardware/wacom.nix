{
    flake.modules.nixos.wacom = {pkgs, ...}: {
        services.xserver.wacom.enable = true;
        environment.systemPackages = with pkgs; [
            xf86_input_wacom
            libwacom
        ];
    };
}
