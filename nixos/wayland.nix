{
    inputs,
    pkgs,
    lib,
    config,
    ...
}: {
    environment.systemPackages = lib.mkIf config.programs.hyprland.enable (
        with pkgs; [
            dunst
            rofi
            networkmanagerapplet
            wofi
            waybar
            playerctl
            nwg-look
            hyprpaper
            swww
            nwg-drawer
        ]
    );

    programs.hyprland = {
        enable = true;
        withUWSM = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
}
