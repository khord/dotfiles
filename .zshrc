PATH=$PATH:/Applications/VMware\ OVF\ Tool:/Users/khord/scripts/path:/usr/local/opt/avr-gcc@7/bin

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
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

alias boo="imgcat ~/Pictures/emojis/128px/boo-icon-128px.png"
alias simspace="imgcat ~/Pictures/emojis/128px/Light-Blue-128px.png"
alias .z=". ~/.zshrc"
alias bbd="(cd /Users/khord/dotfiles && exec brew bundle dump --force)"
alias h="history"
alias myip='extip=$(dig +short myip.opendns.com @resolver1.opendns.com); echo $extip && whois $extip | awk '\''/Organization|org-name|descr/ {$1=""; print substr($0,2)}'\'''
alias slp="pmset sleepnow"
alias superscript="node ~/dotfiles/scripts/js/superscript.js"
alias vundle="vim +PluginInstall +qall"
alias wol="wakeonlan"
newsvg() { echo '<?xml version="1.0" encoding="utf-8"?>' >> $1; }
whoorg() { whois $1 | awk '/Organization|org-name|descr|CustName/ {$1=""; print substr($0,2)}' }

# opam configuration
test -r /Users/khord/.opam/opam-init/init.zsh && . /Users/khord/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
