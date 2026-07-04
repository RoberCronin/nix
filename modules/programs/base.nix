{...}: {
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            # Common Terminal Utils
            jq
            powertop
            rclone
            zip
            unzip
            rar
            unrar
            gh
            fzf
            wget
            curl
            ripgrep
            killall
            brightnessctl
            vim
            tmux
            imagemagick
            ffmpeg

            # Other Terminal Utils
            exiftool
            fd
            yadm
            fastfetch
        ];
    };
}
