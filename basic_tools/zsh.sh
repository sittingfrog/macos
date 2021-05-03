#!/bin/bash

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc ~/.zshrc_bak
ln -s "$HOME/code/macos/assets/.zshrc" ~/.zshrc
chmod u=rwx,g=rx,o=rx /usr/local/share/zsh
chmod u=rwx,g=rx,o=rx /usr/local/share/zsh/site-functions
