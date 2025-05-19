{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    services.autorandr.enable = true;
    programs.dconf.enable = true;
    services.blueman.enable = true;
    services.envfs.enable = true;
    programs.kdeconnect.enable = true; 
    programs.xfconf.enable = true;
    security.polkit.enable = true;
    services.printing = {
        enable = true;
        drivers = [pkgs.cnijfilter2 pkgs.gutenprint];
    };
    services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
    };    
    services.auto-cpufreq.enable = lib.mkIf (hostname == "laptop" || hostname == "big_laptop") true;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };
        
        charger = {
            governor = "performance";
            turbo = "auto";
        };
    };
    
    # Fingerprint sensor on laptop
    services.fprintd.enable = lib.mkIf (hostname == "laptop") true;
    services.xserver.wacom.enable = lib.mkIf (hostname == "laptop") true;
    
    # Thumbnail support for images
    services.tumbler.enable = true; 
    services.resolved.enable = true;
  
    # Mount, trash, and other functionalities
    services.gvfs.enable = true; 
    security.pam.mount.fuseMountOptions = [ "user_allow_other" ];
    programs.fuse.userAllowOther = true;
}
