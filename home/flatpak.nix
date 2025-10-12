{...}: {
    services.flatpak.enable = true;
    services.flatpak.uninstallUnmanaged = true;
    services.flatpak.update.onActivation = true;
    services.flatpak.packages = [
        "xyz.xclicker.xclicker"
        "us.zoom.Zoom"
        "org.qbittorrent.qBittorrent"
        "org.prismlauncher.PrismLauncher"
        "org.mozilla.firefox"
        "org.mozilla.Thunderbird"
        "org.luanti.luanti"
        "org.libreoffice.LibreOffice"
        "org.gimp.GIMP"
        "org.blender.Blender"
        "org.audacityteam.Audacity"
        "net.ankiweb.Anki"
        "md.obsidian.Obsidian"
        "dev.vencord.Vesktop"
        "com.usebottles.bottles"
        "com.slack.Slack"
        "com.moonlight_stream.Moonlight"
        "com.microsoft.Edge"
        "com.github.wwmm.easyeffects"
        "com.github.tchx84.Flatseal"
        "com.heroicgameslauncher.hgl"
    ];
}
