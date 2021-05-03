#!/bin/bash

brew install ykman
brew install yubikey-agent
brew install ykclient
brew install yubico-piv-tool
brew install pam_yubico
brew install ykpers

# Tool for generating google-cloud SA certificates
brew install swig # This is a dependency of google-yubikey
pip3 install google-yubikey