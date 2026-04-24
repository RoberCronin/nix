{
    flake.modules.nixos.base = {pkgs, ...}: {
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

        # Thumbnail support for images
        services.tumbler.enable = true;
        services.resolved.enable = true;
    };
}
