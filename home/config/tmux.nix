{ config, lib, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        disableConfirmationPrompt = true;
        mouse = true;
        prefix = "M-Space";
        plugins = with pkgs; [
            {
                plugin = tmuxPlugins.catppuccin;
                extraConfig = ''
                    set -g @catppuccin_window_status_style "rounded"
                    set -g @catppuccin_flavour 'macchiato'
                    set -g @catppuccin_window_status_style "basic"
                    set -g @catppuccin_status_background "none"
                    
                    set -g status-right-length 100
                    set -g status-left-length 100
                    set -g status-left ""
                    set -g status-right "#{E:@catppuccin_status_application}"
                    set -agF status-right "#{E:@catppuccin_status_cpu}"
                    set -ag status-right "#{E:@catppuccin_status_session}"
                    set -ag status-right "#{E:@catppuccin_status_uptime}"
                    set -agF status-right "#{E:@catppuccin_status_battery}"
                '';
            }
            {
                plugin = tmuxPlugins.vim-tmux-navigator;
            }
        ];
        extraConfig = ''
            bind H split-window -h
            bind V split-window -v
            unbind '"'
            unbind %
            
            bind -n C-h select-pane -L
            bind -n C-l select-pane -R
            bind -n C-k select-pane -U
            bind -n C-j select-pane -D
            
            # don't do anything when a 'bell' rings
            set -g visual-activity off
            set -g visual-bell off
            set -g visual-silence off
            setw -g monitor-activity off
            set -g bell-action none
        '';
    };
    
    #home.file.tmux = {
    #    source = ./imports/tmux;
    #    target = ".config/tmux";
    #    recursive = true;
    #};
}
