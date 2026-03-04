{
    pkgs,
    config,
    ...
}: {
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
        settings = {
            General = {
                GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=${toString config.displayManagerScale},QT_FONT_DPI=192";
            };
        };

        extraPackages = with pkgs; [
            kdePackages.qtmultimedia
        ];
    };

    environment.systemPackages = [
        (pkgs.sddm-astronaut.override
        {
            themeConfig = {
                Background = "${../home/environment/evening-sky.png}";
            };
        })
    ];
}
