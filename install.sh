#!/usr/bin/bash

set -e

rm -rf ~/.zshrc
rm -rf ~/.oh-my-zsh

NVM_DIR=~/.nvm
ZSH_CUSTOM=~/.oh-my-zsh/custom

mkdir -m 777 -p ${NVM_DIR}

# install oh my zsh
apt-get update
apt-get install -y zsh
curl -o- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ${NVM_DIR}/nvm.sh
nvm install --lts

# install angular
npm install -g @angular/cli
npm install -g @ionic/cli
npm install -g npm

# install composer
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
mv composer.phar /usr/local/bin/composer

# git config
git config --global user.email "lightersenior@outlook.com"
git config --global user.name "Tanapat Saetiaw"
git config --global init.defaultBranch main
git config --global pull.rebase false

# personalize
cp zsh/.zshrc ~/.zshrc

# change default shell
zsh