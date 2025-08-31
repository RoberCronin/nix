{
    config,
    lib,
    pkgs,
    ...
}: {
    nixpkgs.config.packageOverrides = pkgs: {
        catppuccin-gtk = pkgs.catppuccin-gtk.override {
            accents = ["mauve"]; # You can specify multiple accents here to outpu>
            size = "compact";
            tweaks = ["normal"]; # You can also specify multiple tweaks here
            variant = "macchiato";
        };
    };

    gtk = {
        enable = true;
        iconTheme.package = pkgs.papirus-icon-theme;
        iconTheme.name = "Papirus-Dark";
        theme.package = pkgs.catppuccin-gtk;
        theme.name = "catppuccin-macchiato-mauve-compact+normal";
        cursorTheme.package = pkgs.bibata-cursors;
        cursorTheme.name = "Bibata-Modern-Classic";
        cursorTheme.size = 24;
    };
}
