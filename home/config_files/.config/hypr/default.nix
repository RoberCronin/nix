{
    inputs,
    config,
    pkgs,
    ...
}: {
    xdg.configFile = {
        "hypr" = {
            source = config.lib.meta.mkMutableSymlink ./.;
            recursive = true;
        };

        # This file contains the differences between hosts (i.e. laptop vs desktop configs).
        # It is imported in ~/.config/hypr/hyprland.conf
        "hyprland_host.conf" = {
            source = config.lib.meta.mkMutableSymlink ./hosts/${config.host}.conf;
        };

        "hyprland_plugins.conf" = let
            hyprgrass_path = "${inputs.hyprgrass.packages.${pkgs.system}.default}/lib/libhyprgrass.so";
        in {
            text = ''
                plugin = ${hyprgrass_path}
            '';
        };
    };
}
