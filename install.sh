#!/usr/bin/bash

set -e

NON_INTERACTIVE=${1:-false}
NVM_DIR=${HOME}/.nvm
ZSH=${HOME}/.zsh
ZSH_CUSTOM=${HOME}/.zsh/custom

if [ -d "${ZSH}" ]; then
  echo "ZSH already installed. Removing..."
  rm -rf ${ZSH}
fi

mkdir -m 777 -p ${NVM_DIR}

# install oh my zsh
sudo apt-get update
sudo apt-get install -y zsh
sudo curl -o- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# install nvm
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ${NVM_DIR}/nvm.sh
nvm install --lts

# install angular
npm install -g @angular/cli
npm install -g @ionic/cli
npm install -g npm

# git config
git config --global user.email "lightersenior@outlook.com"
git config --global user.name "Tanapat Saetiaw"
git config --global init.defaultBranch main
git config --global pull.rebase false

# personalize
cp zsh/.zshrc ${HOME}/.zshrc

# change default shell
chsh -s $(which zsh)
zsh