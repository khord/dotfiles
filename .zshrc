# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/khord/.oh-my-zsh"
export HISTCONTROL=ignorespace
export REPORTTIME=2
export KUBE_EDITOR="vim"
export ANSIBLE_COW_SELECTION="random"

ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' file-sort date

DEFAULT_USER="khord"

alias .z=". ~/.zshrc"
alias h="history"
alias myip='extip=$(dig +short myip.opendns.com @resolver1.opendns.com); if [ -z "$extip" ]; then echo "n/a"; else echo $extip && whois $extip | awk '\''/Organization|org-name|descr/ {$1=""; print substr($0,2)}'\''; fi'
alias notes="vim ~/Documents/notes"
alias vundle="vim +PluginInstall +qall"
newsvg() { echo '<?xml version="1.0" encoding="utf-8"?>' >> $1; }
verylegit() { url="$(curl -s verylegit.link/sketchify -d long_url=$1)"; echo "$url copied to clipboard"; echo $url | pbcopy }
whoorg() { whois $1 | awk '/Organization|org-name|descr|CustName|NetName|Customer|OrgTechName/ {$1=""; print substr($0,2)}' | sort -u }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
