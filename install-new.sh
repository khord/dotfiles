#!/bin/bash

# Optional flags
apps=false
while [ ! $# -eq 0 ]
do
  case "$1" in
    --apps)
      echo "Install apps option selected"
      apps=true
      ;;
  esac
  shift
done

if [ "$apps" = true ]; then
  # Install latest Viscosity VPN client
  (cd /tmp && curl -LO -w %{url_effective} https://www.sparklabs.com/downloads/Viscosity.dmg)
  sudo hdiutil attach /tmp/Viscosity.dmg
  sudo cp -R /Volumes/Viscosity/Viscosity.app /Applications
  sudo hdiutil detach /Volumes/Viscosity
  sudo /Applications/Viscosity.app/Contents/MacOS/Viscosity -installHelperTool YES

  # Install latest Chrome
  (cd /tmp && curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg)
  sudo hdiutil attach /tmp/googlechrome.dmg
  sudo cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Applications
  sudo hdiutil detach /Volumes/Google\ Chrome
  rm /tmp/googlechrome.dmg

  # Install latest Slack
  (cd /tmp && curl -LO -w %{url_effective} https://slack.com/ssb/download-osx)
  sudo hdiutil attach /tmp/download-osx
  sudo cp -R /Volumes/Slack.app/Slack.app /Applications
  sudo hdiutil detach /Volumes/Slack.app
  rm /tmp/download-osx

  # Install latest 1Password7
  (cd /tmp && curl -LO -w %{url_effective} https://app-updates.agilebits.com/download/OPM7)
  sudo mv /tmp/OPM7 /tmp/OPM7.pkg
  sudo installer -pkg /tmp/OPM7.pkg -target /
  rm /tmp/OPM7.pkg
fi

# Install HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Zsh Auto Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Download patched Meslo fonts
cd ~/Downloads && {
  curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
  curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
  curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
  curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'
  cd -; }

# Install Vim plugins with Vundle
vim +PluginInstall +qall

# NPM
npm i -g md-to-pdf
npm i -g svgexport

# Copy Viscosity VPN profiles from old laptop
# rsync -rtvP ~/Library/Application\ Support/Viscosity/OpenVPN khord@new-laptop:/Users/khord/Downloads

open ~/Downloads
