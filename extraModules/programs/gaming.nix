{
    flake.modules.nixos.gaming = {pkgs, ...}: {
        programs.gamemode = {
            enable = true;
            settings = {
                custom = {
                    start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
                    end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
                };
            };

            steam = {
                enable = true;
            };
        };

        hardware.steam-hardware.enable = true;

        environment.systemPackages = with pkgs; [
            gamescope
            luanti
            heroic
            r2modman
            winePackages.unstableFull
            protontricks
            bottles
            prismlauncher
        ];
    };
}
