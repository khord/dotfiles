# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=$PATH:/Applications/VMware\ OVF\ Tool:/Users/khord/scripts/path:/usr/local/opt/avr-gcc@7/bin:/$GOPATH/bin

export TERM="xterm-256color"
export ZSH="/Users/khord/.oh-my-zsh"
export HISTCONTROL=ignorespace
export GOPATH="/Users/khord/go"
export MPLBACKEND="module://itermplot"
export ITERMPLOT=rv
export REPORTTIME=2
export KUBE_EDITOR="vim"
export ANSIBLE_COW_SELECTION="random"

# kustomize
export XDG_CONFIG_HOME=$HOME/.config
export GPG_TTY=$(tty)
source <(/usr/local/bin/kustomize completion zsh)

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' file-sort date

DEFAULT_USER="khord"
source <(kubectl completion zsh)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_TIME_BACKGROUND='grey50'
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

alias .z=". ~/.zshrc"
alias 1p='eval $(op signin simspace)'
alias 1plaptop='echo -n $(op get item AD --fields laptop) | pbcopy'
alias 1psudo='echo -n $(op get item AD --fields laptop) | sudo -S true'
alias bbd="(cd /Users/khord/dotfiles && exec brew bundle dump --force)"
alias boo="imgcat ~/Pictures/emojis/128px/boo-icon-128px.png"
alias h="history"
alias kbeap='kustomize build --enable_alpha_plugins'
alias lk="open -a ScreenSaverEngine"
alias mntbucket='open "smb://khord@bucket/data_share"'
alias myip='extip=$(dig +short myip.opendns.com @resolver1.opendns.com); if [ -z "$extip" ]; then echo "n/a"; else echo $extip && whois $extip | awk '\''/Organization|org-name|descr/ {$1=""; print substr($0,2)}'\''; fi'
alias notes="vim ~/Documents/notes"
alias simspace="imgcat ~/Pictures/emojis/128px/Light-Blue-128px.png"
alias slp="pmset sleepnow"
alias superscript="node ~/dotfiles/scripts/js/superscript.js"
alias vundle="vim +PluginInstall +qall"
alias wol="wakeonlan"
clean-downloads() { find ~/Downloads -type f \( -name "fv-key-*" -o -name "*.ovpn" -o -name "*.dmg" -o -name "*.msi" -o -name "*.bundle" \) -delete }
flyfi-stats() { curl -s http://www.flyfi.com/travel/ | awk '/flightAltitude|flightSpeed/ {print $2}' | tr -d "</span></li>" }
k8s-psql() { kubectl exec -it svc/postgres -- psql -U postgres -d range-data-server }
k8s-psql-host() { kubectl exec -it svc/postgres -- hostname }
mgmtagents() { ssh -t root@$1 "/etc/init.d/hostd restart; /etc/init.d/vpxa restart" }
newsvg() { echo '<?xml version="1.0" encoding="utf-8"?>' >> $1; }
verylegit() { url="$(curl -s verylegit.link/sketchify -d long_url=$1)"; echo "$url copied to clipboard"; echo $url | pbcopy }
whoorg() { whois $1 | awk '/Organization|org-name|descr|CustName|NetName|Customer|OrgTechName/ {$1=""; print substr($0,2)}' | sort -u }

# opam configuration
test -r /Users/khord/.opam/opam-init/init.zsh && . /Users/khord/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
