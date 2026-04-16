{
    flake.modules.nixos.hardware.powerKey = {...}: {
        services.logind = {
            settings.Login = {
                HandlePowerKey = "suspend";
                IdleActionSec = 1800;
                HandleLidSwitch = "suspend";
            };
        };
    };
}
