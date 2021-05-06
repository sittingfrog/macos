#!/bin/bash

brew install ykman
brew install yubico-piv-tool
brew install ykclient
brew install pam_yubico
brew install ykpers

# brew install opensc # not necessary but handy for smartcards
brew install yubikey-agent
brew services start yubikey-agent # adds agent to startup list