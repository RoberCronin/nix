{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    
    # Configure keymap in X11
    console.useXkbConfig = true;
    services.xserver.xkb = {
      layout = "us";
      variant = "";
      options = "caps:super";
    };
  
    services.libinput.enable = true;
    i18n.inputMethod.enable = true;
    i18n.inputMethod.type = "fcitx5";
    i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-mozc ];
    services.libinput.mouse.accelProfile = "flat";
    
    services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", GROUP="plugdev", MODE="0666"
    '';
}
