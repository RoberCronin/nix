{config, ...}: {
    xdg.userDirs = {
        enable = true;
        desktop = "${config.home.homeDirectory}/.config/unused/Desktop";
        templates = "${config.home.homeDirectory}/.config/unused/Templates";
        publicShare = "${config.home.homeDirectory}/.config/unused/Public";
    };
}
