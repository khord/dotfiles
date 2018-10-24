PATH=$PATH:/Applications/VMware\ OVF\ Tool:/Users/khord/scripts/path

export ZSH="/Users/khord/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"
#ZSH_THEME="pygmalion"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="khord"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
POWERLEVEL9K_TIME_BACKGROUND='grey50'
POWERLEVEL9K_STATUS_VERBOSE=false

alias boo="imgcat ~/Pictures/emojis/128px/boo-icon-128px.png"
alias simspace="imgcat ~/Pictures/emojis/128px/Light-Blue-128px.png"
