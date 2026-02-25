{pkgs, ...}: {
    programs.gamemode = {
        enable = true;
        settings = {
            custom = {
                start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
                end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
            };
        };
    };

    environment.systemPackages = with pkgs; [
        gamescope
        luanti
        heroic
        r2modman
        winePackages.unstableFull
        protontricks
    ];
}
