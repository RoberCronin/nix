{config, ...}: let
    config_files_dir = "${config.home.homeDirectory}/nix/home/config_files/.config";
in {
    xdg.configFile = {
        "hypr" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/hypr";
            recursive = true;
        };

        # This file contains the differences between hosts.
        # It is imported in ~/.config/hypr/hyprland.conf
        "hyprland_host.conf" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/hypr/hosts/${config.host}.conf";
        };

        "alacritty" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/alacritty";
            recursive = true;
        };

        "better-control" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/better-control";
            recursive = true;
        };

        "nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/nvim";
            recursive = true;
        };

        "waybar" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/waybar";
            recursive = true;
        };

        "btop" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/btop";
            recursive = true;
        };

        "wofi" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/wofi";
            recursive = true;
        };

        "rofi" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/rofi";
            recursive = true;
        };

        "git" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/git";
            recursive = true;
        };

        "dunst" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/dunst";
            recursive = true;
        };

        "starship.toml" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config_files_dir}/starship.toml";
        };
    };
}
