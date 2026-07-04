{
    flake.modules.nixos.thunar = {pkgs, ...}: {
        programs.thunar = {
            enable = true;
            plugins = with pkgs; [
                file-roller
                xarchiver
                thunar-archive-plugin
                thunar-volman
                thunar-media-tags-plugin
                xfce4-exo
            ];
        };

        services.tumbler.enable = true;
        services.resolved.enable = true;
    };
}
