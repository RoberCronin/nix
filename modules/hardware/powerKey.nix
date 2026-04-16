{
    flake.modules.nixos.hardware.networking = {...}: {
        services.logind = {
            settings.Login = {
                HandlePowerKey = "suspend";
                IdleActionSec = 1800;
                HandleLidSwitch = "suspend";
            };
        };
    };
}
