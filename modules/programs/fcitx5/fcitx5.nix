{
    flake.modules.nixos.base = {pkgs, ...}: {
        i18n.inputMethod.enable = true;
        i18n.inputMethod.type = "fcitx5";
        i18n.inputMethod.fcitx5.addons = with pkgs; [fcitx5-mozc];
    };

    flake.modules.homeManager.base = {config, ...}: {
        home.file = {
            ".local/share/fcitx5" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
