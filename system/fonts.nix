{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    fonts.fontDir.enable = true;
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-extra
        dejavu_fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        source-han-sans-japanese
        source-han-serif-japanese
        ubuntu_font_family
        unifont
        julia-mono
        #nerd-fonts
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
