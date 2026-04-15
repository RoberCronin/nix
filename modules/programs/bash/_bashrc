if [ -e "/run/current-system/sw/bin/bash" ]; then
    export SHELL=/run/current-system/sw/bin/bash
fi

if [ -e "{$HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

bind 'set completion-ignore-case on'

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

try() {
    command nix-shell -p "$@"
}

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

if command -v zoxide &>/dev/null; then
    alias cd=z
fi
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias cg='lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git'
alias gc='nix-collect-garbage --delete-older-than 30d'
alias la='ls -a'
alias lg=lazygit
alias nf=fastfetch
alias nv=nvim
alias t='thunar .'
alias update='nix flake update'
alias vimdiff='nvim -d'
alias c=clear
alias e=exit

#if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
#  . "/nix/store/dlv80xfik1mw07x68ixlw4zarqj9fjxh-bash-completion-2.16.0/etc/profile.d/bash_completion.sh"
#fiRR

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

if [[ $TERM != "dumb" ]]; then
    eval "$(starship init bash --print-full-init)"
fi

#if [[ :$SHELLOPTS: =~ :(vi|emacs): ]]; then
#  source "/nix/store/w8nzzxba3qm6x32vbf21agkv3611mqc6-bash-preexec-0.5.0/share/bash/bash-preexec.sh"
#  eval "$(atuin init bash )"
#fi

if command -v direnv &>/dev/null; then
    eval "$(direnv hook bash)"
else
    echo "direnv not installed."
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
else
    echo "zoxide not installed."
fi
