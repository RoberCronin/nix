{config, ...}: {
    xdg.configFile = {
        "hypr" = {
            source = config.lib.file.mkOutOfStoreSymlink ./hypr;
            recursive = true;
        };

        # This file contains the differences between hosts.
        # It is imported in ~/.config/hypr/hyprland.conf
        "hyprland_host.conf" = {
            source = config.lib.file.mkOutOfStoreSymlink ./hypr/hosts/${config.host}.conf;
        };

        "alacritty" = {
            source = config.lib.file.mkOutOfStoreSymlink ./alacritty;
            recursive = true;
        };

        "better-control" = {
            source = config.lib.file.mkOutOfStoreSymlink ./better-control;
            recursive = true;
        };

        "nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink ./nvim;
            recursive = true;
        };

        "waybar" = {
            source = config.lib.file.mkOutOfStoreSymlink ./waybar;
            recursive = true;
        };

        "btop" = {
            source = config.lib.file.mkOutOfStoreSymlink ./btop;
            recursive = true;
        };

        "wofi" = {
            source = config.lib.file.mkOutOfStoreSymlink ./wofi;
            recursive = true;
        };

        "rofi" = {
            source = config.lib.file.mkOutOfStoreSymlink ./rofi;
            recursive = true;
        };

        "git" = {
            source = config.lib.file.mkOutOfStoreSymlink ./git;
            recursive = true;
        };

        "dunst" = {
            source = config.lib.file.mkOutOfStoreSymlink ./dunst;
            recursive = true;
        };

        "starship.toml" = {
            source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
        };
    };
}
