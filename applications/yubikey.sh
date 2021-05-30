#!/bin/bash

brew install opensc
brew install ykman
brew install yubico-piv-tool
brew install ykclient # potentially deprecated
brew install pam_yubico
brew install ykpers

# brew install opensc # not necessary but handy for smartcards
brew install yubikey-agent
brew services start yubikey-agent # adds agent to startup list