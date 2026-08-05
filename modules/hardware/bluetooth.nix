{
    flake.modules.nixos.bluetooth = {config, ...}: {
        services.blueman.enable = true;
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
                General = {
                    Name = config.host + "bluetooth";
                    ControllerMode = "bredr";
                    FastConnectable = "true";
                    Experimental = "true";
                };

                Policy = {
                    AutoEnable = "true";
                };
            };
        };

        services.pipewire.wireplumber.extraConfig."10-bluez" = {
            "monitor.bluez.properties" = {
                "bluez5.codecs" = ["sbc" "sbc_xq" "aac" "aptx" "aptx_hd"];
            };
        };

        boot.extraModprobeConfig = ''
            options btusb enable_autosuspend=n

            options iwlwifi bt_coex_active=Y
            options iwlwifi power_save=N
            options iwlmvm power_scheme=1
        '';
    };
}
