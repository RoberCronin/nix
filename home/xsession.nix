{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    xsession = {
        enable = true;
        initExtra = 
        ''
        export XMODIFIERS="@im=fcitx"
        export XMODIFIER="@im=fcitx"
        export GTK_IM_MODULE="fcitx"
        export QT_IM_MODULE="fcitx"
        fcitx &
        '';
    };
}
