{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    
    services.input-remapper.enable = true;
    services.syncthing = {
      enable = true;
      user = "robert";
      dataDir = "/home/robert/Documents";
      configDir = "/home/robert/.config/syncthing";
    };
    
    programs.dconf.enable = true;
    services.printing.enable = true;
    services.printing.drivers = [pkgs.cnijfilter2 pkgs.gutenprint];
    # Fingerprint sensor on laptop
    services.fprintd.enable = lib.mkIf (hostname == "laptop") true;
    # Mount, trash, and other functionalities
    services.gvfs.enable = true; 
    # Thumbnail support for images
    services.tumbler.enable = true; 
    services.resolved.enable = true;
    services.mullvad-vpn.enable = true;
    services.blueman.enable = true;
    services.envfs.enable = true;
  
    security.pam.mount.fuseMountOptions = [ "user_allow_other" ];
    services.auto-cpufreq.enable = lib.mkIf (hostname == "laptop") true;
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
    
    programs.fuse.userAllowOther = true;
    security.polkit.enable = true;
    programs.kdeconnect.enable = true; 
    programs.xfconf.enable = true;
}
