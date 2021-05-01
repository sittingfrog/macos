#!/bin/bash

echo '\n\n\n*** STOP *******************************************'
echo 'Virtualbox is about to be installed'
echo 'Carefully pay attention to on-screen prompts for permissions!'
echo 'Press any key when ready to continue...'; read -k1 -s;
brew install virtualbox --cask

# brew uninstall virtualbox --force --zap
