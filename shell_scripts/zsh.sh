#!/bin/bash

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc ~/.zshrc_bak
cp ./assets/.zshrc ~/.zshrc
