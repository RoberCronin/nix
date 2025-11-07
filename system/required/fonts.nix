{pkgs, ...}: {
    fonts.fontDir.enable = true;
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
        noto-fonts
        dejavu_fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        source-han-sans
        source-han-serif
        ubuntu-classic
        unifont
        julia-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.arimo
        material-icons
        font-awesome
        comic-mono
    ];
    fonts.fontconfig = {
        antialias = true;
        defaultFonts = {
            serif = ["Ubuntu"];
            sansSerif = ["Ubuntu"];
            monospace = ["Ubuntu Source"];
        };
    };
}
