{
    flake.modules.nixos.base = {config, ...}: {
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
