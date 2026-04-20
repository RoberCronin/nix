{
    flake.modules.nixos.base = {pkgs, ...}: {
        # Configure keymap in X11
        console.useXkbConfig = true;
        services.xserver.xkb = {
            layout = "us";
            variant = "";
            options = "caps:super";
        };

        services.libinput.enable = true;
        services.libinput.mouse.accelProfile = "flat";

        services.udev.extraRules = ''
            SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", GROUP="plugdev", MODE="0666"
        '';

        environment.systemPackages = with pkgs; [
            # Input
            piper
            xf86_input_wacom
            libwacom
            kdePackages.wacomtablet
        ];
    };
}
