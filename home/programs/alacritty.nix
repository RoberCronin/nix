{...}: {
    programs.alacritty = {
        enable = false;
        settings = {
            general.import = [
                "~/.config/alacritty/differences.toml"
            ];
        };
    };
}
