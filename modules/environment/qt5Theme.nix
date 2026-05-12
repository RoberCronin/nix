{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            libsForQt5.qt5ct
            kdePackages.qt6ct
            kdePackages.qtstyleplugin-kvantum
        ];
    };

    flake.modules.homeManager.base = {pkgs, ...}: {
        qt = {
            enable = true;
            style = {
                package = pkgs.catppuccin-qt5ct;
                name = "catppuccin-macchiato-maroon";
            };
        };
    };
}
