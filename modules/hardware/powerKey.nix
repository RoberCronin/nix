{
    flake.modules.nixos.powerKey = {...}: {
        services.logind = {
            settings.Login = {
                HandlePowerKey = "suspend";
                IdleActionSec = 1800;
                HandleLidSwitch = "suspend";
            };
        };
    };
}
