{
    config,
    lib,
    pkgs,
    ...
}: let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in {
    #services.autorandr.enable = true;
    programs.autorandr = {
        enable = true;
        hooks.postswitch = {
            "*" = "notify-send -i display 'Display plugged in.' $AUTORANDR_CURRENT_PROFILE";
        };
    };
}
