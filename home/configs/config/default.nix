{config, ...}: {
    xdg.configFile = {
        "hypr" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/hypr";
            recursive = true;
        };

        # This file contains the differences between hosts.
        # It is imported in ~/.config/hypr/hyprland.conf
        "hyprland_host.conf" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/hypr/hosts/${config.host}.conf";
        };

        "alacritty" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/alacritty";
            recursive = true;
        };

        "better-control" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/better-control";
            recursive = true;
        };

        "nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/nvim";
            recursive = true;
        };

        "waybar" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/waybar";
            recursive = true;
        };

        "btop" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/btop";
            recursive = true;
        };

        "wofi" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/wofi";
            recursive = true;
        };

        "rofi" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/rofi";
            recursive = true;
        };

        "git" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/git";
            recursive = true;
        };

        "dunst" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/dunst";
            recursive = true;
        };

        "starship.toml" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/configs/config/starship.toml";
        };
    };
}
