# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

