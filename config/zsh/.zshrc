# .zshrc config by CandyyPL

# NeoVim path export for manual neovim install
# export PATH="$PATH:/opt/nvim-linux64/bin"

export EDITOR='nvim'

alias nv='nvim'
alias ls='ls --color'
alias nf='clear && neofetch'

alias cfz='$EDITOR $HOME/.zshrc'
alias cfb='$EDITOR $HOME/.config/bspwm/bspwmrc'
alias cfs='$EDITOR $HOME/.config/sxhkd/sxhkdrc'
alias cfp='$EDITOR $HOME/.config/polybar/config.ini'
alias cfa='$EDITOR $HOME/.config/alacritty/alacritty.yml'
alias cfn='$EDITOR $HOME/.config/nvim/init.vim'

eval "$(starship init zsh)"

