{self, ...}: {
    flake.modules.nixos.sway = {pkgs, ...}: {
        imports = with self.modules.nixos; [
            waybar
        ];

        programs.sway = {
            enable = true;
            extraOptions = ["--unsupported-gpu"];
        };

        programs.uwsm = {
            enable = true;
            waylandCompositors.sway = {
                prettyName = "Sway";
                comment = "Sway with UWSM";
                binPath = "${pkgs.sway}/bin/sway";
                extraArgs = ["--unsupported-gpu"];
            };
        };

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
    };

    flake.modules.homeManager.sway = {config, ...}: {
        imports = with self.modules.homeManager; [
            waybar
        ];

        xdg.configFile = {
            "sway" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };

            "sway_monitors" = {
                source = config.lib.meta.mkMutableSymlink ./_config/hosts/${config.host};
            };
        };
    };
}
