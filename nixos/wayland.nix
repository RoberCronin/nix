{
    inputs,
    pkgs,
    lib,
    config,
    ...
}: {
    environment.systemPackages = lib.mkIf config.programs.hyprland.enable (
        with pkgs; [
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
        ]
    );

    programs.hyprland = {
        enable = true;
        withUWSM = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

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

    programs.waybar = {
        enable = true;
    };
}
