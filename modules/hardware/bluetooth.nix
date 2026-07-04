{
    flake.modules.nixos.bluetooth = {config, ...}: {
        services.blueman.enable = true;
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
                General = {
                    Name = config.host + "bluetooth";
                    ControllerMode = "dual";
                    FastConnectable = "true";
                    Experimental = "true";
                };
                Policy = {
                    AutoEnable = "true";
                };
            };
        };
    };
}
