#!/bin/sh

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
