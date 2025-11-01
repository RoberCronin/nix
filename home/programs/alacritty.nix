{...}: {
    programs.alacritty = {
        enable = true;
        settings = {
            general.import = [
                "~/.config/alacritty/differences.toml"
            ];
        };
    };
}
