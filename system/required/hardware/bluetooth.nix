{config, ...}: let
    hostname = config.hostdata.hostname;
in {
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
            General = {
                Name = hostname + "bluetooth";
                ControllerMode = "dual";
                FastConnectable = "true";
                Experimental = "true";
            };
            Policy = {
                AutoEnable = "true";
            };
        };
    };
}
