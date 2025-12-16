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

export EDITOR="nvim"

alias nv="nvim"
alias ls="eza"
alias yz="yazi"
alias nf="clear && neofetch"

eval "$(starship init fish)"
