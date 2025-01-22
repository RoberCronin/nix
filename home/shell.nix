{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.atuin = {
        enable = true;
        enableBashIntegration = true;
    };
    
    programs.direnv = {
        enable = true;
        enableBashIntegration = true;
    };
    
    programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
    };

    programs.starship = {
        enable = true;
        enableBashIntegration = true;
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            "la" = "ls -a";
            "lg" = "lazygit";
            "nf" = "fastfetch";
            "nv" = "nvim";
            "y" = "yazi";
            "c" = "clear";
            "cd" = "z";
            "sl" = "sl -e";
            #"update" = "nix flake update";
        };
        bashrcExtra = 
        ''
        rebuild() {
            if [[ $@ == "home" ]]; then
                command home-manager switch -b backup --flake .#robert
            elif [[ $@ == "system" ]]; then
                command sudo nixos-rebuild switch --flake .#robert
            else
                command rebuild "$@"
            fi
        }
        
        update() {
            if [[ $@ == "all" ]]; then
                if [ "$EUID" -e 0 ]; then
                    nix flake update
                    home-manager switch -b backup --flake .#robert
                else
                    echo "Please run as root"
                fi
            else
                nix flake update
            fi
        }
        
        ssh() {
            if [[ $@ == "ubuntu" ]]; then
                command ssh -i ~/.ssh/ubuntu/ssh-key-2022-07-02.key ubuntu@158.101.10.218
            elif [[ $@ == "arm" ]]; then
                command ssh -i ~/.ssh/arm/ssh-key-2022-08-19.key ubuntu@129.146.80.212
            else
                command ssh "$@"
            fi
        }

        try() {
            command nix-shell -p "$@"
        }

        source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
        bind 'set completion-ignore-case on'
        '';
    };
}
