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

# UI Apps
echo "\n"
echo "Installing iterm2, Chrome, Firefox, VSCode & Docker."
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask docker

# Apps
echo "\n"
echo "Installing GitHub CLI, Git, NVM and Zsh."
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

echo "Installations complete! Restart terminal and run setup script."
