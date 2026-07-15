{
    flake.modules.nixos.base = {
        pkgs,
        config,
        ...
    }: {
        xdg.portal.enable = true;
        xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
        xdg.portal.config.common.default = "*";
        services.flatpak.enable = true;

        # config for getting obs' virtual camera working
        boot.extraModulePackages = with config.boot.kernelPackages; [
            v4l2loopback
        ];
        boot.kernelModules = [
            "v4l2loopback"
        ];
        boot.extraModprobeConfig = ''
            options v4l2loopback exclusive_caps=1 card_label="OBS Virtual Camera"
        '';
        security.polkit.enable = true;
    };

    flake.modules.homeManager.base = {
        pkgs,
        lib,
        ...
    }: let
        # We point directly to 'gnugrep' instead of 'grep'
        grep = pkgs.gnugrep;

        # 1. Declare the Flatpaks you *want* on your system
        desiredFlatpaks = [
            "us.zoom.Zoom"
            "md.obsidian.Obsidian"
            "com.slack.Slack"
            "com.github.tchx84.Flatseal"
            "sh.ppy.osu"
            "xyz.xclicker.xclicker"
            "org.vinegarhq.Sober"
            "org.gnome.SimpleScan"
            "com.moonlight_stream.Moonlight"
            "net.drawpile.drawpile"
            "com.usebottles.bottles"
            "com.obsproject.Studio.Plugin.DroidCam"
            "com.obsproject.Studio"
            "com.discordapp.Discord"
            "moe.launcher.the-honkers-railway-launcher"
            "org.jellyfin.JellyfinDesktop"

            # install rnote as flatpak because nixpkgs version is broken
            "com.github.flxzt.rnote"
        ];
    in {
        home.activation.flatpakManagement = lib.hm.dag.entryAfter ["writeBoundary"] ''
            # 2. Ensure the Flathub repo is added
            ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub \
              https://flathub.org/repo/flathub.flatpakrepo

            # 3. Get currently installed Flatpaks
            installedFlatpaks=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)

            # 4. Remove any Flatpaks that are NOT in the desired list
            for installed in $installedFlatpaks; do
              if ! echo ${toString desiredFlatpaks} | ${grep}/bin/grep -q $installed; then
                echo "Removing $installed because it's not in the desiredFlatpaks list."
                ${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive $installed
              fi
            done

            # 5. Install or re-install the Flatpaks you DO want
            apps="${toString desiredFlatpaks}"
            echo "Ensuring $apps is installed."
            ${pkgs.flatpak}/bin/flatpak install --user -y flathub $apps

            # 6. Remove unused Flatpaks
            ${pkgs.flatpak}/bin/flatpak uninstall --unused -y

            # 7. Update all installed Flatpaks
            # ${pkgs.flatpak}/bin/flatpak update -y

            # 8. Update permissions
            ${pkgs.flatpak}/bin/flatpak override --user --device=all com.obsproject.Studio
        '';
    };
}
