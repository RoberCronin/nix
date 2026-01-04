{config, ...}: {
    imports = [
        ./wofi
        ./waybar
        ./rofi
        ./nvim
        ./hypr
        ./git
        ./dunst
        ./btop
        ./better-control
        ./alacritty
        ./Code
    ];
    xdg.configFile = {
        "starship.toml" = {
            source = config.lib.meta.mkMutableSymlink ./starship.toml;
        };
    };
}
