{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.packages = with pkgs; [
        # file opening
        mpv
        nomacs
        flameshot
        xfce.mousepad

        # Gaming
        winePackages.unstableFull
        protontricks

        # Terminal Utils
        catfs
        yazi
        bat
        ns-usbloader
        fastfetch
        sshfs

        # GUI Applications
        onedrivegui
        arduino-ide
        system-config-printer
        pavucontrol
        r2modman
        alacritty
        arandr
        nitrogen
        jstest-gtk
        copyq
        
        # Development
        lazygit
        lazydocker
        vscode
        xclip # nvim copyq integration 
        direnv
        distrobox
        direnv
        stdenv
        gnumake
        tree-sitter
        # Code Styling
        clang-tools
        isort
        black
        stylua
        nodePackages_latest.prettier
        
        # Compiling/Languages
        clang-tools
        python3Full
        texliveTeTeX
        lua
        hugo
        cargo
        rustc
        nodejs_22
        gcc
        
        # Fun utils
        pipes
        lolcat 
        sl 
        cmatrix
        pipes-rs
        cowsay
        asciiquarium
        ttyper
    ];
}
