{...}: {
    programs.iio-hyprland.enable = true;
    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };
}
