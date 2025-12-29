{...}: {
    services.flatpak.enable = true;
    services.flatpak.packages = [
        "us.zoom.Zoom"
        "md.obsidian.Obsidian"
        "com.slack.Slack"
        "com.microsoft.Edge"
        "com.github.tchx84.Flatseal"
        "sh.ppy.osu"
        "xyz.xclicker.xclicker"

        # install rnote as flatpak because nixpkgs version is broken
        "com.github.flxzt.rnote"
    ];
}
