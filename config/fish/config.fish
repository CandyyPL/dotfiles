if status is-interactive
    # Commands to run in interactive sessions can go here
end

function banner
    echo
    figlet $argv -f ~/.local/share/fonts/starwars.flf | lolcat
    echo
end

function clock
    tty-clock -scbt -C 7
end

function fish_greeting
    # figlet "F I S H" | lolcat
end

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

export EDITOR="nvim"

alias nv='NVIM_APPNAME="lazyvim" nvim'
alias nve='NVIM_APPNAME="nvim" nvim'
alias ls="eza"
alias yz="yazi"
alias lg="lazygit"
alias gitl="git log --graph --decorate --oneline"
alias fzf="fzf -e"

eval "$(starship init fish)"
