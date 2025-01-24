{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    services.picom = {
        enable = lib.mkIf (hostname == "laptop") true;
        
        backend = "glx";
        vSync = true;
        opacityRules = [
            "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        ];
        
        fade = true;
        fadeDelta = 2;
        fadeSteps = [ 0.03 0.03 ];
        settings = {
            blur = {
                method = "gaussian";
                size = 15;
                deviation = 15;
            };

            corner-radius = 0;
            rounded-corners-exclude = [
                "class_g = 'Polybar'"
                "class_g = 'trayer'"
            ];

            glx-copy-from-front = true;
            glx-swap-method = 2;
            xrender-sync = true;
            xrender-sync-fence = true;
        };
    };
}
