{pkgs, ...}: {
    gtk = {
        enable = true;
        iconTheme.package = pkgs.papirus-icon-theme;
        iconTheme.name = "Papirus-Dark";
        theme.package = pkgs.catppuccin-gtk.override {
            accents = ["maroon"];
            size = "compact";
            tweaks = ["rimless"];
            variant = "macchiato";
        };

        theme.name = "catppuccin-macchiato-maroon-compact+rimless";
        cursorTheme.package = pkgs.bibata-cursors;
        cursorTheme.name = "Bibata-Modern-Classic";
        cursorTheme.size = 24;
    };
}
