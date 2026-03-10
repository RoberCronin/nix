{pkgs, ...}: {
    environment.packages = with pkgs; [
        vim
        neovim
        git
        lazygit
        home-manager
        gh
        jq
        powertop
        rclone
        zip
        unzip
        rar
        unrar
        fzf
        wget
        curl
        btop
        ripgrep
        killall
        brightnessctl
        tmux
        imagemagick
        ffmpeg
        procps
        diffutils
        findutils
        utillinux
        tzdata
        hostname
        man
        gnugrep
        gnupg
        gnused
        gnutar
        bzip2
        gzip
        xz
    ];

    # Backup etc files instead of failing to activate generation if a file already exists in /etc
    environment.etcBackupExtension = ".bak";

    # Read the changelog before changing this value
    system.stateVersion = "24.05";

    # Set up nix for flakes
    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';

    time.timeZone = "America/Los_Angeles";
}
