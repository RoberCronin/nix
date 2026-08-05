{
    flake.modules.nixos.audio = {...}: {
        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        boot.kernelParams = ["snd_usb_audio.power_save=0"];
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;

            extraConfig.pipewire."99-buffer" = {
                "context.properties" = {
                    "default.clock.quantum" = 1024;
                    "default.clock.min-quantum" = 1024;
                    "default.clock.max-quantum" = 2048;
                    "default.clock.rate" = 48000;
                };
            };
        };
    };
}
