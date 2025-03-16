{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    home.file.nvim = {
        source = ./imports/nvim;
        target = ".config/nvim";
        recursive = true;
    };
    
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        extraLuaPackages = ps: [ ps.magick ];
        extraPackages = [ pkgs.imagemagick ];
        extraPython3Packages = ps: with ps; [
        # ... other python packages
        pynvim
        jupyter-client
        cairosvg # for image rendering
        pnglatex # for image rendering
        plotly # for image rendering
        pyperclip
      ];
    };
}
