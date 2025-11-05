{pkgs, ...}: {
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        #base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };
        };
    };
}
