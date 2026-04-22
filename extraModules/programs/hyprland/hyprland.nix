{
    self,
    inputs,
    ...
}: {
    flake.modules.nixos.hyprland = {pkgs, ...}: {
        imports = with self.modules.nixos; [
            waybar
        ];

        environment.systemPackages = with pkgs; [
            linux-wallpaperengine
            mpvpaper
            grim
            slurp
            dunst
            rofi
            networkmanagerapplet
            wofi
            waybar
            playerctl
            nwg-look
            hyprpaper
            nwg-drawer
        ];

        programs.hyprland = {
            enable = true;
            withUWSM = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        };

        programs.waybar = {
            enable = true;
        };
    };

    flake.modules.homeManager.hyprland = {config, ...}: {
        imports = with self.modules.homeManager; [
            waybar
        ];

        xdg.configFile = {
            "hypr" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };

            # This file contains the differences between hosts (i.e. laptop vs desktop configs).
            "hyprland_host.conf" = {
                source = config.lib.meta.mkMutableSymlink ./_config/hosts/${config.host}.conf;
            };
        };
    };
}
