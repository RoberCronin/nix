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
            "update" = "nix flake update";
        };
        bashrcExtra = 
        ''
        rebuild() {
            if [[ $@ == "home" ]]; then
                command home-manager switch -b backup --flake .#default
            elif [[ $@ == "system" ]]; then
                command sudo nixos-rebuild switch --flake .#default
            elif [[ $@ == "all" ]]; then
                command sudo nixos-rebuild switch --flake .#default
                command home-manager switch -b backup --flake .#default
            else
                command rebuild "$@"
            fi
        }
        
        ssh() {
            search_dir=/home/keys/

            for entry in $(sudo ls $search_dir)
            do
                filename=$(basename -- "$entry")
                extension="''${filename##*.}"
                filename="''${filename%.*}"

                if [[ $extension != "txt" ]]; then
                    continue
                fi

                if [[ $@ == $filename ]]; then
                    login=$(sudo cat $search_dir$filename.txt)
                    ssh_key=''${search_dir}''${filename}.key
                    
                    command sudo ssh -i $ssh_key $login
                    break
                fi
            done
        }

        try() {
            command nix-shell -p "$@"
        }

        source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
        bind 'set completion-ignore-case on'
        '';
    };
}
