{
    flake.modules.nixos.bluetooth = {config, ...}: {
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
