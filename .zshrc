PATH=$PATH:/Users/khord/scripts/path:/usr/local/opt/avr-gcc@7/bin

export ZSH="/Users/khord/.oh-my-zsh"
export HISTCONTROL=ignorespace

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

alias z=". ~/.zshrc"
alias bbd="(cd /Users/khord/dotfiles && exec brew bundle dump --force)"
alias myip='extip=$(dig +short myip.opendns.com @resolver1.opendns.com); echo $extip && whois $extip | awk '\''/Organization/ {$1=""; print substr($0,2)}'\'''
