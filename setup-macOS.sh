#!/usr/bin/env bash

# XCode
echo "\n"
echo "First, you need to manually accept Apple's license agreement for Xcode." \
  "It should pop up right now. Look for the prompt in another window, then" \
  "come back here when it's done."

xcodebuild -license
echo "\n"
read -p "Xcode license accepted? Press enter to continue!"

echo "\n"
echo "Now we need to install Xcode command line tools. This will pop up in"
echo "another window. Come back here when it's done."
xcode-select --install

echo "\n"
read -p "Xcode installed? Press enter to continue!"

echo "\n"
echo "Now a ton of software is going to be installed automatically without" \
  "human interaction. This may take a while; about enough time to make an" \
  "especially delicious snacc..."

# Homebrew
echo "\n"
echo "Installing Homebrew package manager!"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n"
echo "Installing apps!"

# UI Apps
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask docker

# Apps
brew install \
  gh \
  git \
  nvm \
  zsh

# Zsh
echo "\n"
echo "Configuring Zsh."

# oh my zsh
echo "\n"
echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
echo "\n"
echo "Installing Powerlevel10k, a theme for Zsh"
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

sudo sh -c "/usr/local/bin/zsh" >>/etc/shells

##################################
# The following are interactive: #
##################################
echo "\n"
echo "A few more things need to be installed/configured that require human" \
  "interaction. Are you ready?"
read -p "Press enter to continue!"

chsh -s /usr/local/bin/zsh

# Varables needed for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Latest LTS release of node
echo "\n"
echo "Installing latest stable release of Node."
nvm install --lts
nvm install-latest-npm

# Yarn
echo "\n"
echo "Installing yarn package manager."
corepack enable
corepack prepare yarn@stable --activate

# VSCode extensions
echo "\n"
echo "Installing VSCode extensions"
set -- aaron-bond.better-comments BracketPairColorDLW.bracket-pair-color-dlw burkeholland.simple-react-snippets dbaeumer.vscode-eslint eamodio.gitlens ecmel.vscode-html-css esbenp.prettier-vscode formulahendry.auto-close-tag foxundermoon.shell-format Gruntfuggly.todo-tree mhutchie.git-graph mikestead.dotenv ms-azuretools.vscode-docker ms-vsliveshare.vsliveshare PKief.material-icon-theme Remisa.shellman rvest.vs-code-prettier-eslint streetsidesoftware.code-spell-checker timonwong.shellcheck VisualStudioExptTeam.intellicode-api-usage-examples VisualStudioExptTeam.vscodeintellicode wayou.vscode-todo-highlight
for i in "$@"; do
  code --install-extension "$i" --force
done

# Chrome
echo "\n"
echo "Setting up Google Chrome. Sign into account and set up extensions, including a password mananger. This will require user interaction."
read -p "Press enter to continue!"
open /Applications/Google\ Chrome.app

# Amphetamine
echo "\n"
echo "Download Amphetamine from the app store. This will require user interaction."
read -p "Press enter to continue!"
open https://apps.apple.com/us/app/amphetamine/id937984704?mt=12

# GitHub
echo "\n"
echo "Setting GitHub authentication. This will require user interaction."
read -p "Press enter to continue!"

gh auth login

# Setting up git config
echo "\n"
echo "Setting up your git config so your commits show the correct user in GitHub. This will require user interaction."
echo "\n"
echo "Update name to your GitHub username and email to your associated email address."
echo "\n"
echo "Press the i key to insert your changes. Then press the esc key to save those changes. Once your changes are saved enter ':wq' to write and quit."
read -p "Press enter to continue"
git config --global --edit

echo "\n"
echo "Installation and set up are complete! Happy coding!"
